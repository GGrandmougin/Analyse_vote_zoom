unit Auxiliaire;
// Les suffrages exprimés sont les votes valablement émis dans le cadre d’une proposition mise aux voix ou d’une élection, les suffrages recueillis étant comptabilisés, déduction faite des abstentions ou des bulletins rejetés.

interface

uses
   ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdFTP, IdHTTP, OleCtrls, SHDocVw, SysUtils ;
{
à C3A0        195  160
ï C3AF        195  175
é C3A9  Ã©    195  169
è C3A8  Ã¨    195  168
ê C3AA        195  170
}

const

    rempl_acc : array[0..7 ,0.. 1] of string = (('a', char(195) + char(160)),   // à
                                                 ('i', char(195) + char(175)),  // ï
                                                 ('e', char(195) + char(169)),  // é
                                                 ('e', char(195) + char(168)),  // è
                                                 ('e', char(195) + char(170)),  // ê
                                                 (' ', char($C2) + char($A0)),
                                                 (char($AB), char($C2) + char($AB)),  // «
                                                 (char($BB), char($C2) + char($BB))) ; // »
        // manque ç et  a, i, o , u aver tréma et accent circonflexe
    col_pouvoirs = 1;
    col_pour = 2;
    col_contre = 3;


type
  tparticipant = class
    nom, prenom, region : string;
    numero : integer;
    pouvoirs : Byte	;
    p_en_erreur : boolean;
    constructor create(msg  : string);
    destructor destroy;  override;
  end;
  tmessage = class
    participant : tparticipant;
    texte : string;
    choix : string ;
    nombre : integer	;
    m_en_erreur : boolean;
    m_secret : boolean;
    err_choix : boolean;
    err_nombre : boolean;
    constructor create(idx_msg : integer; msg  : string; secret : boolean);
    destructor destroy;  override;
  end;
  taux = class
    lmessages : tstringlist;
    lvotes : tstringlist;
    lparticipants: tstringlist;
    lrejetes: tstringlist;
    lconfig: tstringlist;
    //lremplacement: tstringlist;
    procedure videlistes;
    procedure select_lvotes(heure, duree : string; secret, secret_exclusif : boolean);
    procedure traitement_lvotes;
    function remplace_accents(str : string): string;
    procedure pretraitement_lmsg;
    function getversion: String;
    function get_fichier_msg(rep : string) : string;
    procedure charge_fic_msg(fic : string);
    constructor create;
    destructor destroy;  override;
  private

  public

  end;

 procedure log_infos(mess : string; typ : integer = 0);
var
  Aux1 : taux;
  dir_exe : string;
  dir_trv : string;
  rep_msg_def: string;
  memo_tests : tstrings;
  debug : boolean;
  stringgrid1rowscount : integer;
  l_aff : tstringlist = nil;
implementation

var
   ficlog : string;


procedure log_infos(mess : string; typ : integer = 0);
var
   tf : textfile;
begin
   try
      assignfile(tf,ficlog);
      if fileexists(ficlog) then
         append(tf)
      else
         rewrite(tf);
      writeln(tf,datetostr(date)+' '+timetostr(time)+' '+ mess);
      { Insérer ici un code nécessitant un Flush avant de fermer le fichier }
      //Flush(tf);
      closefile(tf);
   except
      //pour ne pas ajouter l'erreur à l'erreur
   end;
end;

procedure taux.charge_fic_msg(fic: string);
begin
   videlistes;
   if fileexists(fic) then begin
      try
         lmessages.loadfromfile(fic);
      except
         on E: Exception do memo_tests.add('ERREUR: ' + E.Message + ' pour le fichier: ' + fic);
      end;
   end else begin
      log_infos('fichier des messages: ' + fic + ' non trouvé' );
   end;
   if lmessages.count > 0 then begin
      pretraitement_lmsg;
      if debug then memo_tests.Add('fichier messages chargé, nb lignes: ' + inttostr(lmessages.Count));
   end else begin
      if debug then memo_tests.Add('erreur chargement fichier');
      log_infos('problème au fichier des messages: ' + fic );
   end;
{
stringlist.loadfromfile(fichier_entree);
for i := stringlist.count -1 downto 0 do begin
   st := stringreplace(stringlist.lines[i] , 'à tout le monde'  , '', []);
   if len(st) = len(stringlist.lines[i]) then begin
      delete(i);
   end else begin
      stringlist.lines[i] := st;
   end;

end
}  //
end;

constructor taux.create;
begin
    lmessages := tstringlist.Create;
    lvotes := tstringlist.Create;
    lparticipants:= tstringlist.Create;
    lrejetes:= tstringlist.Create;
    lconfig:= tstringlist.Create;
    //lremplacement := tstringlist.Create;
    //lremplacement.Text := remplacc;
    dir_exe := extractfilepath(paramstr(0));
    dir_trv := dir_exe + 'tests';
    forcedirectories(dir_trv);
    dir_trv := dir_trv + '\';
    ficlog := dir_trv + 'infos.log';
    rep_msg_def := GetEnvironmentVariable('USERPROFILE') + '\documents\zoom\';
end;

destructor taux.destroy;
begin
    videlistes;
    lrejetes.free;
    lvotes.free;
    lmessages.free;
    lparticipants.free;
    lconfig.Free;
    //lremplacement.Free;
  inherited;
end;

procedure taux.videlistes;
begin
    lrejetes.clear;
    lvotes.clear;
    lconfig.Clear;
    while lmessages.Count > 0 do begin  //les tmessages seront créés lors de l'analyse d'un vote s'il n'existent pas déjà et reste sur cette liste
       lmessages.Objects[0].Free;  // destruction des tmessages
       lmessages.Delete(0);
    end;
    while lparticipants.Count > 0 do begin
       lparticipants.Objects[0].Free;  // destruction des tparticipant
       lparticipants.Delete(0);
    end;
end;

function Taux.getversion: String;
Var
  fic : string;
  taille    : DWord;
  buffer    : PChar;
  datas : PChar;
  len  : DWord;
Begin
  result:='';
  buffer := nil;
  fic := Application.ExeName;
  taille := GetFileVersionInfoSize(PChar(fic), taille);
  If Taille > 0 then begin
     try
       buffer := AllocMem(taille);
       GetFileVersionInfo(PChar(fic), 0, taille, buffer);
       If VerQueryValue(buffer, PChar('\StringFileInfo\040C04E4\FileVersion'), Pointer(datas), len) then
          result:=datas;
     finally
       if buffer <> nil then
          FreeMem(buffer, taille);
     end;
   end;
end;

function taux.get_fichier_msg(rep : string): string;
var
  sr: TSearchRec ;
  dt_rep : integer;
begin
   if debug then begin memo_tests.Add(''); memo_tests.Add(rep) end;
   dt_rep := 0;
   if FindFirst(rep + '*.*', faDirectory, sr) = 0 then begin
      repeat
         if Length(sr.Name)>= 20 then begin
            if debug then memo_tests.Add(sr.name + ' ' + datetimetostr(FileDateToDateTime(sr.Time))) ;
            if sr.Time > dt_rep then begin
               result := sr.Name;
               dt_rep := sr.time;
            end;
         end;
      until FindNext(sr) <> 0;
      FindClose(sr);
      if result <> '' then result := rep + result + '\meeting_saved_chat.txt' ;
      if debug then memo_tests.Add('-> ' + result);
   end;
end;



{ tparticipant }

constructor tparticipant.create(msg  : string);
begin
//
end;

destructor tparticipant.destroy;
begin
//
  inherited;
end;

{ tmessage }

constructor tmessage.create(idx_msg : integer; msg  : string; secret : boolean);
var
   st, tlm_scrt, nb : string;
   v, i : integer;
   lttr , ch : boolean ;
   nbgrl, nbgrc : integer;
   dans_grl, dans_grc : boolean;
begin
   participant := tparticipant.create(msg );
   m_secret := secret;
   texte := msg;
   nbgrl := 0;
   nbgrc := 0;
   dans_grl := false;
   dans_grc := false;
   nombre := 0;
   if m_secret then tlm_scrt := 'RET :' else tlm_scrt := 'TLM :';
   st := lowercase(rightstr(msg ,length(msg) - pos( tlm_scrt, st) - 4));
   for i := 1 to length(st) do begin
      v := ord(st[i]);
      if (v > 96) and (v < 123) then begin  // lettre
         if not dans_grl then inc(nbgrl);
         dans_grl := true;
         if nbgrl = 1 then choix := choix + st[i];
      end else begin
         dans_grl := false;
      end;
      if choix = 'abstention' then choix := 'abs';
      if (choix <> 'pour') and (choix <> 'contre') and (choix <> 'abs') then choix := '';
      if  (v > 47) and (v < 58) then begin // chiffre
         if not dans_grc then inc(nbgrc);
         dans_grc := true;
         if nbgrc = 1 then nb := nb + st[i];
      end else begin
         dans_grc := false;
      end;
      if nb <> '' then nombre := strtoint(nb);
      err_choix := (nbgrl <> 1) and (choix <> '');
      if nbgrc = 0 then nombre := 1;
      err_nombre := (nombre <>1) and ((nbgrc <> 1) or (nombre = 0));
   end;
end;

destructor tmessage.destroy;
begin
//
  inherited;
end;

procedure taux.pretraitement_lmsg;
var
   i, n : integer;

begin
   n := 0;
   for i := lmessages.Count - 1 downto 1  do begin
      if (lmessages.Strings[i][3] <> ':') or (lmessages.Strings[i][6] <> ':') then begin
         inc(n);
         lmessages.Strings[i - 1] := lmessages.Strings[i - 1] + ' _ ' + lmessages.Strings[i] ;
         lmessages.Delete(i);
      end else if pos('configutaion votes', lmessages.Strings[i]) > 0 then begin
         lconfig.Add(lmessages.Strings[i]) ;
      end;
   end;
   if debug then begin
      memo_tests.Add('pretraitement_lmsg: ' + inttostr(n) + ' lignes concaténées');
      memo_tests.Add('pretraitement_lmsg: ' + inttostr(lconfig.Count) + ' msg config');
   end;
end;

procedure taux.select_lvotes(heure, duree: string ; secret, secret_exclusif : boolean);
var
   hfin : string;
   i : integer;
begin
   i := -1;
   lvotes.Clear;
   hfin := TimeToStr(strtotime(heure) + strtotime( '00:' + duree));
   if debug then memo_tests.add('sélection de ' + heure + ' à ' + hfin);
   repeat
      inc(i)
   until (i >= lmessages.Count) or (heure < lmessages.Strings[i]);

   while (i < lmessages.Count) and (lmessages.Strings[i] < hfin) do begin
      lvotes.AddObject(lmessages.Strings[i], tobject(i));
      inc(i);
   end;
   if debug then memo_tests.add( inttostr(lvotes.Count) + ' messages sélectionnés');
   traitement_lvotes; // filtrage "tout le monde" , "secret" , 'secret uniquement"
end;

procedure taux.traitement_lvotes;
var
   i, idx_msg ,p  : integer;
   st, nv : string;
   tlm, secret : boolean;
   msg  : tmessage;
begin    
   for i := lvotes.Count -1 downto 0 do begin
      idx_msg := integer(lvotes.Objects[i]);
      if lmessages.Objects[idx_msg] = nil then begin
         tlm := true;
         secret := false;
         st := lvotes.Strings[i] ;
         nv := stringreplace(lvotes.strings[i] , 'Ã   Tout le monde'   , 'TLM', []);  // char(195) + char(160) = à  // char(195) + char(160) + ' Tout le monde'
         if length(nv) = length(st) then begin
            tlm := false;
            p := pos('(Message direct)', st);
            if p > 0   then begin
               secret := true;
               nv := copy(st, 1, pos(char(195) + char(160), st) -1) + 'SECRET' + rightstr(st, length(st) - p - 16);
            end;
         end;
         if secret or tlm then begin
            nv := remplace_accents(nv);
            //création objet message
            msg := tmessage.create(idx_msg, nv, secret); // dans create : lmessages.Objects[idx_msg] := msg;
            lvotes.strings[i] := nv;
         end else begin
            lvotes.delete(i);
         end;
      end else begin


      end;
   end;
   if debug then memo_tests.add( inttostr(lvotes.Count) + ' messages filtrés');
end;

function taux.remplace_accents(str : string) : string;
var
   i : integer;
begin
   result := str;
   for i := 0 to high(rempl_acc) do begin
      result := StringReplace(result, rempl_acc[i, 1]  , rempl_acc[i, 0] , [rfReplaceAll] );
   end;

end;

(*procedure taux.charge_fic_msg(fic: string);
var
   strm : tmemorystream;
   tf : textfile;
   st, s2 : string;
   buf : array[0.. 10000] of byte;
   i : integer;
begin
   videlistes;
   strm := tmemorystream.create;
   if fileexists(fic) then begin
      try
         //lmessages.loadfromfile(fic);
         Strm.loadfromfile(fic);
         strm.Position := 0;
         strm.Read(buf, 10000);
         for i := 0 to 9999 do begin
            if buf[i] = 10 then begin
               lmessages.Add(st);
               st := '';
            end else if buf[i] = 13 then begin
            end else begin
               if buf[i] > 127 then begin
                  s2 := char(buf[i]);
                  showmessage( inttostr(i) + '  ' + inttostr(buf[i]) + '  ' + s2);
               end;
               st := st + char(buf[i]);
            end;
         end;
         //lmessages.LoadFromstream(strm);
         {assignfile(tf,fic);
         reset(tf);
         while not eof(tf) do begin
            readln(tf,st);
            lmessages.Add(st);
         end;
         closefile(tf); }
      exce
         on E: Exception do memo_tests.add('ERREUR: ' + E.Message + ' pour le fichier: ' + fic);
      end;
   end else begin
      log_infos('fichier des messages: ' + fic + ' non trouvé' );
   end;
   if lmessages.count > 0 then begin
      pretraitement_lmsg;
      if debug then memo_tests.Add('fichier messages chargé, nb lignes: ' + inttostr(lmessages.Count));
   end else begin
      if debug then memo_tests.Add('erreur chargement fichier');
      log_infos('problème au fichier des messages: ' + fic );
   end;

   strm.free;
end;*)

{ STRUCTURE _______________________________________________________________________________________

******* un objet tvote par N° de vote comprenant une tstringlist de type lvote

******* rechargement  de meeting_saved_chat.txt  venant du même dossier -> ajout des nouvelles ligne au lmessage existant (conservation des tmessages existants)


}
end.

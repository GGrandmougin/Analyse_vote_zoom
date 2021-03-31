unit Auxiliaire;
// Les suffrages exprimés sont les votes valablement émis dans le cadre d’une proposition mise aux voix ou d’une élection, les suffrages recueillis étant comptabilisés, déduction faite des abstentions ou des bulletins rejetés.

interface

uses
   ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdFTP, IdHTTP, OleCtrls, SHDocVw, SysUtils, Grids ;


const

    rempl_acc : array[0..7 ,0.. 1] of string = (('a', char(195) + char(160)),   // à  160
                                                 ('i', char(195) + char(175)),  // ï  175
                                                 ('e', char(195) + char(169)),  // é  169
                                                 ('e', char(195) + char(168)),  // è  168
                                                 ('e', char(195) + char(170)),  // ê  170
                                                 (' ', char($C2) + char($A0)),
                                                 (char($AB), char($C2) + char($AB)),  // «
                                                 (char($BB), char($C2) + char($BB))) ; // »
        // manque ç et  a, i, o , u  avec tréma et accent circonflexe ,…(133) ,
    col_pouvoirs = 1;
    col_pour = 2;
    col_contre = 3;
    col_abs = 4;
    col_nonexpr = 5;
    col_ID = 6;
    col_nom = 7;
    col_prenom = 8;
    col_No = 9;
    col_region = 10;
    col_suffrage = 11;
    col_err_pouvoirs = 12;
    col_nombre = 13;
    col_choix = 14;
    tb_regions : array[0.. 21] of string = ('fra', 'etr', 'als', 'aqi', 'auv', 'bfc', 'bre', 'cen', 'cha', 'caz', 'fla', 'idf', 'lan', 'lor', 'mip', 'nmd', 'plf', 'plo', 'pch', 'prv', 'ral', 'run');    // specifique Mensa


type
  ttbnoms = array[0..9] of string;
  tliste_vote = record//tstringlist;
     idx_deb : integer;
     idx_fin : integer;
  end;
  tliste_message = tstringlist;
  telement_scrutin = class;
  tscrutin = class;
  tparticipant = class
    nom, prenom, region : string;
    texte : string;
    tbnom : ttbnoms;
    numero : integer;
    pouvoirs : Byte	;
    partage_nomembre : boolean;
    electeur_legitime : boolean;
    element_scrutin : telement_scrutin; // reinitialisé à chaque chagement de scrutin
    no_legitime : boolean; // retrouvé dans liste pouvoirs ou autre
    err_region, err_prenom, err_nom, err_num, err_ID : boolean;
    //p_en_erreur : boolean;
    function rejected : boolean;
    function affichage_p(ligne : tstrings; filtre : string) : boolean;
    constructor create(msg  : string);
    destructor destroy;  override;
  end;
  tmessage = class
    participant : tparticipant;
    msg_pre_dans_choix : tmessage; // reinitialisé à chaque chagement de scrutin
    texte : string;
    choix : string ;
    nombre : integer	;
    nb_final : boolean;  // à true si message unique ou le dernier pour le particpant dans ce choix
    //stg_clear : TStringlist;
    //m_en_erreur : boolean;  rempacé par function rejected
    m_secret : boolean;
    err_choix : boolean;
    err_nombre : boolean;
    est_vote : boolean;
    function rejected : boolean;
    function affichage_m(ligne: tstrings; rejets, vnr : boolean; filtre: string = '') : boolean;
    function cherche_participant(msg : string): tparticipant ;
    constructor create(idx_msg : integer; msg  : string; secret : boolean; lmsg : tliste_message = nil);
    destructor destroy;  override;
  end;
  telement_scrutin = class
    participant : tparticipant;
    msg_pour : tmessage;
    msg_abs  : tmessage;
    ms_contre: tmessage;
    constructor create;
    destructor destroy;  override;
  end;
  tscrutin = class
    numero : integer;
    nom : string;
    heure_debut : string;
    duree : string;
    fichier_message: string;
    fichier_pouvoirs : string;
    nombre_membres : integer;
    //nombre_votants : integer;
    ttl_pour, ttl_contre, ttl_abs, ttl_exp, ttl_votants : integer;
    lelement_scrutin : tstringlist;
    liste_votes : tliste_vote;
    scr_secret : boolean;
    secret_only : boolean;
    liste_message : tliste_message;
    procedure decomptage;
    procedure maj_resultats;
    procedure init_totaux;
    constructor create(num : integer; nm : string);
    destructor destroy;  override;
  end;
  taux = class
    lmessages_gen : tliste_message;
    lvotes_dbg : tliste_vote;
    lparticipants: tstringlist;
    //lrejetes: tstringlist;   inutile ?
    lconfig: tstringlist;
    lnmembre2index : tstringlist; // couple names=values   no_de_membre=index_dans_lparticipants   tparticipant dans objet
    lscrutin : tstringlist;
    scrutin_encours : tscrutin;
    //lremplacement: tstringlist;
    procedure videlistes;
    function select_lvotes(heure, duree : string; secret, secret_exclusif : boolean; lmsg : tliste_message ;lvotes: tliste_vote ): tliste_vote;
    procedure traitement_lvotes(lvotes: tliste_vote; lmsg : tliste_message  );
    function aff_lvote(stringgrid: tstringgrid; rejetes, vnr : boolean ;filtre: string; lmsg : tliste_message ; lvotes: tliste_vote ): integer;
    function remplace_accents(str : string): string;
    procedure pretraitement_lmsg( lmsg : tliste_message); // concaténation et recherche configuration
    function getversion: String;
    function get_fichier_msg(rep : string) : string;
    function charge_fic_msg(fic: string; lmsg : tliste_message ): boolean;
    procedure traitement;
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
  strgrd_colcount : integer;
  l_aff : tstringlist = nil;
   Epour_, Econtre_, Eabs_, Enon_exp_, Evotants_ : tedit;
   Ep_ppc_exp_,Ec_ppc_exp_, Ea_ppc_exp_ : tedit;
   Ep_ppc_nbmb_, Ec_ppc_nbmb_, Ea_ppc_nbmb_, Ene_ppc_nbmb_, Ev_ppc_nbmb_ : tedit;
implementation

var
   ficlog : string;


procedure log_infos(mess : string; typ : integer = 0);
var
   tf : textfile;
begin
   try
      if debug then memo_tests.Add(mess);
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

function taux.charge_fic_msg(fic: string; lmsg : tliste_message): boolean;
var
   lmessages, lmfic : tstringlist;
   i : integer;
begin
   result := false;
   if lmsg = nil then lmessages := lmessages_gen else lmessages := lmsg;
   if lmessages.Count = 0 then lmfic := lmessages else lmfic := TStringList.Create;
   if fileexists(fic) then begin
      try
         lmfic.loadfromfile(fic);
         result := lmfic.Count > 0;
      except
         on E: Exception do log_infos('ERREUR: ' + E.Message + ' pour le fichier: ' + fic); // log_infos dupplique l message dans memo_tests
      end;
   end else begin
      log_infos('fichier des messages: ' + fic + ' non trouvé' );
   end;
   if result then begin
      if lmfic.count > 0 then begin
         pretraitement_lmsg(lmfic);
         if debug then memo_tests.Add('fichier messages chargé, nb lignes: ' + inttostr(lmessages.Count));
      end else begin
         if debug then memo_tests.Add('erreur chargement fichier');
         log_infos('problème au fichier des messages: ' + fic );
      end;
      if (lmfic <> lmessages) and (lmfic.Count > lmessages.Count)  then begin
         for i := lmessages.Count to lmfic.Count - 1 do begin
            lmessages.Add(lmfic[i]);
         end;
      end;
   end;
   if lmfic <> lmessages then lmfic.Free;
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
    lnmembre2index := tstringlist.create;
    lnmembre2index.Sorted := true;
    lnmembre2index.Duplicates := dupAccept;
    lmessages_gen := tstringlist.Create;
    //lvotes_dbg := tstringlist.Create;
    lvotes_dbg.idx_deb := -1;
    lvotes_dbg.idx_fin := -1;
    lparticipants:= tstringlist.Create;
    //lrejetes:= tstringlist.Create;
    lconfig:= tstringlist.Create;
    lscrutin := tstringlist.Create;
    //lremplacement := tstringlist.Create;
    //lremplacement.Text := remplacc;
    dir_exe := extractfilepath(paramstr(0));
    dir_trv := dir_exe + 'tests';
    forcedirectories(dir_trv);
    dir_trv := dir_trv + '\';
    ficlog := dir_trv + 'infos.log';
    rep_msg_def := GetEnvironmentVariable('USERPROFILE') + '\documents\zoom\';
    scrutin_encours := nil;
end;

destructor taux.destroy;
begin
    videlistes;
    lnmembre2index.Free;
    //lrejetes.free;
    lvotes_dbg.idx_deb := -1;
    lvotes_dbg.idx_fin := -1;
    lmessages_gen.free;
    lparticipants.free;
    lconfig.Free;
    lscrutin.Free;
    //lremplacement.Free;
  inherited;
end;

procedure taux.videlistes;
begin
    //lrejetes.clear;
    lvotes_dbg.idx_deb := -1;
    lvotes_dbg.idx_fin := -1;
    lconfig.Clear;
    lnmembre2index.Clear;
    while lmessages_gen.Count > 0 do begin  //les tmessages seront créés lors de l'analyse d'un vote s'il n'existent pas déjà et reste sur cette liste
       lmessages_gen.Objects[0].Free;  // destruction des tmessages
       lmessages_gen.Delete(0);
    end;
    while lparticipants.Count > 0 do begin
       lparticipants.Objects[0].Free;  // destruction des tparticipant
       lparticipants.Delete(0);
    end;
    while lscrutin.Count > 0 do begin
       lscrutin.Objects[0].Free;  // destruction des tscrutin
       lscrutin.Delete(0);
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


constructor tparticipant.create(msg  : string); // msg mis à lowercase dans fonction appelante cherche_participant
var
   nbgrl, nbgrc, i, v, j : integer;
   dans_grl, dans_grc : boolean;
   nb : string;
begin
   err_region := true;
   err_prenom := false;
   err_nom := false;
   err_num := false;
   err_ID := false;
   numero := 0;
   nbgrl := 0;
   nbgrc := 0;
   dans_grl := false;
   dans_grc := false;
   pouvoirs := 1;
   partage_nomembre := false;
   no_legitime := true; // rtrouvé dans liste pouvoirs ou autre
   for i := 1 to length(msg) do begin
      v := ord(msg[i]);
      if ((v > 96) and (v < 123)) or (v in [45, 39]) then begin  // lettres  + "-" + "'"
         if not dans_grl then begin
            if tbnom[nbgrl] = '-' then tbnom[nbgrl] := '' else inc(nbgrl);
         end;
         dans_grl := true;
         if nbgrl <= high(tbnom)  then tbnom[nbgrl] := tbnom[nbgrl] + msg[i];
      end else begin
         dans_grl := false;
      end;
      if  (v > 47) and (v < 58) then begin // chiffre
         if not dans_grc then inc(nbgrc);
         dans_grc := true;
         if nbgrc = 1 then nb := nb + msg[i];
      end else begin
         dans_grc := false;
      end;
   end;
   if nb <> '' then numero := strtoint(nb);
   err_ID := nbgrl < 3 ;
   for i := 0 to high(tbnom) do begin
      if (length(tbnom[i]) = 3) and err_region then begin    // specifique Mensa
         j := 0;
         while (j <= high(tb_regions)) and err_region do begin
            err_region := not (tbnom[i] = tb_regions[j]);
            inc(j);
         end;
         if not err_region then region := tbnom[i];
      end;
   end;
   err_num := (nbgrc <> 1) or (numero = 0);
   if not err_num then begin
      err_num := aux1.lnmembre2index.IndexOfName(nb) >= 0;
      if err_num then no_legitime := false;
   end;
   aux1.lnmembre2index.AddObject(nb + '=' + inttostr(aux1.lparticipants.Count), self);
   electeur_legitime := true;
   texte := msg;
   aux1.lparticipants.AddObject(msg, self);
end;

function tparticipant.rejected: boolean;
begin
   result := err_ID or err_region or err_prenom or err_nom or (err_num and not no_legitime) ;
end;

destructor tparticipant.destroy;
begin
//
  inherited;
end;

function tparticipant.affichage_p(ligne: tstrings; filtre: string): boolean;
var
   flt : string;
begin
   flt := lowercase(trim(filtre));
   result := ((filtre = '') or (flt = copy(texte, 1, length(flt)))); // texte uniquement lowercase
   if result then begin
      ligne[col_pouvoirs] := inttostr(pouvoirs);
      if err_nom then ligne[col_nom] := 'X';
      if err_prenom then ligne[col_prenom] := 'X';
      if err_region then ligne[col_region] := 'X';
      if err_num then ligne[col_No] := 'X';
      if rejected then ligne[col_ID] := 'X';
      {if err_ then ligne[col_] := 'X';
      if err_ then ligne[col_] := 'X';   }
   end;
end;


{ tmessage }

function tmessage.affichage_m(ligne: tstrings; rejets, vnr : boolean; filtre: string = ''): boolean;
begin
   result := ((not rejets) or rejected ); // rejected prend aussi en compte participant.rejected
   result := (vnr or est_vote) and result ;
   result := result and participant.affichage_p(ligne,  filtre) ;// il faut que affichage_p  soit appellé dans tous les cas
   if result then begin
      ligne[0] := texte;
      if err_choix then ligne[col_choix] := 'X';
      if err_nombre then ligne[col_nombre] := 'X';
      if err_choix or err_nombre then ligne[col_suffrage] := 'X';  // sera peut-être rempli aussi par le controle des pouvoirs
      if choix = 'pour' then ligne[col_pour] := inttostr(nombre) else
      if choix = 'contre' then ligne[col_contre] := inttostr(nombre) else
      if choix = 'abs' then ligne[col_abs] := inttostr(nombre) ; // sera éventuellement réécrit par la recherche du dernier message concernant ce choix
      //ligne[col_] := ;
   end;;
end;

function tmessage.cherche_participant(msg: string): tparticipant;
var
   p, i : integer;
   st : string;
begin
   p := pos('TLM :' , msg);
   if p = 0 then p := pos('SECRET :' , msg);
   st := lowercase(copy(msg, 14 , p - 15));
   i := Aux1.lparticipants.IndexOf(st);
   if i >= 0 then begin
      result := tparticipant(Aux1.lparticipants.objects[i]);
   end else begin
      result := tparticipant.create(st);
   end;
end;

constructor tmessage.create(idx_msg : integer; msg  : string; secret : boolean ; lmsg : tliste_message = nil);
var
   st, tlm_scrt, nb : string;
   v, i : integer;
   nbgrl, nbgrc : integer;
   dans_grl, dans_grc : boolean;
   lmessages : tstringlist;
begin
   {stg_clear := TStringList.Create;
   for i := 1 to strgrd_colcount do stg_clear.Add(''); }
   if lmsg = nil then lmessages := aux1.lmessages_gen else lmessages := lmsg;
   participant := cherche_participant(msg);  //tparticipant.create(msg );
   m_secret := secret;
   texte := msg;
   nbgrl := 0;
   nbgrc := 0;
   dans_grl := false;
   dans_grc := false;
   nombre := 0;
   if m_secret then tlm_scrt := 'RET :' else tlm_scrt := 'TLM :';
   st := lowercase(rightstr(msg ,length(msg) - pos( tlm_scrt, msg) - 4));
   for i := 1 to length(st) do begin
      v := ord(st[i]);
      if (v > 96) and (v < 123) then begin  // lettre
         if not dans_grl then inc(nbgrl);
         dans_grl := true;
         if nbgrl = 1 then choix := choix + st[i];
      end else begin
         dans_grl := false;
      end;
      if  (v > 47) and (v < 58) then begin // chiffre
         if not dans_grc then inc(nbgrc);
         dans_grc := true;
         if nbgrc = 1 then nb := nb + st[i];
      end else begin
         dans_grc := false;
      end;
   end;
   if choix = 'abstention' then choix := 'abs';
   err_choix :=  (choix = 'oui') or (choix = 'non');
   if not((choix = 'pour') or (choix = 'contre') or (choix = 'abs') or (choix = 'oui') or (choix = 'non')) then choix := '';
   if nb <> '' then nombre := strtoint(nb);
   err_choix := err_choix and (nbgrl <> 1) or (choix = '');
   if nbgrc = 0 then nombre := 1;
   err_nombre := (nbgrc > 1) ; //(nombre <>1) and ((nbgrc <> 1) or (nombre = 0));
   est_vote := participant.electeur_legitime and (nbgrl < 6 ) and ( nbgrc < 4);
   lmessages.Objects[idx_msg] := self;
end;

function tmessage.rejected: boolean;
begin
   result := err_choix or err_nombre or participant.rejected;
end;

destructor tmessage.destroy;
begin
  //stg_clear.free;
  inherited;
end;

procedure taux.pretraitement_lmsg( lmsg : tliste_message );  // concaténation et recherche configuration
var
   i, n : integer;
   lmessages: tstringlist;
begin
   if lmsg = nil then lmessages := lmessages_gen else lmessages := lmsg;
   n := 0;
   for i := lmessages.Count - 1 downto 1  do begin
      if (length(lmessages.Strings[i]) < 13 ) or (lmessages.Strings[i][3] <> ':') or (lmessages.Strings[i][6] <> ':') then begin
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

function taux.select_lvotes(heure, duree: string ; secret, secret_exclusif : boolean; lmsg : tliste_message ; lvotes: tliste_vote ): tliste_vote;
var
   hfin : string;
   i : integer;
   lmessages : tstringlist;
begin
   i := -1;
   lvotes_dbg.idx_deb := -1;
   lvotes_dbg.idx_fin := -1;
   lmessages := lmsg;
   hfin := TimeToStr(strtotime(heure) + strtotime( '00:' + duree));
   if debug then memo_tests.add('sélection de ' + heure + ' à ' + hfin);
   repeat
      inc(i)
   until (i >= lmessages.Count) or (heure < lmessages.Strings[i]);
   if i < lmessages.Count then lvotes.idx_deb := i;
   while (i < lmessages.Count) and (lmessages.Strings[i] < hfin) do begin
      lvotes.idx_fin := i;
      inc(i);
   end;
   if debug then memo_tests.add( inttostr(lvotes.idx_fin - lvotes.idx_fin * 1) + ' messages sélectionnés');
   traitement_lvotes(lvotes, lmsg); // filtrage "tout le monde" , "secret" , 'secret uniquement"
end;

procedure taux.traitement_lvotes(lvotes: tliste_vote; lmsg : tliste_message   );
var
   idx_msg ,p  : integer;
   st, nv : string;
   tlm, secret : boolean;
   lmessages: tstringlist;
   //msg  : tmessage;
begin
   lmessages := lmsg;
   if lvotes.idx_deb > 0 then begin
      for idx_msg := lvotes.idx_deb to lvotes.idx_fin do begin
         if lmessages.Objects[idx_msg] = nil then begin
            tlm := true;
            secret := false;
            st := lmessages.Strings[idx_msg] ;
            nv := stringreplace(st , 'Ã   Tout le monde'   , 'TLM', []);  // char(195) + char(160) = à  // char(195) + char(160) + ' Tout le monde'
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
               tmessage.create(idx_msg, nv, secret); // dans create : lmessages.Objects[idx_msg] := msg;
               //lvotes.strings[i] := nv;
            end else begin
               if debug then log_infos('message ni TLM ni SECRET: ' + nv);
            end;
         {end else begin
            lvotes.strings[i] := tmessage(lmessages.Objects[idx_msg]).texte; }
         end;
      end;
   end;
   //if debug then memo_tests.add( inttostr(lvotes.Count) + ' messages filtrés');
   if debug then memo_tests.add( inttostr(lparticipants.Count) + ' tparticipants');
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

procedure taux.traitement;
var
   st : string;
begin
   with scrutin_encours do begin
      if charge_fic_msg(fichier_message, liste_message) then begin
         liste_votes := select_lvotes(heure_debut, duree, scr_secret, secret_only, liste_message, liste_votes);
         decomptage;
      end else begin
         st := 'fichier message invalide: ' + fichier_message;
         fichier_message := '';
         log_infos(st);
         ShowMessage(st);
      end;
   end;
end;

function taux.aff_lvote(stringgrid: tstringgrid; rejetes, vnr : boolean ;filtre: string; lmsg : tliste_message ; lvotes: tliste_vote ): integer;
var
   i, j : integer;
   lmessages: tstringlist;
begin
   j := 0;
   lmessages := lmsg;
   i := lvotes.idx_deb;
   while (i >= 0) and ((i <= lvotes.idx_fin) and (j < stringgrid.RowCount)) do begin
      try
         if tmessage(lmessages.Objects[i]).affichage_m(stringgrid.Rows[j], rejetes, vnr, filtre) then inc(j);
      except
         on E: exception do begin
            log_infos('Erreur dans aff_lvote (index:' + inttostr(i) + ') ' + E.Message);
         end;
      end;
      inc(i);
   end;
   result := j;
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



{ telement_scrutin }

constructor telement_scrutin.create;
begin

end;

procedure tscrutin.decomptage;
var
   i : integer;
   part : tparticipant;
   msg : tmessage;
begin
   for i := liste_votes.idx_deb to liste_votes.idx_fin do begin
      msg := tmessage(liste_message.Objects[i]);
   end;
end;

destructor telement_scrutin.destroy;
begin
  //
  inherited;
end;

{ tscrutin }

procedure tscrutin.maj_resultats;
begin
   if (ttl_votants = 0) or (ttl_exp = 0) or (nombre_membres = 0)  then begin
      Ep_ppc_exp_.text := '0' ; Ep_ppc_nbmb_.text := '0' ;
      Ep_ppc_exp_.text := '0' ; Ec_ppc_nbmb_.text := '0' ;
      Ea_ppc_exp_.text := '0' ; Ea_ppc_nbmb_.text := '0' ;
      Ene_ppc_nbmb_.text := '0' ; Ev_ppc_nbmb_.text := '0' ;
   end else begin
      Ep_ppc_exp_.text := inttostr(100 * 100 * ttl_pour div ttl_exp) ; Ep_ppc_nbmb_.text := inttostr(100 * ttl_pour div nombre_membres) ;
      Ep_ppc_exp_.text := inttostr(100 * ttl_contre div ttl_exp) ; Ec_ppc_nbmb_.text := inttostr(100 * ttl_contre) ;
      Ea_ppc_exp_.text := inttostr(100 * ttl_abs div ttl_exp) ; Ea_ppc_nbmb_.text := inttostr(100 * ttl_abs) ;
      Ene_ppc_nbmb_.text := inttostr(100 * (ttl_votants - ttl_exp) div ttl_exp) ; Ev_ppc_nbmb_.text := inttostr(100 * ttl_votants) ;
   end ;
   Epour_.text := inttostr(ttl_pour) ; Econtre_.text := inttostr(ttl_contre) ; Eabs_.text := inttostr(ttl_abs) ; Enon_exp_.text := inttostr(ttl_votants - ttl_exp) ; Evotants_.text := inttostr(ttl_votants) ;
end;

constructor tscrutin.create(num : integer; nm : string);
begin
   numero := num;
   nom := nm;
   lelement_scrutin := tstringlist.Create;
   //liste_votes := tstringlist.Create;
   liste_votes.idx_deb := -1;
   liste_votes.idx_fin := -1;
   aux1.lscrutin.AddObject(inttostr(num), self);
   init_totaux;
   scr_secret := false;
   secret_only := false;
   liste_message := aux1.lmessages_gen;
end;

destructor tscrutin.destroy;
begin
   while lelement_scrutin.Count > 0 do begin
    lelement_scrutin.Objects[0].Free;  // destruction des telement_scrutin
    lelement_scrutin.Delete(0);
   end;
   lelement_scrutin.Free;
   inherited;
end;

procedure tscrutin.init_totaux;
begin
   ttl_pour :=0; ttl_contre :=0; ttl_abs :=0; ttl_exp :=0; ttl_votants :=0;
end;


end.

unit commun;



interface

Uses
   ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms, SysUtils;

const
    //Voir aussi : Convertit une chaîne codée en Ansi vers UTF-8.
    //function Utf8ToAnsi(const S: UTF8String): string;
    configuration_votes = 'configuration votes';// 'config_votes' ? // exemple :  <configuration votes  fichier pouvoirs local cas_tests\1\ExempleExport.csv>
    tableau_regions = 'tableau regions' ;  // séparation par des virgules, casse et espaces infifférents, format fixe : 3 aractères, exemple :  <configuration votes tableau_regions xyz, ert, ghg ,ilj,   rts, mpp
    fichier_pouvoirs_local = 'fichier pouvoirs local';  // exemple: <configuration votes fichier pouvoirs local C:\tests\exemple.txt>
            import_differe = 'import differe' ; // pour debug, ne lance pas l'import dès la lesture de la config , exemple: <configuration votes fichier import differe pouvoirs local C:\tests\exemple.txt>
    fichier_pouvoirs_FTP = 'fichier pouvoirs FTP'; //  paramètres texte (entre ") dans l'odre serveur_FTP, login_FTP, Mot_passe_FTP, exemple:  <configuration votes fichier pouvoirs FTP "ExempleExport.csv" "machin@truc.org" "fh4v55FGJbd"
    nom_heure_duree = 'nom heure duree' ; // '"nom"_heure_duree' ?// exemple <configuration votes nom heure duree "1er vote" 16:22:00 05:00> , exemple minimal <configuration votes nom heure duree "" 16:22:00 05:00>



    remplAcc  : array[0..63 ] of byte = (
                           97,97,97,97,97,97,198,99,101,101,101,101,105,105,105,105,
                           208,110,111,111,111,111,111,215,216,117,117,117,117,221,222,223,
                           97,97,97,227,97,229,230,99,101,101,101,101,105,105,105,105,
                           240,110,111,111,111,245,111,247,248,117,117,117,117,117,254,255);
    IDMandataire = 0;
    NomMandataire = 1;
    PrenomMandataire = 2;
    MailMandataire = 3;
    RegionMandataire = 4;
    IDMandant = 5;
    NomMandant =6;
    PrenomMandant = 7;
    MailMandant = 8;
    RegionMandant = 9;
    DateEnvoisPouvoir = 10;
    DateReceptionPouvoir = 11;

    lb_n_secret = 0;
    lb_secret_s = 1;
    lb_secret_t = 2;

    max_interval = 500  ; // milllisecondes
type
    timport = procedure(strl: Tstringlist; fichier : string) of object;
    tmerge_fic = function(l_mess : TStringList) : tstringlist;
    tliste_message = tstringlist;

procedure log_infos(mess : string; typ : integer = 0; memo : tmemo = nil);
procedure setCbPouvoirschecked(ok : boolean = true) ;
procedure show_message( texte : string; mtype :TMsgDlgType);
procedure pretraitement_lmsg( lmsg, l_cfg : tliste_message; mtests : tstrings); // concaténation et recherche configuration

var
   debug : boolean;
   ficlog : string;
   dir_exe : string;
   dir_trv : string;
   procedure_test : TNotifyEvent;
   memo_tests : tstrings;
   //p_traite_pouvoirs : TNotifyEvent;
   p_traite_pouvoirs : timport;
   a_merge_fichier : tmerge_fic;
   cb_pouv_val : TCheckBox;
   cbpouvoirs_Checked : boolean = false;
   //nbPouvoirsConfies : TCheckBox;
   lfic_pouvoirs : tlabel;
   titre_reunion : string;
   fichier_message_defaut : string;
   source_pouvoirs : string;
   nb_pouvoirs_max : integer;
   enable_efic_msg : boolean = true;
   sl_pv_disp  : TStringList ;
   sl_v_p_disp : TStringList ;
   sl_v_c_disp : TStringList ;
   sl_v_a_disp : TStringList ;
   sl_pv_util  : TStringList ;
   sl_v_p_util : TStringList ;
   sl_v_c_util : TStringList ;
   sl_v_a_util : TStringList ;
   tsl_v : array[1.. 2, 1.. 4] of tstringlist;
   rv_disp : TRadioButton;
   erj_pour, erj_contre, erj_abs : tedit;
   lnb_msg_ph : tlabel;
   fichier_msg_scnd_PC : string;
   bmerge : boolean = false;
   lconfig: tstringlist;
   depart_trtmnt : int64;
   duree_trtmnt : int64;
   votants_limites : boolean = false;
   cb_votants_lim : TCheckBox;
implementation

procedure pretraitement_lmsg( lmsg, l_cfg : tliste_message; mtests : tstrings );  // concaténation et recherche configuration
var
   i, n : integer;
   lmessages: tstringlist;
function entete_message( j : integer) : string;
var
   p : integer;
begin
   if ((length(lmessages.Strings[j - 1]) < 13 ) or (lmessages.Strings[j - 1][3] <> ':') or (lmessages.Strings[j - 1][6] <> ':')) and (j > 0)  then begin
      inc(n);
      result := entete_message( j- 1);
      lmessages.Strings[j - 1] :=  result + lmessages.Strings[j - 1];
    end else begin
       p := pos(': ', lmessages.Strings[j - 1] );
       if p > 0 then result := copy(lmessages.Strings[j - 1 ] , 1 , p + 1);
    end;
end;
begin
   if lmsg = nil then begin
      //lmessages := lmessages_gen else lmessages := lmsg;
      log_infos('lmsg = nil dans procedure pretraitement_lmsg');
   end else begin
      lmessages := lmsg;
      n := 0;
      l_cfg.Clear;
      for i := lmessages.Count - 1 downto 0  do begin
         if ((length(lmessages.Strings[i]) < 13 ) or (lmessages.Strings[i][3] <> ':') or (lmessages.Strings[i][6] <> ':')) and (i > 0 ) then begin
            lmessages.Strings[i ] := entete_message( i) + lmessages.Strings[i] ;
            inc(n);
         end else if pos(configuration_votes, lmessages.Strings[i]) > 0 then begin
            l_cfg.Insert(0, lmessages.Strings[i]) ;  // parce que lmessages est parcurue à l'envers
            lmessages.Delete(i);  // les messages de configuration ne vont pas dans la liste des messages
         end;
      end;
      if debug then begin
         mtests.Add('pretraitement_lmsg: ' + inttostr(n) + ' lignes reconstituées');
         mtests.Add('pretraitement_lmsg: ' + inttostr(l_cfg.Count) + ' msg config');
      end;
   end;
end;

procedure setCbPouvoirschecked(ok : boolean = true) ;
begin
   if not cbpouvoirs_Checked then begin
      cb_pouv_val.Tag := 1;
      cbpouvoirs_Checked := ok;
      cb_pouv_val.Checked := ok;
      cb_pouv_val.Tag := 0;
   end;
end;

procedure log_infos(mess : string; typ : integer = 0 ; memo : tmemo = nil);
var
   tf : textfile;
begin
   try
      if debug then begin if memo = nil then memo_tests.Add(mess) else memo.lines.Add(mess) end;
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

procedure show_message( texte : string; mtype :TMsgDlgType );
begin
   MessageDlg(texte , mtype, [mbOK], 0);
{mtWarning	      Une boîte de message contenant un signe point d'exclamation jaune.
 mtError	         Une boîte de message contenant un signe de stop rouge.
 mtInformation	   Une boîte de message contenant un "i" bleu.
 mtConfirmation	Une boîte de message contenant un point d'interrogation vert.
 mtCustom	      Une boîte de message ne contenant pas d'image. Le titre de la boîte de dialogue est le nom du fichier exécutable de l'application.}

end;

end.

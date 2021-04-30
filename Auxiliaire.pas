unit Auxiliaire;
// Les suffrages exprimés sont les votes valablement émis dans le cadre d’une proposition mise aux voix ou d’une élection, les suffrages recueillis étant comptabilisés, déduction faite des abstentions ou des bulletins rejetés.

{ENCHAINEMENT DES PROCEDURES:
TA = taux
TM = tmessage
TP = tparticipant
TS = tscrutin
TE = telement_scrutin

   TA.traitement
      TA.charge_fic_msg
      .  TA.pretraitement_lmsg   concaténation  remplissage lconfig
      TA.traite_lconfig
      TA.select_lvotes -> liste_votes
      .  TA.traitement_lvotes
      .     TA.remplace_caracteres_UTF8
      .     TM.create
      .        TM.cherche_participant  lowercase
      .           TP.compare
      TS.decomptage
         TS.cree_elements
         TE.additionne
         TP.additionne
}
{ à terminer :

}
{ CHAINES
chaine_meme_id : tparticipant; // reférence un autre tparticipant ayant de meme no de membre chaucun des particpant ayant un numéro identique référence un tparticpant différent(si en prend un, on peut acceder à tous les autres - jusqu'à ce qu'on trouveun participant référençant celui du départ)
}

{TESTS
ensembles de 2 petits fichiers messages et csv pour tester des cas délicats et d'un troisième explicitant les éléments à observer dans les résultats et les parametres de test (ordre csv message, heure , secret etc .. )
}

{reste à faire :
cas des messages consecutifs d'un même participant espacées d'un très court délai

dans cas ou même num_idpréférence participant avec le moins d'erreur pour...  ,

ok ajout pour fichier messages plus complet
ok participant des messages lorsque participant du fichier csv déjà présent
compare lorsque particpant a un jumeau ayant le même numéro
configuration
sortie sur fichier
enregistrement -reprise de la configuration sur fichier ?
entree CSV web

}
{ à corriger :
établir règles précises pour les changements possible(entrées) aux différents stades de l'utilsation;
ok % trop importants
ok nb de message jamais indiqués
ok nouveau vote -> appui sur "editer" necessaire
ok les messages rejetés s'affichent losqu'on change de scrutin
ok les totaux rejetes ne se modifient pas il ne sont pas à zéro (ou à blanc)  au départ
ok totaux décalés
ok perte des entrées lorsqu'on cree un nouveau scrutin
}
interface

uses
   ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdFTP, IdHTTP, OleCtrls, SHDocVw, SysUtils, Grids, commun, pouvoirs_in, merge  ;


const
    { règles: pas d'accent pour les mots-clés,
              la casse est indifférente,
              les différents paramètres sont séparés par 1 (ou plusieurs) espace
              les paramètres de type 'texte' sont entourés par des " , de ce fait , ils peuvent comporter des espaces }

    ligne_titre = '"Vote N°","nom du vote","Nb votants","Nb pour","Nb contre","Nb abstention","heure debut","duree","nb messages","rejets pour","rejets contre","rejets abstention","secret","duree_trmt","heure_trmt"';
    chVote_No = 0;
    chnom_vote =1;
    chNb_votants =2;
    chNb_pour =3;
    chNb_contre =4;
    chNb_abstention =5;
    chheure_debut =6;
    chduree =7;
    chnb_msg       = 8;
    chrejetspour   = 9;
    chrejetscontre = 10;
    chrejetsabs    = 11;
    chvotesecret   = 12;
    chdureetrtmt   = 13;
    chheuretrtmt   = 14;

    rempl_acc : array[0..7 ,0.. 1] of string = (('a', char(195) + char(160)),   // à  160
                                                 ('i', char(195) + char(175)),  // ï  175
                                                 ('e', char(195) + char(169)),  // é  169
                                                 ('e', char(195) + char(168)),  // è  168
                                                 ('e', char(195) + char(170)),  // ê  170
                                                 (' ', char($C2) + char($A0)),
                                                 (char($AB), char($C2) + char($AB)),  // «
                                                 (char($BB), char($C2) + char($BB))) ; // »
        // manque ç et  a, i, o , u  avec tréma et accent circonflexe ,…(133) ,
{    remplAcc  : array[0..63 ] of byte = (
                           97,97,97,97,97,97,198,99,101,101,101,101,105,105,105,105,
                           208,110,111,111,111,111,111,215,216,117,117,117,117,221,222,223,
                           97,97,97,227,97,229,230,99,101,101,101,101,105,105,105,105,
                           240,110,111,111,111,245,111,247,248,117,117,117,117,117,254,255);   dans commun.pas }
{(
                           192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,
                           208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,
                           97,97,97,227,97,229,230,99,101,101,101,101,105,105,105,105,
                           240,110,111,111,111,245,111,247,248,117,117,117,117,117,254,255);   sans les majuscules accentuées }
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
    tb_regions_m : array[0.. 21] of string = ('fra', 'etr', 'als', 'aqi', 'auv', 'bfc', 'bre', 'cen', 'cha', 'caz', 'fla', 'idf', 'lan', 'lor', 'mip', 'nmd', 'plf', 'plo', 'pch', 'prv', 'ral', 'run');    // specifique Mensa
    idx_msg_nil = -2;
    max_tch = 5;
    choix_nil = '--';

type
  ttab_ch_al = array[0.. max_tch] of string;
  ttbnoms = array[0..9] of string;
  tliste_vote = record//tstringlist;
     idx_deb : integer;
     idx_fin : integer;
  end;
  
  tliste_participant = tstringlist;
  tmessage = class;
  telement_scrutin = class;
  tscrutin = class;
  trejets = record
      msage : tmessage;
      nbrj_pour : integer;
      nbrj_contre : integer;
      nbrj_abs  : integer;
      lgne : integer;
      clne : integer;
      er_pv : boolean;
  end;
  tparams_lmsg = record
     rejetes, vnr: boolean; filtre: string; lmsg: tliste_message; lvotes: tliste_vote ;
     nb_affiches : integer;
  end;
  tparticipant = class
    nom, prenom, region : string;
    texte : string;
    tbnom : ttbnoms;
    numero : integer;
    pouvoirs : integer	;
    tab_ch_pour, tab_ch_contre, tab_ch_abs : ttab_ch_al ;
    chaine_meme_id : tparticipant; // reférence un autre tparticipant ayant de meme no de membre chaucun des particpant ayant un numéro identique référence un tparticpant différent(si en prend un, on peut acceder à tous les autres - jusqu'à ce qu'on trouveun participant référençant celui du départ)
    partage_nomembre : boolean;
    electeur_legitime : boolean; // non retrouvé dans liste pouvoirs ou autre
    //element_scrutin : telement_scrutin;
    num_legitime : boolean; // retrouvé dans liste pouvoirs ou autre
    err_region, err_prenom, err_nom, err_num, err_ID : boolean;
    //p_en_erreur : boolean;
    //present_ds_elements : boolean; // pour comptage des non-exprimés -> fait avec elem_srutin
    elem_scrutin : telement_scrutin; // reinitialisé à chaque decomptage
    fichier_CSV : string;
    rejets : trejets;
    function recherche_choix( mot : string): string;
    function ecrit_csv(idx : integer; s : char):string;
    function compare(nm, prenm, regn, fic_csv : string; part_initial : tparticipant): tparticipant;  overload;
    function compare(txte, regn :string;  const tab : ttbnoms; part_initial : tparticipant): tparticipant; overload;
    function rejected : boolean;
    function affichage_p(ligne : tstrings; filtre : string; lgn : integer) : boolean;
    procedure additionne(var votants, non_exp : integer);
    //constructor create(msg  : string);overload;
    constructor create(msg, regn  : string; num : integer; const tab : ttbnoms);overload;
    constructor create(nm, prenm, regn, fic_csv: string; id: integer);overload;

    destructor destroy;  override;
  end;
  tmessage = class
    participant : tparticipant;
    msg_pre_dans_choix : tmessage; // reinitialisé à chaque chagement de scrutin
    index : integer;
    texte : string;
    choix : string ;
    nombre : integer	;
    compte_ttl, compte_part, compte_rj : boolean;
    nb_final : boolean;  // à true si message unique ou le dernier pour le particpant dans ce choix
    //stg_clear : TStringlist;
    //m_en_erreur : boolean;  rempacé par function rejected
    m_secret : boolean;
    err_choix : boolean;
    err_nombre : boolean;
    err_pouvoirs : boolean;
    est_vote : boolean;
    est_msg_nil : boolean;
    chaine_pv : tmessage;
    Procedure propagation_errp(reinit, errpv : boolean);
    function analyse_nom_zoom(msg : string;  var regn : string; var num : integer) : ttbnoms;
    function valide(secret_ , secret_only_ : boolean) : boolean;
    function rejected : boolean;
    function affichage_m(ligne: tstrings; idx : integer; rejets, vnr : boolean; filtre: string = '') : boolean;
    function cherche_participant(msg : string): tparticipant ;
    constructor create(idx_msg : integer; msg  : string; secret : boolean; lmsg : tliste_message = nil);
    destructor destroy;  override;
  end;
  telement_scrutin = class
    participant : tparticipant;
    msg_pour : tmessage;
    msg_abs  : tmessage;
    msg_contre: tmessage;
    suff_n_exp: integer;
    err_pouv : boolean;
    pouv_cpt_res, pouv_cpt_part, pouv_cpt_rj : boolean;
    nb_pour, nb_contre, nb_abs : integer;
    //scrutin : tscrutin;
    procedure affiche_e(mg : tmessage; idx : integer);
    procedure additionne(var pour, contre, abs, non_exp : integer );
    constructor create(msge : tmessage);
    destructor destroy;  override;
  end;
  tscrutin = class
    numero : integer;
    nom : string;
    heure_debut : string;
    heure_traitement : string;
    duree : string;
    fichier_message: string;
    //fichier_mess_scnd_PC : string;
    fichier_pouvoirs : string;
    nombre_membres : integer;
    //lb_secret : integer;
    //nombre_votants : integer;
    ttl_pour, ttl_contre, ttl_abs, ttl_exp, ttl_votants : integer;
    ttl_rj_p, ttl_rj_c, ttl_rj_a : integer;
    lelement_scrutin : tstringlist;
    lpart_rejets : tstringlist;
    liste_votes : tliste_vote;
    scr_secret : boolean;
    secret_only : boolean;
    processed : boolean;
    liste_message : tliste_message;
    procedure aff_totaux_rejetes;
    function additionne_rejetes(mssge : tmessage ; idx, col, nombre : integer; choix : string; part : tparticipant ): boolean;
    procedure decompte_rejetes; // procedure inutile , il y a additionne_rejetés dans affichage_m
    procedure raz_rejetes;
    procedure decomptage;
    procedure cree_elements;
    procedure maj_resultats;
    procedure init_totaux;
    procedure set_secret(lb_secret : integer);
    constructor create(num : integer; nm : string);
    destructor destroy;  override;
  end;
  taux = class
    lmessages_gen : tliste_message;
    lvotes_dbg : tliste_vote;
    lparticipants: tliste_participant;
    //lrejetes: tstringlist;   inutile ?
    
    repere_lcongig : integer; // = lconfig.count lors du drenier traitement de lconfig
    lnmembre2index : tstringlist; // couple names=values   no_de_membre=index_dans_lparticipants   tparticipant dans objet
    lidxparticipant : tstringlist;
    lscrutin : tstringlist;
    scrutin_encours : tscrutin;
    nb_pouvoirs : integer;
    nb_voix : integer;
    fichier_sortie : string;
    fichier_sortie_ok : boolean;
    ligne_vide : string;
    tickcountpre : cardinal;
    efiltrepre : string;
    nb_mess_ph : integer;
    configurateur : string; // le premier particpant qui envoie un message de configation este le seul à la possibité d'agir sur la configuration ultérieurement
    //lremplacement: tstringlist;
    procedure clear_l_votes;
    procedure clear_tmessages; // pour debug
    procedure remplit_fic_sortie(scrutin : tscrutin; nb_m_ph : integer);
    procedure config_nouv_scrutin(l_nouv_scrutin : tstringlist);
    function decompose(entree : string): tstringlist; // tstringlist.create dans la fonctio,
    procedure set_tb_regions(tabe : array of string );
    procedure traite_lconfig;
    function verif_configurateur(mess : string) : boolean;
    procedure Export_CSV_lparticpants;
    procedure ptest(Sender: tobject);
    procedure traite_pouvoirs(strl: Tstringlist; fichier : string);
    function cherche_participant(nm, prenm, regn, ID, fic_csv: string) : tparticipant;
    procedure videlistes;
    procedure init_part_present(lpart : tliste_participant);
    function select_lvotes(heure, duree : string; secret, secret_exclusif : boolean; lmsg : tliste_message ;lvotes: tliste_vote ): tliste_vote;
    procedure traitement_lvotes(lvotes: tliste_vote; lmsg : tliste_message  );
    function aff_messages( rejetes, vnr : boolean ;filtre: string; lmsg : tliste_message ; lvotes: tliste_vote ): integer;
    //procedure pretraitement_lmsg( lmsg, l_cfg : tliste_message; mtests : tstrings); // concaténation et recherche configuration
    function getversion: String;
    function get_fichier_msg(rep : string) : string;
    function charge_fic_msg(fic: string; lmsg : tliste_message ): boolean;
    procedure traitement;
    function remplace_caracteres_UTF8( texte : string) : string ;  //Voir aussi : Convertit une chaîne codée en Ansi vers UTF-8. //function Utf8ToAnsi(const S: UTF8String): string;
    constructor create;
    destructor destroy;  override;
  private
    params_lmsg_pre : tparams_lmsg ;
    function aff_messages_( rejetes, vnr : boolean ;filtre: string; lmsg : tliste_message ; lvotes: tliste_vote ): integer;
  public

  end;


var
   Aux1 : taux;
   rep_msg_def: string;
   tb_regions : array of string ; //tb_regions_m =('fra', 'etr', 'als', 'aqi', 'auv', 'bfc', 'bre', 'cen', 'cha', 'caz', 'fla', 'idf', 'lan', 'lor', 'mip', 'nmd', 'plf', 'plo', 'pch', 'prv', 'ral', 'run');    // specifique Mensa
   stringgrid1rowscount : integer;
   strgrd_colcount : integer;
   message_nil : tmessage;
   //nb_pouvoirs_max : integer; = 20;
   l_aff : tstringlist = nil;
   Epour_, Econtre_, Eabs_, Enon_exp_, Evotants_ : tedit;
   Ep_ppc_exp_,Ec_ppc_exp_, Ea_ppc_exp_ : tedit;
   Ep_ppc_nbmb_, Ec_ppc_nbmb_, Ea_ppc_nbmb_, Ene_ppc_nbmb_, Ev_ppc_nbmb_ : tedit;
   Erjpour_, Erjcontre_, Erjabs_ : tedit;
   LNb_msg_ : tlabel;
   tab_idx : array[0.. 99] of integer;
implementation






function taux.charge_fic_msg(fic: string; lmsg : tliste_message): boolean;
var
   lmessages, lmfic : tstringlist;
   i : integer;
   hfin : TDateTime; 
begin
   result := false;
   if lmsg = nil then lmessages := lmessages_gen else lmessages := lmsg;
   if lmessages.Count = 0 then lmfic := lmessages else lmfic := TStringList.Create;
   if bmerge then begin
      hfin := strtotime(scrutin_encours.heure_debut ) + strtotime( '00:' + scrutin_encours.duree );
      result := Fmerge.merge_fichiers(lmfic, lconfig, memo_tests, hfin);
   end else begin
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
            depart_trtmnt := GetTickCount;
            enable_efic_msg := false;
            pretraitement_lmsg(lmfic, lconfig, memo_tests);
            if debug then memo_tests.Add('fichier messages chargé, nb lignes: ' + inttostr(lmessages.Count));
         end else begin
            if debug then memo_tests.Add('erreur chargement fichier');
            log_infos('problème au fichier des messages: ' + fic );
         end;
      end;
   end;   
   if result then begin
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
var
   i : integer;
begin
    lnmembre2index := tstringlist.create;
    lnmembre2index.Sorted := true;
    lnmembre2index.Duplicates := dupAccept;
    lmessages_gen := tstringlist.Create;
    lidxparticipant := tstringlist.Create;
    lidxparticipant.Capacity := 20000;
    for i := 1 to 20000 do lidxparticipant.Add('');
    //lvotes_dbg := tstringlist.Create; // est devenu un record , n'est plus une tstringlist
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
    message_nil := tmessage.create(idx_msg_nil,'', false);
    procedure_test := ptest;
    p_traite_pouvoirs := traite_pouvoirs;
    repere_lcongig := 0;
    set_tb_regions(tb_regions_m);
    nb_pouvoirs := 0;
end;

destructor taux.destroy;
begin


    //lrejetes.free;
    lvotes_dbg.idx_deb := -1;
    lvotes_dbg.idx_fin := -1;
    videlistes;     // doit intervenir avant lnmembre2index.Free et lscrutin.Free;;
    lidxparticipant.Free;
    lscrutin.Free;
    lnmembre2index.Free;
    lmessages_gen.free;
    lparticipants.free;
    lconfig.Free;
    message_nil.Free;
    //lremplacement.Free;
  inherited;
end;

function Taux.remplace_caracteres_UTF8( texte : string) : string ; // https://www.charset.org/utf-8  (https://graphemica.com/%F0%9F%92%BB)
var
  st : string;
  p : integer;
begin   //#$EF#$BB#$BF = caractères début de fichier UTF-8
    //Voir aussi : Convertit une chaîne codée en Ansi vers UTF-8.
    //function Utf8ToAnsi(const S: UTF8String): string;
   st := texte ;
   //st := stringreplace(st, #9 , '  ' , []); // remplace tabulation  (fait dans pretraitement_lmsg)
   st := stringreplace(st, #$C2 , '', [rfReplaceAll]);
   p := pos(#$C3, st) ;
   while p > 0 do begin
      //st[p+1]  := chr(ord(st[p+1]) + 64);
      st[p+1]  := chr(remplAcc[ord(st[p+1]) - $80]);
      p := PosEx(#$C3, st, p + 1) ;
   end ;
   st := stringreplace(st, #$C3 , '', [rfreplaceall]);
   p := pos(#$E2, st) ;
   if p > 0 then begin
      st := stringreplace(st, #$E2#$80#$99 , '''', [rfreplaceall]); //E2 80 99    8217	U+2019		’	Right Single Quotation Mark
   end;
   result := st;
end;

procedure taux.videlistes;
begin
    //lrejetes.clear;
    lvotes_dbg.idx_deb := -1;
    lvotes_dbg.idx_fin := -1;
    lconfig.Clear;
    lnmembre2index.Clear;
    lidxparticipant.Clear;
    while lscrutin.Count > 0 do begin  // doit internenir avant lmessages_gen.Objects[0].Free;
       lscrutin.Objects[0].Free;  // destruction des tscrutin
       lscrutin.Delete(0);
    end;
    while lmessages_gen.Count > 0 do begin  //les tmessages seront créés lors de l'analyse d'un vote s'il n'existent pas déjà et reste sur cette liste
       lmessages_gen.Objects[0].Free;  // destruction des tmessages
       lmessages_gen.Delete(0);
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
  fic : string;
begin
   if debug then begin memo_tests.Add(''); memo_tests.Add(rep) end;
   dt_rep := 0;
   fic := '';
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
   end;
   if (result <> '') then begin
      if FileExists(rep + result + '\meeting_saved_chat.txt') then begin
         result := rep + result + '\meeting_saved_chat.txt' ;
         fic := '\meeting_saved_chat.txt'
      end else begin
         if FindFirst(rep + result + '\meeting_*.*', faDirectory, sr) = 0 then begin
            repeat
               if Length(sr.Name)>= 5 then  fic := sr.Name;
            until (FindNext(sr) <> 0) or (fic <> '');
            FindClose(sr);
         end;
         if fic <>'' then result := rep + result + '\' + fic;
      end;
   end;
   if fic <> '' then fichier_message_defaut := result;
   if debug and (fic <> '') then memo_tests.Add('-> ' + result);
end;


{ tparticipant }


{constructor tparticipant.create(msg  : string);  // msg mis à lowercase dans fonction appelante cherche_participant
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
   for i := 0 to max_tch do begin
      tab_ch_pour[i] := choix_nil;
      tab_ch_contre[i] := choix_nil;
      tab_ch_abs[i] := choix_nil;
   end;
   rejets.msage := message_nil; rejets.er_pv := false;
   numero := 0;
   nbgrl := 0;
   nbgrc := 0;
   dans_grl := false;
   dans_grc := false;
   partage_nomembre := false;
   num_legitime := true;
   pouvoirs := 1;
   chaine_meme_id := nil;
   if msg <> '' then begin
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
         if err_num then num_legitime := false;
      end;
      //aux1.lnmembre2index.AddObject(nb + '=' + inttostr(aux1.lparticipants.Count), self);
      electeur_legitime := true; // non retrouvé en tant qu'ayant donné son pouvoir dans liste pouvoirs ou autre
   end else begin
      err_region := false;
      err_num := false;
      err_ID := false;
   end;
   if (aux1.lnmembre2index.IndexOfName(inttostr(numero)) < 0) then aux1.lnmembre2index.AddObject(inttostr(numero) + '=' + inttostr(aux1.lparticipants.Count - 1), self);
   texte := msg;
   aux1.lparticipants.AddObject(msg, self);
end;}

constructor tparticipant.create(msg, regn: string; num: integer;const tab: ttbnoms);
var
  i : integer;
   //nbgrl, nbgrc, i, v, j : integer;
   //dans_grl, dans_grc : boolean;
   //nb : string;
begin
   err_region := true;
   err_prenom := false;
   err_nom := false;
   err_num := num = 0;
   err_ID := err_num;
   for i := 0 to max_tch do begin
      tab_ch_pour[i] := choix_nil;
      tab_ch_contre[i] := choix_nil;
      tab_ch_abs[i] := choix_nil;
   end;
   rejets.msage := message_nil; rejets.er_pv := false;
   numero := 0;
   //nbgrl := 0;
   //nbgrc := 0;
   //dans_grl := false;
   //dans_grc := false;
   partage_nomembre := false;
   num_legitime := true;
   if votants_limites then pouvoirs := 0 else pouvoirs := 1;
   chaine_meme_id := nil;
   {if msg <> '' then begin
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
         if err_num then num_legitime := false;
      end;}
   tbnom := tab;
   region := regn;
   err_region:= region = '';
   numero := num;
   if numero < 20000 then begin
      if aux1.lidxparticipant.Objects[numero] = nil then aux1.lidxparticipant.Objects[numero] := self;
   end else begin
      if aux1.lnmembre2index.IndexOfName(inttostr(numero)) < 0 then aux1.lnmembre2index.AddObject(inttostr(numero) + '=' + inttostr(aux1.lparticipants.Count - 1), self);
   end;
   electeur_legitime := true; // non retrouvé en tant qu'ayant donné son pouvoir dans liste pouvoirs ou autre
   texte := msg;
   aux1.lparticipants.AddObject(msg, self);
end;


constructor tparticipant.create(nm, prenm, regn, fic_csv: string; id: integer);
var
   i : integer;
begin
   nom := nm;
   prenom := prenm;
   numero := id;
   region := regn;
   texte := prenm + ' ' + nm + ' ' + regn + ' ' + inttostr(ID);
   fichier_CSV := fic_csv;
   err_region := true;
   err_prenom := false;
   err_nom := false;
   err_num := false;
   err_ID := false;
   partage_nomembre := false;
   num_legitime := true;
   electeur_legitime := true;
   pouvoirs := 1;
   chaine_meme_id := nil;
   err_region := false;
   err_num := false;
   err_ID := false;
   for i := 0 to max_tch do begin
      tab_ch_pour[i] := choix_nil;
      tab_ch_contre[i] := choix_nil;
      tab_ch_abs[i] := choix_nil;
   end;
   rejets.msage := message_nil; rejets.er_pv := false;
   aux1.lparticipants.AddObject('', self);
   if id < 20000 then begin
      if aux1.lidxparticipant.Objects[id] = nil then aux1.lidxparticipant.Objects[id] := self;
   end else begin
      if aux1.lnmembre2index.IndexOfName(inttostr(id)) < 0 then aux1.lnmembre2index.AddObject(inttostr(id) + '=' + inttostr(aux1.lparticipants.Count - 1), self);
   end;
end;



function tmessage.analyse_nom_zoom(msg : string;  var regn : string; var num : integer) : ttbnoms;

var
   nbgrl, nbgrc, i, v, j : integer;
   dans_grl, dans_grc : boolean;
   nb : string;
   err_region : boolean;
   reg :string;
begin
   num := 0;
   nbgrl := 0;
   nbgrc := 0;
   dans_grl := false;
   dans_grc := false;
   err_region := true;
   regn := '';
   if msg <> '' then begin
      for i := 1 to length(msg) do begin
         v := ord(msg[i]);
         if ((v > 96) and (v < 123)) or (v in [45, 39]) then begin  // lettres  + "-" + "'"
            if not dans_grl then begin
               if result[nbgrl] = '-' then result[nbgrl] := '' else inc(nbgrl);
            end;
            dans_grl := true;
            if nbgrl <= high(result)  then result[nbgrl] := result[nbgrl] + msg[i];
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
      if nb <> '' then num := strtoint(nb);
      if (nbgrc <>  1) then num := 0;
      for i := 0 to high(result) do begin
         reg := StringReplace(result[i], '-', '',  [rfreplaceall]);
         if (length(reg) = 3) and err_region then begin    // specifique Mensa
            j := 0;
            while (j <= high(tb_regions)) and err_region do begin
               err_region := not (reg = tb_regions[j]);
               inc(j);
            end;
            if not err_region then begin
               regn := reg;
               for j := i to high(result) - 1 do begin  // suppression de region de result
                  result[j] := result[j + 1];
               end;
               result[high(result)] := '';
            end;
         end;
      end;
   end;
end;

function tparticipant.rejected: boolean;
begin
   result := err_ID or err_region or err_prenom or err_nom or (err_num and not num_legitime) ;
   result := result and (pouvoirs > 0); // electeur_legitime;
end;

destructor tparticipant.destroy;
begin
//
  inherited;
end;

function tparticipant.affichage_p(ligne: tstrings; filtre: string; lgn : integer): boolean;
var
   flt, symb : string;
begin
   flt := lowercase(trim(filtre));
   result := ((filtre = '') or (flt = copy(texte, 1, length(flt)))); // texte uniquement lowercase
   if elem_scrutin <> nil then begin
      with elem_scrutin do begin
         if pouv_cpt_res then symb := '"' else if pouv_cpt_part then symb := '''' else if pouv_cpt_rj then symb := ',' else symb := '' ;
      end;  //pouv_cpt_rj jamais activé (difficulté à le faire)
   end;
   if result then begin
      //ligne[col_pouvoirs] := symb + inttostr(pouvoirs) + symb;
      tsl_v[1, col_pouvoirs].Strings[lgn] := symb + inttostr(pouvoirs) + symb;
      if elem_scrutin <> nil then begin
         ligne[col_nonexpr] := inttostr(elem_scrutin.suff_n_exp);
         tsl_v[2, col_pouvoirs].Strings[lgn] := inttostr(pouvoirs - elem_scrutin.suff_n_exp);
      end else begin
         ligne[col_nonexpr] := inttostr(pouvoirs);
         tsl_v[2, col_pouvoirs].Strings[lgn] := '0';
      end;
      if err_nom then ligne[col_nom] := 'X';
      if err_prenom then ligne[col_prenom] := 'X';
      if err_region then ligne[col_region] := 'X';
      if err_num then ligne[col_No] := 'X';
      if rejected then ligne[col_ID] := 'X';
      {if err_ then ligne[col_] := 'X';
      if err_ then ligne[col_] := 'X';   }
   end;
end;


procedure tparticipant.additionne(var votants, non_exp: integer);
begin
   if not rejected then begin
      votants := votants + pouvoirs;
      if elem_scrutin = nil then non_exp := non_exp + pouvoirs;
   end;
end;

function tparticipant.compare(nm, prenm, regn, fic_csv: string; part_initial : tparticipant): tparticipant;
var
   i : integer;
   //bnom, bprenom : boolean;
   dprenom , dnom, dregion : integer;
begin
   result := nil;
   {
   bnom := false;
   bprenom := false;
   if (nm <> nom) or (prenm <> prenom) or ((regn <> region ) and (regn <> '')) then begin
      {if (nom = '') and (prenom = '') then begin
         if ((regn <> region ) and (regn <> '')) then begin
            partage_nomembre := true;
         end else begin
            for i :=  0 to high(tbnom) do begin
               if tbnom[i] = nm then bnom := true;
               if tbnom[i] = prenm then bprenom := true;
            end;
            if bnom and bprenom then begin
               result := self;
               prenom := prenm;
               nom := nm
            end else begin
               partage_nomembre := true;
            end;
         end;
      end;
   end else result := self;  }
   // ci-dessus: implémentation stricte , ce qui suit tolère une différence d'un élément sur 3 parmi: nom, prénom et région
   if (regn = region)  then dregion := 1 else dregion := 0 ;// tous les deux peuvent être égal à ''
   if fichier_CSV = '' then begin
      dnom := 0;
      dprenom := 0;
      for i :=  0 to high(tbnom) do begin
         if tbnom[i] = nm then dnom := 1 ;
         if tbnom[i] = prenm then dprenom := 1 ;
      end;
   end else begin
      if (nm = nom) and (nom <> '') then dnom := 1 else dnom := 0;
      if (prenm = prenom) and (prenom <> '') then dprenom := 1 else dprenom := 0;
   end;
   partage_nomembre := dprenom + dnom + dregion < 2 ;
   if not partage_nomembre then result := self;
 // fin option moins sévère
   if partage_nomembre then begin
      num_legitime := false;
      //i := aux1.lnmembre2index.indexof(inttostr(numero));
      //if i >= 0 then aux1.lnmembre2index.delete(i) ;

      if (chaine_meme_id <> nil) and (chaine_meme_id <> part_initial)  then begin
         result := chaine_meme_id.compare(nm, prenm, regn, fic_csv, part_initial);
      end;
      if (result = nil) and ((chaine_meme_id = part_initial) or (chaine_meme_id = nil)) then begin //on est dans le sdernier participant de la chaine avant le retour
         result := tparticipant.create(nm, prenm, regn, fic_csv, numero);
         //result.renseigne(nm, prenm, regn, numero);
         result.partage_nomembre := true;
         chaine_meme_id := result;
         result.chaine_meme_id := part_initial;
      end;
   end;
end;

function tparticipant.compare(txte, regn :string;  const tab : ttbnoms; part_initial : tparticipant): tparticipant;
var
   i : integer;
   dprenom , dnom, dregion : integer;
begin
   result := nil;
   dnom := 0;
   dprenom := 0;
   if (regn = region)  then dregion := 1 else dregion := 0 ;// tous les deux peuvent être égal à ''
   if fichier_CSV <> '' then begin
      for i :=  0 to high(tab) do begin
         if tab[i] = nom then dnom := 1 ;
         if tab[i] = prenom then dprenom := 1 ;
      end;
   end else begin
      for i :=  0 to high(tab) do begin
         if (tab[i] <> regn) then begin
            if (dnom = 1) and (pos(tab[i], texte ) > 0)  then dprenom := 1 ;
            if (dnom = 0) and (pos(tab[i], texte ) > 0)  then dnom := 1 ;
         end;
      end;
   end;
   {if (regn = region)  then dregion := 1 else dregion := 0 ;// tous les deux peuvent être égal à ''
   if fichier_CSV <> '' then begin
      for i :=  0 to high(tbnom) do begin
         if tbnom[i] = nom then dnom := 1 ;
         if tbnom[i] = prenom then dprenom := 1 ;
         if tbnom[i] = prenom then dprenom := 1 ;
      end;
      if pos(tbnom[i], txte ) > 0  then dnom := 1 ;
      if pos(tbnom[i], txte ) > 0  then dprenom := 1 ;
   end else begin
      for i :=  0 to high(tbnom) do begin
         if pos(tbnom[i], txte ) > 0  then dnom := 1 ;
         if pos(tbnom[i], txte ) > 0  then dprenom := 1 ;
      end;
   end;}
   partage_nomembre := dprenom + dnom + dregion < 2 ;
//fin option moins sévère (voir autre function compare au dessus )
   if not partage_nomembre then begin
      result := self;
      if result.texte = '' then result.texte := txte;
   end;
   if partage_nomembre then begin
      num_legitime := false;
      //i := aux1.lnmembre2index.indexof(inttostr(numero));
      //if i >= 0 then aux1.lnmembre2index.delete(i) ;

      if (chaine_meme_id <> nil) and (chaine_meme_id <> part_initial)  then begin
         result := chaine_meme_id.compare(txte, regn, tab, part_initial);
      end;
      if (result = nil) and ((chaine_meme_id = part_initial) or (chaine_meme_id = nil)) then begin //on est dans le sdernier participant de la chaine avant le retour
         result := tparticipant.create(txte, regn, numero , tab );
         //result.renseigne(tab, regn, numero);
         result.partage_nomembre := true;
         chaine_meme_id := result;
         result.chaine_meme_id := part_initial;
      end;
   end;
end;


{ tmessage }

function tmessage.affichage_m(ligne: tstrings; idx : integer; rejets, vnr : boolean; filtre: string = ''): boolean;
var
   str_nb : string;
   add_rj : boolean;
   col_sgd : integer;

begin
   result := false;
   try
      result := ((not rejets) or rejected ); // rejected prend aussi en compte participant.rejected
      result := (vnr or est_vote) and result ;
      result := result and ((Aux1.scrutin_encours.scr_secret = m_secret) or ((not m_secret) and (not Aux1.scrutin_encours.secret_only)));
      result := result and  participant.affichage_p(ligne,  filtre, idx) ;// il faut que affichage_p  soit appellé dans tous les cas
      if result then begin
         if (choix = 'pour') or (choix = 'oui') then col_sgd := col_pour  else
         if (choix = 'contre') or (choix = 'non') then col_sgd := col_contre else
         if (choix = 'abs') then col_sgd := col_abs else col_sgd := 0;
         ligne[0] := texte;
         if err_choix then ligne[col_choix] := 'X';
         if err_nombre then ligne[col_nombre] := 'X';
         if err_pouvoirs then ligne[col_err_pouvoirs] := 'X';
         if err_choix or err_nombre or err_pouvoirs then ligne[col_suffrage] := 'X';  // sera peut-être rempli aussi par le controle des pouvoirs
         str_nb := inttostr(nombre);
         if rejets then begin
            add_rj := Aux1.scrutin_encours.additionne_rejetes(self, idx, col_sgd, nombre, choix, participant) ;
            if add_rj  then compte_rj := true else str_nb := '(' + str_nb + ')';
         end;

         if compte_ttl then str_nb := '"' + str_nb  + '"'
         else if compte_part then str_nb := '''' + str_nb  + '''' ;
         if compte_rj then str_nb := ',' + str_nb  + ',' ;
         if col_sgd > 0 then begin
            tsl_v[ 1, col_sgd].Strings[idx] := str_nb;
            if (participant.elem_scrutin <> nil) then participant.elem_scrutin.affiche_e(self, idx);
         end;
         //if col_sgd > 0 then ligne[col_sgd] := str_nb;
      end;
   except
      on E: exception do
         log_infos( 'Erreur dans affichage_m ' + inttostr(index) + ': ' + E.message);
   end;
end;

function tmessage.cherche_participant(msg: string): tparticipant;
var
   p, i : integer;
   st : string;
   tab : ttbnoms;
   regn : string;
   num : integer;
   part : tparticipant;
begin
   p := pos('TLM :' , msg);
   if p = 0 then p := pos('SECRET :' , msg);
   st := lowercase(copy(msg, 14 , p - 15));
   tab := analyse_nom_zoom(st, regn, num );
   if (num<1) or (num >= 20000) then begin
      i := Aux1.lparticipants.IndexOf(st);
      if i >= 0 then begin
         result := tparticipant(Aux1.lparticipants.objects[i]);
      end else begin
         //tab := analyse_nom_zoom(st, regn, num );
         i := aux1.lnmembre2index.IndexOfName(inttostr(num));
         if i < 0 then begin
            result := tparticipant.create(st, regn, num , tab );
         end else begin
            part := tparticipant(aux1.lnmembre2index.objects[i]);
            result := part.compare(st, regn, tab, part);
         end;
      end;
   end else begin
      part := tparticipant(aux1.lidxparticipant.objects[num]);
      if part = nil then begin
         result := tparticipant.create(st, regn, num , tab );
      end else begin
         result := part.compare(st, regn, tab, part);
      end;
   end;
end;

constructor tmessage.create(idx_msg : integer; msg  : string; secret : boolean ; lmsg : tliste_message = nil);
const
   mx = 3;
var
   st, tlm_scrt, nb, choix_alt , chx: string;
   v, i : integer;
   nbgrl, nbgrc : integer;
   dans_grl, dans_grc : boolean;
   lmessages : tstringlist;
   ch : array[1.. mx] of string;
begin
   index := idx_msg;
   //if debug then memo_tests.Add(msg);
   est_msg_nil := idx_msg = idx_msg_nil;
   chaine_pv := message_nil;
   compte_ttl := false; compte_part := false; compte_rj := false;
   if est_msg_nil then begin
      nombre := 0;
      participant := nil;
      chaine_pv := self;
   end else begin
      {stg_clear := TStringList.Create;
      for i := 1 to strgrd_colcount do stg_clear.Add(''); }
      if lmsg = nil then lmessages := aux1.lmessages_gen else lmessages := lmsg;
      //participant := cherche_participant(msg);  //tparticipant.create(msg );
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
            if nbgrl <= mx then ch[nbgrl] := ch[nbgrl] + st[i]
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
      if nb <> '' then nombre := strtointdef(nb, 0); // caractère "-" non accepté -> nombre forcément positif
      if nbgrc = 0 then nombre := -1;
      err_nombre := (nbgrc > 1) ; //(nombre <>1) and ((nbgrc <> 1) or (nombre = 0));
      participant := cherche_participant(msg);  //tparticipant.create(msg );
      for i := 1 to min(mx, nbgrl) do begin
         //chx := ch[i];
         chx := participant.recherche_choix(ch[i]); // pour option vote par mots aléatoires
         if chx = choix_nil then chx := ch[i];
         if length(chx) < 3 then dec(nbgrl);
         if (chx[1] = 'a') and ((chx = 'abstention') or (chx = 'absention') or (chx = 'abstentions')) then chx := 'abs';
         if (choix = '') and ((chx = 'pour') or (chx = 'contre') or (chx = 'abs') or (chx = 'oui') or (chx = 'non')) then choix := chx
         else if (choix <> '') and ((chx = 'pour') or (chx = 'contre') or (chx = 'abs') or (chx = 'oui') or (chx = 'non')) then choix_alt := chx; // pour éviter double choix , ex: "pour 3 contre" (influence dans comptage des rejetés )}
         {if (choix = '') and (length(ch[i]) in [3 , 4, 6, 10]) then choix := ch[i] else if (choix <> '') and (length(ch[i]) in [3 , 4, 6, 10]) then choix_alt := ch[i]; // pour éviter double choix , ex: "pour 3 contre" (influence dans comptage des rejetés )}
      end;
      if (choix_alt <> '') then choix := '';
      err_choix :=  (choix = 'oui') or (choix = 'non');
      err_choix :=  err_choix or (nbgrl > mx) or (choix = '');
      est_vote := participant.electeur_legitime and (nbgrl < 6 ) and ( nbgrc < 4);
      lmessages.Objects[idx_msg] := self;
   end;
end;

function tmessage.rejected: boolean;
begin
   result := err_pouvoirs or err_choix or err_nombre or participant.rejected;
end;

destructor tmessage.destroy;
begin
  //stg_clear.free;
  inherited;
end;

{procedure taux.pretraitement_lmsg( lmsg, l_cfg : tliste_message; mtests : tstrings );  // concaténation et recherche configuration
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
   if lmsg = nil then lmessages := lmessages_gen else lmessages := lmsg;
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
end;}

function taux.select_lvotes(heure, duree: string ; secret, secret_exclusif : boolean; lmsg : tliste_message ; lvotes: tliste_vote ): tliste_vote;
var
   hfin : string;
   i : integer;
   lmessages : tstringlist;
   hors_plage : boolean;
begin
   i := -1;
   result.idx_deb := -1;
   result.idx_fin := -1;
   lmessages := lmsg;
   if debug and (duree = '55:55') then begin
      hfin := TimeToStr(strtotime(heure) + strtotime( '06:00:00'));
   end else begin
      hfin := TimeToStr(strtotime(heure) + strtotime( '00:' + duree));
   end;
   if debug then memo_tests.add('sélection de ' + heure + ' à ' + hfin);
   repeat
      inc(i)
   until (i >= lmessages.Count) or (heure < lmessages.Strings[i]);
   if i < lmessages.Count then result.idx_deb := i;
   hors_plage :=  i >= lmessages.Count;
   if hors_plage then showmessage('Plage horaire après la fin des messages');
   while (i < lmessages.Count) and (lmessages.Strings[i] < hfin) do begin
      result.idx_fin := i;
      inc(i);
   end;
   if i = 0 then begin
      show_message('Plage horaire avant le début des messages',mtInformation );
      hors_plage := true;
   end;
   if (result.idx_deb = -1) and (result.idx_fin >= 0) then result.idx_deb := 0;
   if debug then memo_tests.add( inttostr(result.idx_fin - result.idx_deb + 1) + ' messages sélectionnés');
   if hors_plage then begin result.idx_deb := -1; result.idx_fin := -1;
   end else traitement_lvotes(result, lmsg) // filtrage "tout le monde" , "secret" , 'secret uniquement"
end;

procedure taux.traitement_lvotes(lvotes: tliste_vote; lmsg : tliste_message   );
var
   idx_msg ,p, nb_msg  : integer;
   st, nv : string;
   tlm, secret : boolean;
   lmessages: tstringlist;
   //msg  : tmessage;
begin
   nb_msg := 0;
   nb_mess_ph := 0;
   lmessages := lmsg;
   if lvotes.idx_deb >= 0 then begin
      for idx_msg := lvotes.idx_deb to lvotes.idx_fin do begin
         try
            if lmessages.Objects[idx_msg] = nil then begin
               tlm := true;
               secret := false;
               st := lmessages.Strings[idx_msg] ;
              // nv := stringreplace(st , 'Ã   Tout le monde'   , 'TLM', []);  // char(195) + char(160) = à  // char(195) + char(160) + ' Tout le monde'
               p := pos('Ã   Tout le monde', st);
               if p > 0 then begin
                  nv := copy(st, 1, p -1) + 'TLM :' + rightstr(st, length(st) - p - 18);
               end else begin
               //if length(nv) = length(st) then begin
                  tlm := false;
                  p := pos('(Message direct)', st);
                  if p > 0   then begin
                     secret := true;
                     nv := copy(st, 1, pos(char(195) + char(160), st) -1) + 'SECRET :' + rightstr(st, length(st) - p - 17);
                  end;
               end ;

               if tlm then inc(nb_mess_ph);
               if secret or tlm then begin
                  nv := remplace_caracteres_UTF8(nv);
                  tmessage.create(idx_msg, nv, secret); // dans create : lmessages.Objects[idx_msg] := msg;
                  inc(nb_msg);
                  //lvotes.strings[i] := nv;
               end else begin
                  if debug then log_infos('message ni TLM ni SECRET: ' + nv);
               end;
            {end else begin
               lvotes.strings[i] := tmessage(lmessages.Objects[idx_msg]).texte; }
            end else if not tmessage(lmessages.Objects[idx_msg]).m_secret then begin
               inc(nb_mess_ph);
            end
         except
            on E : exception do log_infos( 'erreur dans taux.traitement_lvotes: ' + e.message );
         end;
      end;
   end;
   if debug then memo_tests.add( inttostr(nb_msg) + ' tmessage créés');
   if debug then memo_tests.add( inttostr(lparticipants.Count) + ' tparticipants');
end;

{function taux.remplace_accents(str : string) : string;
var
   i : integer;
begin
   result := str;
   for i := 0 to high(rempl_acc) do begin
      result := StringReplace(result, rempl_acc[i, 1]  , rempl_acc[i, 0] , [rfReplaceAll] );
   end;

end;  }

procedure taux.traitement;
var
   st : string;
begin
   try
      with scrutin_encours do begin
         config_nv_scrutin := scrutin_encours.numero;
         //depart_trtmnt := GetTickCount; transféré dans charge_fic_msg  et TFmerge.merge_fichiers  avant pretraitement mais après le chargement des fichiers
         if charge_fic_msg(fichier_message, liste_message) then begin
            if (titre_reunion = '') and (fichier_message = fichier_message_defaut) then begin
               st := ExtractFilePath(fichier_message);
               titre_reunion := ExtractFileName(copy(st, 1, length(st) -1));
            end;
            cb_votants_lim.Enabled := false;
            if cb_votants_lim.Checked then cb_votants_lim.color := clblack else cb_votants_lim.color := clWhite;
            traite_lconfig;
            liste_votes := select_lvotes(heure_debut, duree, scr_secret, secret_only, liste_message, liste_votes);
            if liste_votes.idx_deb >= 0 then begin  //sinon plage horaire selectionnée hors plage horaire des messages
               decomptage;
               remplit_fic_sortie(scrutin_encours, nb_mess_ph);
               lnb_msg_ph.Caption := inttostr(nb_mess_ph) + ' messages "à tout le monde" dans la plage horaire';
               lnb_msg_ph.Visible := true;
            end;
         end else begin
            st := 'fichier message invalide: ' + fichier_message;
            fichier_message := '';
            log_infos(st);
            Show_Message(st, mtWarning);
         end;
      end;
   except
      on E : exception do begin
         log_infos( 'erreur dans taux.traitement: ' + e.message );
         show_message('Erreur de traitement', mtError);
      end;
   end;
end;



function taux.aff_messages_( rejetes, vnr : boolean ;filtre: string; lmsg : tliste_message ; lvotes: tliste_vote ): integer;
var
   i, j : integer;
   lmessages: tstringlist;

procedure sl_v_add;
var
   m, n : integer;
begin
   for m := 1 to 2 do begin
      for n := 1 to 4 do begin
         tsl_v[m, n].Add('');
      end;
   end;
end;
begin
   //if rv_disp.Checked then dp_ut := 1 else dp_ut := 2;
   j := 0;
   for i := 0 to f1stringgrid.ColCount -1 do f1stringgrid.cols[i].Clear;
   nb_msg_affiches := 0;
   Cbenraff.Checked := false;
   f1stringgrid.row := 0; f1stringgrid.col := 0;
   lmessages := lmsg;
   scrutin_encours.raz_rejetes;
   if scrutin_encours.processed then begin
      clear_l_votes;
      sl_v_add;
      i := lvotes.idx_deb;
      while (i >= 0) and ((i <= lvotes.idx_fin) and (j < f1stringgrid.RowCount)) do begin
         try
            if lmessages.Objects[i] = nil then begin
               //log_infos('Erreur dans aff_messages (index:' + inttostr(i) + ' lmessages.Objects[i] = nil');
            end else if tmessage(lmessages.Objects[i]).affichage_m(f1stringgrid.Rows[j], j, rejetes, vnr, filtre) then begin inc(j); sl_v_add   end;
         except
            on E: exception do begin
               log_infos('Erreur dans aff_messages (index:' + inttostr(i) + ') ' + E.Message);
            end;
         end;
         inc(i);
      end;
   end;
   //scrutin_encours.decompte_rejetes ; // procedure decompte_rejetes inutile , il y a additionne_rejetés dans affichage_m
   {for i := 1 to 4 do begin
      f1stringgrid.Cols[i].Text := tsl_v[dp_ut, i].text;
   end;}
   if rejetes then scrutin_encours.aff_totaux_rejetes;
   LNb_msg_.Caption := inttostr(j) + ' messages affichés';
   result := j;

end;

function taux.aff_messages(rejetes, vnr: boolean; filtre: string; lmsg: tliste_message; lvotes: tliste_vote): integer;
var
   dp_ut : integer;
   params_lmsg : tparams_lmsg;
   i, j, ttl : integer;
   sl : tstringlist;
   st : string;
   tc : cardinal;
begin
   if rv_disp.Checked or rejetes then dp_ut := 1 else dp_ut := 2;
   params_lmsg.rejetes := rejetes;
   params_lmsg.vnr := vnr;
   params_lmsg.filtre := filtre;
   params_lmsg.lmsg := lmsg;
   params_lmsg.lvotes := lvotes;
   //params_lmsg.nb_affiches := params_lmsg_pre.nb_affiches;
   if (not (rejetes or params_lmsg_pre.rejetes)) and (params_lmsg.vnr = params_lmsg_pre.vnr) and (params_lmsg.filtre = params_lmsg_pre.filtre) and (params_lmsg.lmsg = params_lmsg_pre.lmsg) and (params_lmsg.lvotes.idx_deb = params_lmsg_pre.lvotes.idx_deb) and (params_lmsg.lvotes.idx_fin = params_lmsg_pre.lvotes.idx_fin) then begin
      result := params_lmsg_pre.nb_affiches;
   end else begin
      result := aff_messages_(rejetes, vnr, filtre, lmsg, lvotes);
      params_lmsg_pre := params_lmsg;
   end;
   params_lmsg_pre.nb_affiches := result;
   for i := 1 to 4 do begin
      f1stringgrid.Cols[i].Text := tsl_v[dp_ut, i].text;
   end;
   if (dp_ut = 2)  then begin
      // affichage des totaux utilisés
      for i := 2 to 4 do begin
         if (filtre = '') then begin
            sl := tsl_v[2, i];
            ttl := 0;
            for j := 0 to sl.Count -1 do begin
               ttl := ttl + strtointdef(sl[j],0);
            end;
            st := inttostr(ttl);
         end else st := '';
         case i of
            col_pour : erj_pour.Text := st;
            col_contre : erj_contre.Text := st;
            col_abs : erj_abs.Text := st;
         end;
      end;
      if (filtre = '') and ( (erj_pour.Text <> Epour_.Text) or (erj_contre.Text <> Econtre_.Text) or (erj_abs.Text <> Eabs_.Text)) then begin
         show_message('Incohérence des résultats entre les totaux' + #13#10 + 'des colonnes "pour", "contre" ou "abs" '
                      + #13#10 + 'et les résultats', mtError);
         log_infos('incohérence des résultats entre les totaux des colonnes "pour", "contre" ou "abs" et les résultats, pour: ' + erj_pour.Text + '<>' + Epour_.Text + ' contre: ' + erj_contre.Text + '<>' + Econtre_.Text + ' abs: ' + erj_abs.Text + '<>' + Eabs_.Text);
      end;
   end;
   if debug then begin
      tc := GetTickCount; //If the function succeeds, the return value is the number of milliseconds that have elapsed since Windows was started.
      if (tc - tickcountpre) < max_interval then begin
         if length(filtre) <= length(efiltrepre) then
            log_infos('interval entre 2 appels à affmessage = ' + inttostr(tc - tickcountpre) +' < ' + inttostr(max_interval) + ' ms' );
      end;
      tickcountpre := tc ;
      efiltrepre := filtre;
   end;
   nb_msg_affiches := result;
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



function tmessage.valide(secret_, secret_only_: boolean): boolean;
begin
   if secret_ then begin
      result := m_secret or not secret_only_;
   end else begin
      result := not m_secret ;
   end;
   result := result and not rejected;
end;

procedure tmessage.propagation_errp(reinit, errpv: boolean);
begin
if chaine_pv = nil then
   show_message('chaine_pv = nil ' + texte,mtError )
else begin
   if not est_msg_nil  then begin
      chaine_pv.propagation_errp(reinit, errpv);
      if reinit then chaine_pv := message_nil;
      err_pouvoirs := errpv and not reinit;
   end;
end;
end;

function tparticipant.recherche_choix(mot: string): string;
const
   faux = 'faux' ;
var
   i : integer;
begin
   result := faux;
   if tab_ch_pour[0] = choix_nil then begin // méthode non utilisée
      result := choix_nil ;
   end else begin
      i := 0;
      while (i <= max_tch) and (result = faux ) and (tab_ch_pour[i] <> choix_nil) do begin  // les valeurs jusqu'à max_ch peuvent ne pas exister
         if mot = tab_ch_pour[i] then result := 'pour';
         if mot = tab_ch_contre[i] then result := 'contre';
         if mot = tab_ch_abs[i] then result := 'abs';
         inc(i);
      end;
   end;
end;



{ telement_scrutin }

procedure telement_scrutin.additionne(var pour, contre, abs, non_exp : integer);
var
   errpv : boolean;
   //nb_pour, nb_contre, nb_abs : integer;
   nb_flottants : integer;
procedure affecte_temoins( total , partiel, rejetes : boolean);
begin
   if msg_pour.nombre > 0 then begin if total then msg_pour.compte_ttl := true else if partiel then msg_pour.compte_part := true else if rejetes then msg_pour.compte_rj := true   end;
   if msg_contre.nombre > 0 then begin if total then msg_contre.compte_ttl := true else if partiel then msg_contre.compte_part := true else if rejetes then msg_contre.compte_rj := true  end;
   if msg_abs.nombre > 0 then begin if total then msg_abs.compte_ttl := true else if partiel then msg_abs.compte_part := true else if rejetes then msg_abs.compte_rj := true   end;
end;
begin
   // err_pouvoirs de tous les message remis à false dans cree_elements;
   // msg_pour etc ... valent messsage_nil si non affectés, message_nil.nombre = 0
   nb_pour := 0; nb_contre := 0;  nb_abs := 0 ;
   if participant.pouvoirs = 0 then begin
      errpv := true;
      suff_n_exp := 0;
      //affecte_temoins(false, false, true);
   end else begin
      nb_flottants := 0;
      if msg_pour.nombre = -1 then begin  nb_pour := 1; inc(nb_flottants) end else nb_pour := msg_pour.nombre;
      if msg_contre.nombre = -1 then begin  nb_contre := 1; inc(nb_flottants) end else nb_contre := msg_contre.nombre;
      if msg_abs.nombre = -1 then begin nb_abs := 1; inc(nb_flottants) end else nb_abs := msg_abs.nombre;
      suff_n_exp := participant.pouvoirs  - nb_pour - nb_contre - nb_abs;
      errpv := (suff_n_exp < 0) or (nb_flottants > 1) ;
      if errpv then begin
         if (msg_pour.nombre= 0) and (msg_contre.nombre = 0) then begin errpv := false ; nb_abs := participant.pouvoirs; msg_abs.compte_part := true end;
         if (msg_contre.nombre= 0) and ( msg_abs.nombre = 0)  then begin errpv := false ; nb_pour := participant.pouvoirs; msg_pour.compte_part := true end;
         if (msg_abs.nombre= 0) and ( msg_pour.nombre = 0)    then begin errpv := false ; nb_contre := participant.pouvoirs; msg_contre.compte_part := true end;
         if errpv then begin
            suff_n_exp := participant.pouvoirs;(* affecte_temoins(false, false, true)*)
            nb_pour := 0; nb_contre := 0;  nb_abs := 0 ;
         end else begin
            suff_n_exp := 0;
            pouv_cpt_res := true
         end;
         non_exp := non_exp + suff_n_exp;
      end else if nb_flottants = 1 then begin
         if msg_pour.nombre = -1 then begin  nb_pour := participant.pouvoirs - nb_contre - nb_abs; msg_pour.compte_ttl := true ;end else if msg_pour.nombre > 0 then begin  msg_pour.compte_ttl := true;end;
         if msg_contre.nombre = -1 then begin nb_contre := participant.pouvoirs - nb_pour - nb_abs; msg_contre.compte_ttl := true ;end else if msg_contre.nombre > 0 then begin msg_contre.compte_ttl := true;end;
         if msg_abs.nombre = -1 then begin nb_abs := participant.pouvoirs - nb_pour - nb_contre; msg_abs.compte_ttl := true ;end else if msg_abs.nombre > 0 then begin msg_abs.compte_ttl := true; end;
         suff_n_exp := 0;
         pouv_cpt_res := true;
      end else begin
         non_exp := non_exp + suff_n_exp ;
         if suff_n_exp < participant.pouvoirs  then begin
            if suff_n_exp = 0 then pouv_cpt_res := true else pouv_cpt_part := true;
            affecte_temoins( true , false, false);
         end ;
      end;
   end;
   pour := pour + nb_pour;
   contre := contre + nb_contre;
   abs := abs + nb_abs;
   err_pouv := errpv;
   msg_pour.propagation_errp(false, errpv);  //err_pouvoirs := errpv;
   msg_contre.propagation_errp(false, errpv);  //err_pouvoirs := errpv;
   msg_abs.propagation_errp(false, errpv);  //err_pouvoirs := errpv;

end;

procedure telement_scrutin.affiche_e(mg: tmessage; idx: integer);
begin  //tsl_v[ 2, col_sgd].Strings[idx] :=
   if mg = msg_pour then tsl_v[ 2, col_pour].Strings[idx] := inttostr(nb_pour)
   else if mg = msg_contre then tsl_v[ 2, col_contre].Strings[idx] := inttostr(nb_contre)
   else if mg = msg_abs then tsl_v[ 2, col_abs].Strings[idx] := inttostr(nb_abs);
end;

constructor telement_scrutin.create(msge : tmessage);
begin
   pouv_cpt_res := false; pouv_cpt_part := false; pouv_cpt_rj := false;
   participant := msge.participant;
   participant.elem_scrutin := self;
   msg_pour := message_nil;
   msg_contre := message_nil;
   msg_abs := message_nil;
   err_pouv := false;
   if msge.choix = 'pour' then begin
      msg_pour := msge;
   end else if msge.choix = 'contre' then begin
      msg_contre := msge;
   end else if msge.choix = 'abs' then begin
      msg_abs := msge;
   end else begin
      log_infos('erreur cas normalement impossible : message valide sans choix correct: choix = ' + msge.choix);
   end;
end;

procedure tscrutin.decomptage;
var
   i : integer;
   p, c, a, ne, v  : integer;
   st1, st2 : string;
begin
   aux1.init_part_present(aux1.lparticipants);
   cree_elements;
   p := 0; c := 0; a := 0; ne := 0; v := 0; ne := 0;
   for i := 0 to lelement_scrutin.Count - 1 do begin
      try
         telement_scrutin(lelement_scrutin.Objects[i]).additionne(p, c, a, ne);
      except
         on E : exception do log_infos( 'erreur dans tscrutin.decomptage: ' + e.message );
      end;
   end;
   ttl_pour := p;
   ttl_contre := c;
   ttl_abs := a;
   for i := 0 to aux1.lparticipants.Count - 1 do begin
      tparticipant(aux1.lparticipants.Objects[i]).additionne(v , ne);
   end;
   ttl_votants := v;
   ttl_exp := p + c + a;
   if ne + ttl_exp <> v then begin
      st1 := 'incohérence dans les résultats: ' + inttostr(ttl_exp) + ' suffrages exprimés + ';
      st2 := inttostr(ne) + ' suffrages non exprimés différent de ' + inttostr(ttl_votants) + ' votants';
      log_infos(st1 + st2);
      show_message(st1  + #13#10 + st2, mtError);
   end;
   processed := true;
   aux1.aff_messages(true, false, '', liste_message, liste_votes);
   duree_trtmnt := GetTickCount - depart_trtmnt ;
   maj_resultats;
   heure_traitement := TimeToStr(Now) ;
end;

procedure tscrutin.cree_elements;
var
   i : integer;
   part : tparticipant;
   msge : tmessage; // msg remplacé par msge car msg est une variable globale dans une untité Delphi
begin
   while lelement_scrutin.Count > 0 do begin
      lelement_scrutin.Objects[0].Free;
      lelement_scrutin.Delete(0);
   end;
   if (liste_votes.idx_deb >=0) and (liste_votes.idx_fin < liste_message.count) then begin
      for i := liste_votes.idx_deb to liste_votes.idx_fin do begin
         if liste_message.Objects[i] <> nil then begin
            msge := tmessage(liste_message.Objects[i]);
            with msge do begin
               err_pouvoirs := false;
               compte_ttl := false; compte_part := false; compte_rj := false;
            end;
            msge.chaine_pv := message_nil;
            if msge.valide(scr_secret, secret_only) then begin
               part := msge.participant;
               if part.elem_scrutin = nil then begin
                  lelement_scrutin.AddObject('', telement_scrutin.create(msge));
               end else begin
                  with part.elem_scrutin do begin
                     if msge.choix = 'pour' then begin
                        msge.chaine_pv := msg_pour;
                        msg_pour := msge;
                     end else if msge.choix = 'contre' then begin
                        msge.chaine_pv := msg_contre;
                        msg_contre := msge;
                     end else if msge.choix = 'abs' then begin
                        msge.chaine_pv := msg_abs;
                        msg_abs := msge;
                     end else begin
                        log_infos('erreur cas normalement impossible : message valide sans choix correct: chois = ' + msge.choix);
                     end;
                  end;
               end; // chacune des trois variables msg_pour, msg_contre et msg_abs est finalement instanciée par le dernier message la concernant
            end;
         end else showmessage('liste_message.Objects[' + inttostr(i) + '] = nil ' + liste_message.strings[i]);
      end;
   end else begin
       log_infos('plage incorrecte dans tscrutin.cree_elements');
   end;
end;

destructor telement_scrutin.destroy;
begin
  {msg_pour.propagation_errp(true, false);  rendu inutile par instructions (msge. :=) dans tscrutin.cree_elements
  msg_contre.propagation_errp(true, false);
  msg_abs.propagation_errp(true, false); }
  inherited;
end;

{ tscrutin }

procedure tscrutin.maj_resultats;
var
   i : integer;
begin
   if not processed  then begin
      Ep_ppc_exp_.text := '0' ; Ep_ppc_nbmb_.text := '0' ;
      Ec_ppc_exp_.text := '0' ; Ec_ppc_nbmb_.text := '0' ;
      Ea_ppc_exp_.text := '0' ; Ea_ppc_nbmb_.text := '0' ;
      Ene_ppc_nbmb_.text := '0' ; Ev_ppc_nbmb_.text := '0' ;
      Erjpour_.text := '0'; Erjcontre_.text := '0'; Erjabs_.text := '0';
      for i := 0 to f1stringgrid.ColCount -1 do f1stringgrid.cols[i].Clear;
      nb_msg_affiches := 0;
      f1stringgrid.row := 0; f1stringgrid.col := 0;
      LNb_msg_.Caption :=  '0 messages affichés';
   end else begin
      Ep_ppc_exp_.text := inttostr((100 *  ttl_pour) div max(ttl_exp, 1)) ; Ep_ppc_nbmb_.text := inttostr((100 * ttl_pour) div nombre_membres) ;
      Ec_ppc_exp_.text := inttostr((100 * ttl_contre) div max(ttl_exp,1)) ; Ec_ppc_nbmb_.text := inttostr((100 * ttl_contre) div nombre_membres) ;
      Ea_ppc_exp_.text := inttostr((100 * ttl_abs) div max(ttl_exp,1)) ; Ea_ppc_nbmb_.text := inttostr((100 * ttl_abs) div nombre_membres) ;
      Ene_ppc_nbmb_.text := inttostr((100 * (ttl_votants - ttl_exp)) div nombre_membres) ; Ev_ppc_nbmb_.text := inttostr((100 * ttl_votants)div nombre_membres) ;
   end ;
   Epour_.text := inttostr(ttl_pour) ; Econtre_.text := inttostr(ttl_contre) ; Eabs_.text := inttostr(ttl_abs) ; Enon_exp_.text := inttostr(ttl_votants - ttl_exp) ; Evotants_.text := inttostr(ttl_votants) ;
end;

constructor tscrutin.create(num : integer; nm : string);
begin
   numero := num;
   nom := nm;
   lelement_scrutin := tstringlist.Create;
   lpart_rejets := tstringlist.Create;
   //liste_votes := tstringlist.Create;
   liste_votes.idx_deb := -1;
   liste_votes.idx_fin := -1;
   aux1.lscrutin.AddObject(inttostr(num), self);
   init_totaux;
   scr_secret := false;
   secret_only := false;
   liste_message := aux1.lmessages_gen;
   processed := false;
end;

destructor tscrutin.destroy;
begin
   while lelement_scrutin.Count > 0 do begin
    lelement_scrutin.Objects[0].Free;  // destruction des telement_scrutin
    lelement_scrutin.Delete(0);
   end;
   lelement_scrutin.Free;
   lpart_rejets.Free;
   inherited;
end;

procedure tscrutin.init_totaux;
begin
   ttl_pour :=0; ttl_contre :=0; ttl_abs :=0; ttl_exp :=0; ttl_votants :=0;
   raz_rejetes;
   processed := false;
   lnb_msg_ph.Visible := false;
end;


procedure taux.init_part_present( lpart : tliste_participant);
var
   i : integer;
begin
   for i := 0 to lpart.Count - 1 do begin
      tparticipant(lpart.Objects[i]).elem_scrutin := nil;
   end;
end;

procedure tscrutin.decompte_rejetes;
begin
   // procedure inutile , il y a additionne_rejetés dans affichage_m
   if ttl_exp > 0 then begin

   end;
end;

procedure tscrutin.raz_rejetes;
begin
   ttl_rj_p :=0;
   ttl_rj_c :=0;
   ttl_rj_a :=0;
end;

{function tscrutin.additionne_rejetes(mssge : tmessage ; nombre: integer; choix: string ; part : tparticipant): boolean;
var
   mess : tmessage;
   bpour, bcontre, babs : boolean;
   nb : integer;
   elem_scr : telement_scrutin;
begin
   nb := 0;
   try
      bpour := (choix = 'pour') or (choix = 'oui');
      bcontre :=  (choix = 'contre') or (choix = 'non');
      babs := choix = 'abs' ;
      if part <> nil then begin
         elem_scr := part.elem_scrutin;
         if bpour or bcontre or babs then begin
            if elem_scr <> nil then begin
               if bpour then mess := elem_scr.msg_pour else if bcontre then mess := elem_scr.msg_contre else mess := elem_scr.msg_abs;
               if mssge.index > mess.index then begin  // message plus récent dans le choix
                  if mess.est_msg_nil then nb := min(nombre, elem_scr.suff_n_exp) else begin nb := min(nombre, part.pouvoirs); mess.compte_rj := true; end;
               end else begin
                  nb := 0;
               end;
            end else begin
               nb := min(nombre, part.pouvoirs);
            end;
         end;
         if nb = -1 then nb := part.pouvoirs;
      end else begin // pb identification du participant
         nb := min(abs(nombre), nb_pouvoirs_max);
      end;

      if bpour then inc(ttl_rj_p , nb) else if bcontre then inc(ttl_rj_c , nb) else if babs then inc(ttl_rj_a , nb);
      //Erjpour_.text := inttostr(ttl_rj_p); Erjcontre_.text := inttostr(ttl_rj_c); Erjabs_.text := inttostr(ttl_rj_a);    dans aff_totaux_rejetes
   except
      on E : exception do log_infos('Erreur dans additionne_rejetes: ' + E.message);
   end;
   result := nb > 0;
end;  }

function tscrutin.additionne_rejetes(mssge : tmessage ; idx, col,  nombre: integer; choix: string ; part : tparticipant): boolean;
var
   bpour, bcontre, babs : boolean;
   elem_scr : telement_scrutin;
   resultats_non_valides : boolean;
procedure affecte;
var
   nb : integer;
begin
   nb := min(mssge.nombre, part.pouvoirs);
   part.rejets.nbrj_pour := 0; part.rejets.nbrj_contre := 0; part.rejets.nbrj_abs := 0; 
   if bpour then        part.rejets.nbrj_pour := nb
   else if bcontre then part.rejets.nbrj_contre := nb
   else if babs then    part.rejets.nbrj_abs := nb;
   result := true;
end;
begin
   // savoir si
   resultats_non_valides := true;
   result := false;
   try
      if part <> nil then begin
         elem_scr := part.elem_scrutin;
         if elem_scr <> nil then resultats_non_valides := elem_scr.suff_n_exp = part.pouvoirs;
         if resultats_non_valides then begin
            if (elem_scr <> nil) and elem_scr.err_pouv then begin  // en cas depassement du nb de pouvoirs on prend en compte les voix pour chacun des choix pour le participant concerné
                  bpour :=  mssge = elem_scr.msg_pour;
                  bcontre := mssge = elem_scr.msg_contre;
                  babs := mssge = elem_scr.msg_abs;
                  if bpour or bcontre or babs then affecte;
            end else begin  // on prend seulement en compte le dernier message du participant, donc on n'additionnera que pour le choix du dernier message du participant
               bpour := (choix = 'pour') or (choix = 'oui');
               bcontre :=  (choix = 'contre') or (choix = 'non');
               babs := choix = 'abs' ;
               if (bpour or bcontre or babs) then begin
                  part.rejets.msage.compte_rj := false;
                  if (part.rejets.msage <> message_nil) and (part.rejets.clne > 0) then
                     tsl_v[1, part.rejets.clne].Strings[part.rejets.lgne] := StringReplace(tsl_v[1, part.rejets.clne].Strings[part.rejets.lgne], ',', '', [rfreplaceall] );
                     //f1stringgrid.Cells[part.rejets.clne , part.rejets.lgne ] := StringReplace(f1stringgrid.Cells[part.rejets.clne , part.rejets.lgne ], ',', '', [rfreplaceall] );
                  part.rejets.msage := mssge; // donc le dernier
                  //if (bpour or bcontre or babs) and (mssge.nombre <> 0) then  tsl_v[1,col].strings[idx] := ',' + tsl_v[1,col].strings[idx] + ',';
                  part.rejets.clne := col;
                  part.rejets.lgne := idx;
                  //mssge.compte_rj := true;   fait dans affichage_m
                  if mssge.nombre <> 0 then affecte;
               end;
            end;
            if lpart_rejets.IndexOfObject(part) < 0 then lpart_rejets.AddObject('', part );
         end;
      end;
   except
      on E : exception do log_infos('Erreur dans additionne_rejetes: ' + E.message);
   end;
end;

procedure taux.ptest(Sender: tobject);
begin
   ShowMessage('procedure test');
end;

{    IDMandataire = 0;
    NomMandataire = 1
    PrenomMandataire = 2;
    MailMandataire = 3
    RegionMandataire = 4;
    ID_Mandant = 5;
    NomMandant =6;
    PrenomMandant = 7;
    MailMandant = 8;
    RegionMandant = 9;
    DateEnvoisPouvoir = 10;
    DateRéceptionPouvoir = 11;}
procedure taux.traite_pouvoirs(strl: Tstringlist; fichier : string);
var
   l_csv, l_champs, l_ID  : tstringlist ;
   i, idx_id : integer;
   receveur, donneur : tparticipant;  //r = receveur, d= donneur
   mode_convention : boolean;
function trim_valide(pst : byte) : boolean ;
var
   j : integer;
begin
   result := (l_champs.Count >= pst + 5) and (strtointdef(l_champs.Strings[pst], 0 ) > 0 ) ;
   result := result and (l_champs.Count > pst + 4);
   if result then begin
      for j := 0 to 4 do l_champs.Strings[pst + j] := trim(l_champs.Strings[pst +j]);
      for j := 1 to 4 do result := result and ( (j = MailMandataire)  or (l_champs.Strings[pst + j] <> ''));
   end;
end;
begin
   l_champs :=  tstringlist.Create ;
   l_ID :=  tstringlist.Create ;
   l_csv := strl;
   scrutin_encours.fichier_pouvoirs := fichier;
   lfic_pouvoirs.Caption := '    PATIENTEZ...    ';
   lfic_pouvoirs.Color := clyellow;
   tpanel(lfic_pouvoirs.Parent).Color := clyellow;
   lfic_pouvoirs.Parent.Refresh;
   nb_voix := 0;
   //lfic_pouvoirs.Refresh;
   if l_csv.Count > 0 then begin
      l_champs.Text := StringReplace(l_csv.Strings[0], ';' , #13#10 , [rfReplaceAll	]);   //
      mode_convention := pos( 'voix' , lowercase( l_champs.Strings[MailMandataire])) > 0; // normalement Nb de voix
      for i := 1 to l_csv.Count - 1 do begin
         try
            l_champs.Text := StringReplace(l_csv.Strings[i], ';' , #13#10 , [rfReplaceAll	]);
            if trim_valide(IDMandataire) then begin
               idx_id := l_ID.IndexOf(l_champs.Strings[IDMandataire]);
               if idx_id < 0 then begin
                  receveur := cherche_participant(l_champs.Strings[NomMandataire], l_champs.Strings[PrenomMandataire], l_champs.Strings[RegionMandataire], l_champs.Strings[IDMandataire], fichier); //strtointdef( l_champs.Strings[IDMandataire]), 0);
                  l_ID.AddObject(l_champs.Strings[IDMandataire], receveur);
                  if votants_limites and ( receveur.pouvoirs = 0) then receveur.pouvoirs := 1;
               end else begin
                  receveur := tparticipant(l_ID.Objects[idx_id]);
               end ;
               if mode_convention then begin
                  receveur.pouvoirs := strtointdef(StringReplace(l_champs.Strings[MailMandataire], '"' , '' , [rfReplaceAll]), 1);
                  setCbPouvoirschecked ;
                  nb_voix := nb_voix + receveur.pouvoirs;
               end else if trim_valide(IDMandant) then begin
                  idx_id := l_ID.IndexOf(l_champs.Strings[IDMandant]);
                  if idx_id >= 0 then begin
                     donneur := nil;
                     log_infos('plusieurs mandant avec le même N° de membre: ' + l_champs.Strings[IDMandant]);
                     //donneur := cherche_participant(l_champs.Strings[NomMandant], l_champs.Strings[PrenomMandant], l_champs.Strings[RegionMandant], l_champs.Strings[IDMandant]); //strtointdef( l_champs.Strings[IDMandataire]), 0);
                     //l_ID.AddObject(l_champs.Strings[IDMandant], donneur);
                  end else begin
                     donneur := cherche_participant(l_champs.Strings[NomMandant], l_champs.Strings[PrenomMandant], l_champs.Strings[RegionMandant], l_champs.Strings[IDMandant], fichier); //strtointdef( l_champs.Strings[IDMandataire]), 0);
                     l_ID.AddObject(l_champs.Strings[IDMandataire], receveur);
                  end ;
                  if donneur <> nil then begin
                     setCbPouvoirschecked ;  // au moins un pouvoir a été donné
                     donneur.pouvoirs := 0;
                     receveur.pouvoirs := receveur.pouvoirs + 1;  // les pouvoirs confiés s'ajoute à la voix déjà détenue en propre par le participant
                     inc(nb_pouvoirs);
                  end;
               end;
            end;
         except
            on E : exception do log_infos( 'erreur dans taux.traite_pouvoirs: ' + e.message );
         end;
      end;
   end;
   l_champs.Free;
   l_ID.Free;
   lfic_pouvoirs.Color := clBtnFace;
   tpanel(lfic_pouvoirs.Parent).Color := clBtnFace;
   if cb_pouv_val.Checked then begin
      if mode_convention then begin
         cb_pouv_val.Caption := '  ' + inttostr(nb_voix) + ' voix distribuées';
      end else begin
         cb_pouv_val.Caption := '  ' + inttostr(nb_pouvoirs) + ' pouvoirs confiés';
      end;
      lfic_pouvoirs.Caption := 'Fichier: ' + fichier;
      lfic_pouvoirs.Hint := lfic_pouvoirs.Caption;
   end else lfic_pouvoirs.Caption := '';
end;

function taux.cherche_participant(nm, prenm, regn, ID, fic_csv: string): tparticipant;
var
   i, j, idx : integer;
   err_regn : boolean ;
   reg : string;
begin
   j := 0;
   err_regn := true;
   while (j <= high(tb_regions)) and err_regn do begin
      err_regn := not (regn = tb_regions[j]);
      inc(j);
   end;
   if err_regn then reg := '' else reg := regn;
   idx := strtointdef(ID, 0);
   if (idx> 0) and (idx< 20000) then begin
      result := tparticipant(lidxparticipant.objects[idx]);
      if result = nil then begin
         result := tparticipant.create(nm, prenm, regn, fic_csv, strtointdef(ID, 0));
         //result.renseigne(nm, prenm, regn, strtointdef(ID, 0));
         result.err_region := err_regn;
      end else begin
         result := result.compare(nm, prenm, reg, fic_csv, result);
      end;
   end else begin
      i := lnmembre2index.IndexOfName(ID);
      if i < 0 then begin
         result := tparticipant.create(nm, prenm, regn, fic_csv, strtointdef(ID, 0));
         //result.renseigne(nm, prenm, regn, strtointdef(ID, 0));
         result.err_region := err_regn;
      end else begin
         result := tparticipant(lnmembre2index.objects[i]);
         result := result.compare(nm, prenm, reg, fic_csv, result);
      end;
   end;
end;



procedure taux.Export_CSV_lparticpants;
const
   s = ',';
var
   i : integer;
   sl : TStringList;
   st : string;
begin
   sl := TStringList.Create;
   //st := 'index'+s+'no_membre'+s+'region'+s+'pouvoirs'+s+'prenom'+s+'nom'+s+'texte'+s+'fichier CSV'+s+'tableau_noms'+s+'idx_chaine';
   st := 'index|no_membre|region|pouvoirs|prenom|nom|texte|fichier CSV|tableau_noms|idx_chaine' ;
   st := st + '|err_ID|err_prenom|err_nom|err_num|electeur_legitime|num_legitime|partage_nomembre|elem_scrutin';
   st := StringReplace(st, '|', s, [rfReplaceAll]);
   sl.Add(st);
   for i := 0 to lparticipants.Count -  1 do begin
      sl.Add(tparticipant(lparticipants.Objects[i]).ecrit_csv(i, s));
   end;
   try
      sl.SaveToFile(dir_trv + 'participants.csv');
   except
      on E : exception do memo_tests.add('Erreur d''enregistrement de lparticipants: ' + E.message);
   end;
   sl.Free;
end;

function tparticipant.ecrit_csv(idx : integer; s : char):string; // %d %s booltostr  Format('Copy %s to %s?', [Edit1.Text, NewFileName]);
var
   st, tab_nm, txt : string;
   i, ich  : integer;
begin // s = separateur "," par exemple
   //      i  n  r  p  p  n  t  f  t  i   
   st := '%dx%dx%sx%dx%sx%sx%sx%sx%sx%dx'; //ok ich dernier inclus
   //st := st + '%sx%sx%sx%sx%sx%sx%sx%d';
   st := StringReplace(st, 'x', s, [rfReplaceAll]);
   tab_nm := tbnom[0];
   for i := 1 to high(tbnom) do begin
      tab_nm := tab_nm + '|' + tbnom[i];
   end;
   txt := StringReplace(texte, s, '|', [rfReplaceAll]);
   ich := aux1.lparticipants.IndexOfObject(chaine_meme_id);
   //result := inttostr(i) +s+ texte +s+ fichier_CSV +s+ inttostr(pouvoirs) +s++s++s++s++s++s++s++s++s+
   result := format( st, [idx, numero, region, pouvoirs, prenom, nom, txt, fichier_CSV, tab_nm, ich]);
   result := result + booltostr(err_ID)+s+booltostr(err_prenom)+s+booltostr(err_nom)+s+booltostr(err_num)+s+booltostr(electeur_legitime)+s+booltostr(num_legitime)+s+booltostr(partage_nomembre);//+s+booltostr()+s+booltostr()+s+
   result := result+s+inttostr(cardinal(pointer(elem_scrutin)));
end;

procedure taux.traite_lconfig;
var
   i, j, p : integer;
   st, tab_reg , ficp_local, fic_FTP, nm_h_d  : string; //cfg_ftp,
   bimp_differe, ok : boolean;
   l_nouv_scrutin : tstringlist;
function retrouve_param(st_in, param : string; st_sinon : string; var ok : boolean  ): string ;
var
   pst : integer;
begin
   pst := pos(param, st_in);
   result := st_sinon;
   if pst > 0 then begin result := trim(RightStr(st, length(st) - pst - length(param)))  ; ok := true end;
end;
begin
   l_nouv_scrutin := tstringlist.create;
   for i := repere_lcongig to lconfig.Count - 1 do begin
      st := lconfig.Strings[i];
      if verif_configurateur(st) then begin
         ok := false;
         tab_reg := retrouve_param(st, tableau_regions, tab_reg, ok);
         ficp_local := retrouve_param(st, fichier_pouvoirs_local, ficp_local, ok );
         nm_h_d := retrouve_param(st, nom_heure_duree, '', ok);
         fic_FTP := retrouve_param(st, fichier_pouvoirs_FTP, fic_FTP, ok);
         if not ok then memo_tests.Add('configuration: erreur mots_clés non reconnus: ' + st);
         if nm_h_d <> '' then l_nouv_scrutin.Add(nm_h_d);
      end else memo_tests.Add('configuration: erreur configurateur: ' + st);
   end;
   repere_lcongig := lconfig.Count;
   if (tab_reg <> '') and (lparticipants.Count = 0 ) then  begin
      i := 0;
      p := 1;
      repeat
         p := PosEx(',', tab_reg, p ) ;  // les noms de région son séparés par des virgules
         if p > 0 then begin
            tab_idx[i] := p;
            inc(i);
         end;
      until p <1;
      tab_idx[i] := length(tab_reg) + 1;
      if i > 0 then begin
         SetLength(tb_regions, i + 1); // nombre virgules
         tb_regions[0] := trim(copy(tab_reg, 1, tab_idx[0] - 1));
         for j := 1 to i + 1  do begin
            tb_regions[j] := trim(copy(tab_reg, tab_idx[j-2] + 1, tab_idx[j-1] - 1 - tab_idx[j-2]));
         end;
         memo_tests.Add('configuration :nouveau tableau régions, nombre = ' + inttostr(i + 1));
      end;
   end;
   if (ficp_local <> '') and not cbpouvoirs_Checked then begin
      bimp_differe := false;
      ficp_local := retrouve_param(ficp_local, import_differe, ficp_local, bimp_differe);
      if (length(ficp_local) > 2 ) and  ((ficp_local[2] = ':') or ( copy(ficp_local, 1, 2) = '\\')) then
          Fpouv_in.Cb_relatif.Checked := false
      else Fpouv_in.Cb_relatif.Checked := true;
      Fpouv_in.Ech_local.Text := ficp_local;
      Fpouv_in.CbftpClick(Fpouv_in.Cblocal);

      if bimp_differe then ficp_local := ficp_local + ' import différé ' else Fpouv_in.PImporterClick(nil);
      memo_tests.Add('configuration : fichier_pouvoirs_local , fichier = ' + ficp_local);
   end;
   if (l_nouv_scrutin.Count >= 0 ) then config_nouv_scrutin(l_nouv_scrutin);
   // if fic_FTP <> '' then à traiter
   l_nouv_scrutin.free;
end;

{   configuration_votes = 'configuration votes';
    tableau_regions = 'tableau_regions' ;
    fichier_pouvoirs_local = 'fichier pouvoirs local';
    fichier_pouvoirs_FTP = 'fichier pouvoirs FTP';
    serveur_FTP = 'serveur FTP';
    login_FTP = 'login FTP';
    Mot_passe_FTP = 'mot de passe FTP';}

procedure taux.set_tb_regions(tabe: array of string);
var
   i :integer;
begin
   SetLength(tb_regions, high(tabe) + 1);
   for i := 0 to high(tabe) do tb_regions[i] := tabe[i];
end;

function taux.verif_configurateur(mess: string): boolean;
var
   st : string;
   p : integer;
begin
   p := pos('Ã   Tout le monde', mess);
   result := false;
   if p > 0 then begin
      st := copy(mess, 13 , p - 14);
      if configurateur = '' then begin  // le premier particpant qui envoie un message de configation este le seul à la possibité d'agir sur la configuration ultérieurement
         configurateur := st;
         result := true;
      end else begin
         result := configurateur = st;
      end;
   end;
   if not result then memo_tests.add('erreur configurateur: ' + mess);
end;

function taux.decompose(entree: string): tstringlist;
var
   i, v : integer;
   st : string;
   ds_texte : boolean;
procedure r_add( str : string);
begin
   result.Strings[result.Count - 1] := result.Strings[result.Count - 1] + str;
end;
begin
   result := tstringlist.Create;
   st := lowercase(trim(entree ));
   i := 1;
   result.Add('');
   ds_texte := false;
   while i <=  length(st) do begin
      v := ord(st[i]);
      if v = 34 then begin // caractère "
         if (i < length(st)) and (st[i + 1] = '"') then begin  // double " -> caractère " dans le texte
            r_add( '"');
            inc(i);
         end else  ds_texte := not ds_texte ;
         if ds_texte and (result.Strings[result.Count - 1] <> '') then result.Add('');
      end else if ds_texte then begin
         r_add( st[i]);
      end else if (v = 32) then begin //espace (séparateur des paramètres)
         if (result.Strings[result.Count - 1] <> '') then result.Add('');
      end else begin
         r_add(st[i]);
      end;
      inc(i);
   end;
   if result.Strings[result.Count - 1] = '' then Result.Delete(result.Count - 1);
end;

procedure taux.config_nouv_scrutin(l_nouv_scrutin : tstringlist);
var
   params: string;
   heure, duree, nom : string;
   sl : tstringlist;
   num_srutin, i, j : integer;
   ok : boolean;
   scrutin : tscrutin;
begin
   for j := 0 to l_nouv_scrutin.Count - 1 do begin
      params := l_nouv_scrutin.Strings[j];
      ok := false;
      sl := decompose(params);
      num_srutin := 1;
      if sl.Count >= 3 then begin
         nom := Utf8ToAnsi(sl.Strings[0]); //ansi
         heure := sl.Strings[1];
         duree := sl.Strings[2];
         repeat
            inc(num_srutin);
            i := lscrutin.IndexOf(inttostr(num_srutin)) ;
         until i < 0;
         ok := (heure[3] = ':') and (heure[6] = ':') and (duree[3] = ':') and (strtointdef(copy(heure, 1, 2) , 99) in [0.. 59]) and (strtointdef(copy(heure, 4, 2) , 99) in [0.. 59]) and (strtointdef(copy(heure, 7, 2) , 99) in [0.. 59]) and (strtointdef(copy(duree, 1, 2) , 99) in [0.. 59]) and (strtointdef(copy(duree, 4, 2) , 99) in [0.. 59]) ;
      end;
      sl.Free;
      if ok then begin
         scrutin := tscrutin.create(num_srutin, nom);
         scrutin.heure_debut     :=  heure ;
         scrutin.duree           :=  duree ;
         scrutin.fichier_message :=  scrutin_encours.fichier_message ;
         scrutin.nombre_membres  :=  scrutin_encours.nombre_membres;
         if config_nv_scrutin = 0 then begin
            config_nv_scrutin := num_srutin;
            ENoVote_.Text := inttostr(num_srutin);
         end;
         memo_tests.Add('configuration : ' + nom_heure_duree + ' ' + inttostr(num_srutin) + ' ' + nom + ' ' + heure + ' ' + duree);
      end else begin
         memo_tests.Add('configuration rejetée : ' + params);
      end;
   end;
end;

procedure taux.remplit_fic_sortie(scrutin : tscrutin; nb_m_ph : integer);
var
   sl : tstringlist;
   deb_ligne, fin_ligne, st : string;
   fspea,fspeb : string;
   i : integer;
   tf : textfile;
   fs : TFormatSettings;
   scrt : string;
begin
   sl := TStringList.Create;
   if fichier_sortie = '' then begin
      fichier_sortie_ok := false;
      ligne_vide := StringReplace( ligne_titre, ',', #13#10, [rfReplaceAll] );
      sl.Text := ligne_vide;
      for i := 0 to sl.Count - 1 do sl.Strings[i] := '';
      ligne_vide := sl.Text;
      deb_ligne := inttostr(0) + ',"';
      fin_ligne := '"';
      for i := 3 to sl.Count do fin_ligne := fin_ligne + ',';
      fspea := '"';
      for i := 2 to chnb_msg do fspea := fspea + ',';
      fspeb := '"';
      for i := chnb_msg to sl.Count - 2 do fspeb := fspeb + ',';
      sl.clear;
      sl.Add(ligne_titre);
      st := deb_ligne + 'Titre = ' + titre_reunion + fspea;
      sl.Add(st + '"ds la plage horaire' + fspeb);
      sl.Add(deb_ligne + 'Nombre de membres = '+ inttostr(scrutin.nombre_membres) + fin_ligne);
      if votants_limites then sl.Add(deb_ligne + 'Votes RESERVE aux inscrits' + fin_ligne)
      else sl.Add(deb_ligne + 'Votes NON limité aux inscrits' + fin_ligne);
      sl.Add(deb_ligne + 'Fichier des messages = ' + scrutin.fichier_message  + fin_ligne);
      sl.Add(deb_ligne + 'Fichier des messages second PC = ' + fichier_msg_scnd_PC  + fin_ligne);
      sl.Add(deb_ligne + 'Fichier des pouvoirs = ' + scrutin.fichier_pouvoirs  + fin_ligne);
      sl.Add(deb_ligne + 'Source du fichier des pouvoirs: ' + source_pouvoirs + fin_ligne);
      sl.Add(deb_ligne + 'nombre de pouvoirs confiés = ' + inttostr(aux1.nb_pouvoirs) + fin_ligne);
      sl.Add(deb_ligne + 'programme = ' + tform(f1stringgrid.Owner).Caption + fin_ligne);
      //sl.Add(deb_ligne +  + fin_ligne);
      //sl.Add(deb_ligne +  + fin_ligne);
      //sl.Add(deb_ligne +  + fin_ligne);
      //sl.Add(deb_ligne +  + fin_ligne);
      sl.Add(ligne_titre);
      GetLocaleFormatSettings(SysLocale.DefaultLCID, fs);
      fs.DateSeparator := '_';
      fs.TimeSeparator := '_';
      fs.ShortDateFormat := 'dd/mm/yy';
      fs.ShortTimeFormat := 'hh:mm:ss';
      fichier_sortie := DateTimeToStr(Now, fs) ;  //'12_04_21 12_15_15'
      fichier_sortie[9] := '_';
      fichier_sortie :=  'ana_votes_' + fichier_sortie + '.csv' ;
      try
         sl.SaveToFile(dir_trv + fichier_sortie);
         fichier_sortie_ok := true;
      except
         on E : exception do log_infos('Erreur d''enregistrement du fichier de sortie: ' + E.Message);
      end;
   end;
   if fichier_sortie_ok then begin
      with scrutin do begin
         if not scr_secret then scrt := 'non' else if secret_only then scrt := 'strict' else scrt := 'tolerant';
         sl.Text := ligne_vide;
         sl.Strings[chVote_No] := IntToStr(numero);
         sl.Strings[chnom_vote] := '"' + nom + '"';
         sl.Strings[chNb_votants] := IntToStr(ttl_votants);
         sl.Strings[chNb_pour] := IntToStr(ttl_pour);
         sl.Strings[chNb_contre] := IntToStr(ttl_contre);
         sl.Strings[chNb_abstention] := IntToStr(ttl_abs);
         sl.Strings[chheure_debut] := '"' + heure_debut + '"';
         sl.Strings[chduree] := '"' + duree + '"';
         sl.Strings[chnb_msg] := '"' + inttostr(nb_m_ph) + '"';
         sl.Strings[chrejetspour] :=  IntToStr(ttl_rj_p);
         sl.Strings[chrejetscontre] :=  IntToStr(ttl_rj_c);
         sl.Strings[chrejetsabs] :=  IntToStr(ttl_rj_a);
         sl.Strings[chvotesecret] := scrt;
         sl.Strings[chdureetrtmt] := inttostr(duree_trtmnt);
         sl.Strings[chheuretrtmt] := heure_traitement;
         try
            assignfile(tf, dir_trv + fichier_sortie);
            append(tf);
            writeln(tf, StringReplace(sl.Text, #13#10, ',', [rfReplaceAll] ));
            closefile(tf);
         except
            on E : exception do log_infos('Erreur d''enregistrement du fichier de sortie: ' + E.Message);
         end;
      end;
   end;
   sl.Free;
end;

{procedure tscrutin.aff_totaux_rejetes;
begin
   Erjpour_.text := inttostr(ttl_rj_p); Erjcontre_.text := inttostr(ttl_rj_c); Erjabs_.text := inttostr(ttl_rj_a);
end;}

procedure tscrutin.aff_totaux_rejetes;
var
   i : integer;
   part : tparticipant;
function incremente(ttl, nombre, nb_pv : integer): integer;
begin
   if nombre < 0 then result := ttl + nb_pv else result := ttl + nombre;
end;
begin
   ttl_rj_p := 0; ttl_rj_c := 0; ttl_rj_a := 0;
   for i := 0 to lpart_rejets.Count -1 do begin
      part := tparticipant(lpart_rejets.Objects[i]);
      ttl_rj_p := incremente(ttl_rj_p, part.rejets.nbrj_pour, part.pouvoirs) ;
      ttl_rj_c := incremente(ttl_rj_c, part.rejets.nbrj_contre, part.pouvoirs) ;
      ttl_rj_a := incremente(ttl_rj_a, part.rejets.nbrj_abs, part.pouvoirs) ;
      part.rejets.er_pv := false;
      part.rejets.msage := message_nil;
   end;
   Erjpour_.text := inttostr(ttl_rj_p); Erjcontre_.text := inttostr(ttl_rj_c); Erjabs_.text := inttostr(ttl_rj_a);
   lpart_rejets.Clear;
end;

procedure taux.clear_tmessages;
var
   i: integer;
begin
   for i := 0 to lmessages_gen.Count -1 do begin
      lmessages_gen.Objects[i].Free;
      lmessages_gen.Objects[i] := nil;
   end
end;

procedure taux.clear_l_votes;
begin
   sl_pv_disp.Clear ;
   sl_v_p_disp.Clear ;
   sl_v_c_disp.Clear ;
   sl_v_a_disp.Clear ;
   sl_pv_util.Clear ;
   sl_v_p_util.Clear ;
   sl_v_c_util.Clear ;
   sl_v_a_util.Clear ;
end;


procedure tscrutin.set_secret(lb_secret: integer);
begin
   scr_secret := not(lb_secret = lb_n_secret);
   secret_only := lb_secret = lb_secret_s;
end;

end.

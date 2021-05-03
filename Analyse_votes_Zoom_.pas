unit Analyse_votes_Zoom_;

//Un clic sur le bouton "Editer" fait disparaitre un composant transparent(label vide ?) au-dessus e la zone "Entrée" et remet à zéro les résultats
// sendmessage -> équivalet clic souris sur tstringgrid ?
{

]

{$DEFINE Mensa } //aide: compilation conditionnelle

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Grids, Auxiliaire, math, ComCtrls,
  informations, StdActns, pouvoirs_in, commun, merge;

const
    hint_image1 = 'pouvoirs = erreur en relation avec le nombre de pouvoirs' + #13#10 +
                  '           (trop de suffrage) (0 le pouboir a été donné à quelqu''un' + #13#10 +
                  'ID = erreur concernant le nom et le prénom'  + #13#10 +
                  'N° = erreur concernant numéro de membre' + #13#10 ;

type
  TForm1 = class(TForm)
    PEntrees: TPanel;
    PAction: TPanel;
    BTraitement: TButton;
    PResultats: TPanel;
    PRejets: TPanel;
    LResultats: TLabel;
    LEntree: TLabel;
    LAction: TLabel;
    LAnalyse: TLabel;
    ENoVote: TEdit;
    Label1: TLabel;
    Ldebut: TLabel;
    ME_heure: TMaskEdit;
    Efic_msg: TEdit;
    Label2: TLabel;
    Lduree: TLabel;
    ME_duree: TMaskEdit;
    StringGrid1: TStringGrid;
    Ppour: TPanel;
    Label11: TLabel;
    Epour: TEdit;
    Ep_ppc_exp: TEdit;
    Ep_ppc_nbmb: TEdit;
    Pcontre: TPanel;
    Label12: TLabel;
    Econtre: TEdit;
    Ec_ppc_exp: TEdit;
    Ec_ppc_nbmb: TEdit;
    Pabs: TPanel;
    Label16: TLabel;
    Eabs: TEdit;
    Ea_ppc_exp: TEdit;
    Ea_ppc_nbmb: TEdit;
    Pnon_exp: TPanel;
    Label17: TLabel;
    Enon_exp: TEdit;
    Edit21: TEdit;
    Ene_ppc_nbmb: TEdit;
    Pvotants: TPanel;
    Label13: TLabel;
    Evotants: TEdit;
    Edit9: TEdit;
    Ev_ppc_nbmb: TEdit;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Enb_membres: TEdit;
    Image1: TImage;
    Label3: TLabel;
    BEditer: TButton;
    Erjpour: TEdit;
    Erjcontre: TEdit;
    Erjabs: TEdit;
    Ltotaux: TLabel;
    Cbpouvoirs: TCheckBox;
    ButtonA: TButton;
    Button4: TButton;
    Button5: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Efiltre: TEdit;
    Pchoix_msg: TPanel;
    Lmessages: TLabel;
    Pdebug: TPanel;
    Icroix: TImage;
    Ifl_ext: TImage;
    Btst_pres: TButton;
    Button3: TButton;
    Pifl_ext: TPanel;
    Mtest: TMemo;
    Btst_fic_msg: TButton;
    Bch_msg: TButton;
    Baff_lmsg: TButton;
    Benr_lmsg: TButton;
    Bcree_lvote: TButton;
    BAff_lvote: TButton;
    BAff_lparticipants: TButton;
    Label5: TLabel;
    Lnomvote: TLabel;
    Enomvote: TEdit;
    Binfo: TButton;
    Rrejetes: TRadioButton;
    Rtousmsg: TRadioButton;
    LRejetes: TLabel;
    LTous_msg: TLabel;
    Pmasque_totaux: TPanel;
    Baff_messages: TButton;
    Ptous_msg: TPanel;
    Ltous_mess: TLabel;
    Cbvnreconnus: TCheckBox;
    Bvidelistes: TButton;
    Bsel_strggd: TButton;
    LNb_msg: TLabel;
    UpDown1: TUpDown;
    Linformation: TLabel;
    LUtilisation: TLabel;
    Bfcolor: TButton;
    Btest: TButton;
    BExport_CSV_lparticpants: TButton;
    Bselectfic: TButton;
    OpenDialog1: TOpenDialog;
    Ppouvoirs : tpanel;
    pinformations : tpanel;
    lcompte_partiellement : tlabel;
    lcompte_rejetes : tlabel;
    lcompte_resultats : tlabel;
    inombres : timage;
    Linfo_moins1: TLabel;
    Lfichier_pouvoirs: TLabel;
    Beff_tmessages: TButton;
    Linfo_pv: TLabel;
    RVoix_dispo: TRadioButton;
    RVoix_utilisees: TRadioButton;
    ListBox1: TListBox;
    Etests: TEdit;
    BMerge: TButton;
    Lnb_mess_ph: TLabel;
    cb_votes_lim: TCheckBox;
    Benregistremt_stringgrid: TButton;
    Cb_enr_aff: TCheckBox;
    enregistrement_merge: TCheckBox;
    Cbanalysevisible: TCheckBox;
    RichEdit1: TRichEdit;
    Rvotes_multiples: TRadioButton;
    Lvotes_precfg: TLabel;
    Brepli: TButton;
    Bvotes_multiples: TButton;
    Laremplir: TLabel;
    procedure setchecked(rb : TRadioButton); //change le positionnement sans lancer un nouvel affichage
    procedure maj_entrees;
    procedure trf_entrees;
    procedure clear_aff_messages;
    procedure traite_params;
    procedure eff_stringgrid1;
    procedure test_presentation(n : integer);
    procedure init_tsl_votes;
    procedure FormCreate(Sender: TObject);
    procedure LAnalyseClick(Sender: TObject);
    procedure ButtonAClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure place_ifl_ext;
    procedure IcroixMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure IcroixMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure IcroixMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ifl_extMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Ifl_extMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Ifl_extMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Btst_presClick(Sender: TObject);
    procedure Btst_fic_msgClick(Sender: TObject);
    procedure Bch_msgClick(Sender: TObject);
    procedure Baff_lmsgClick(Sender: TObject);
    procedure Benr_lmsgClick(Sender: TObject);
    procedure Bcree_lvoteClick(Sender: TObject);
    procedure BAff_lvoteClick(Sender: TObject);
    procedure BAff_lparticipantsClick(Sender: TObject);
    procedure aff_strigrid(str : tstrings);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BinfoClick(Sender: TObject);
    procedure RtousmsgClick(Sender: TObject);
    procedure RrejetesClick(Sender: TObject);
    procedure Baff_messagesClick(Sender: TObject);
    procedure BvidelistesClick(Sender: TObject);
    procedure Bsel_strggdClick(Sender: TObject);
    procedure LRejetesMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EfiltreChange(Sender: TObject);
    procedure set_Efiltre_sans_aff( texte : string);
    procedure EnomvoteChange(Sender: TObject);
    procedure ENoVoteChange(Sender: TObject);
    procedure BTraitementClick(Sender: TObject);
    procedure clear_resultats;
    procedure init_resultats;
    procedure ME_heureChange(Sender: TObject);
    procedure LinformationClick(Sender: TObject);
    procedure BfcolorClick(Sender: TObject);
    procedure enable_entrees( horaire, fic_mess, fic_csv : boolean);
    procedure BEditerClick(Sender: TObject);
    procedure Enb_membresClick(Sender: TObject);
    procedure BtestClick(Sender: TObject);
    procedure CbpouvoirsClick(Sender: TObject);
    procedure BExport_CSV_lparticpantsClick(Sender: TObject);
    procedure BselectficClick(Sender: TObject);
    procedure CbvnreconnusClick(Sender: TObject);
    procedure Efic_msgChange(Sender: TObject);
    procedure Beff_tmessagesClick(Sender: TObject);
    procedure RVoix_dispoClick(Sender: TObject);
    procedure LTous_msgClick(Sender: TObject);
    procedure LRejetesClick(Sender: TObject);
    procedure Pmasque_totaux_Visible( ok, hint_ : boolean);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EtestsChange(Sender: TObject);
    procedure BMergeClick(Sender: TObject);
    procedure cb_votes_limClick(Sender: TObject);
    procedure Benregistremt_stringgridClick(Sender: TObject);
    procedure Cb_enr_affClick(Sender: TObject);
    procedure enregistrement_mergeClick(Sender: TObject);
    procedure CbanalysevisibleClick(Sender: TObject);
    procedure set_listbox(scr_secret, secret_only : boolean);
    function get_lb_topindex : integer;
    procedure Rvotes_multiplesClick(Sender: TObject);
    procedure BrepliClick(Sender: TObject);
    procedure Bvotes_multiplesClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    mx, my : integer ;
    en_deplacement: boolean;
    colorselect : tcolorselect;
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

uses
    Clipbrd ;

const
    tag_stop = -3;

procedure TForm1.FormCreate(Sender: TObject);
var
   i, l : integer;
begin
   lnb_msg_ph := lnb_mess_ph;
   aux1 := taux.create;
   i := strtointdef(ENoVote.Text, 0) ;
   if i > 0 then aux1.scrutin_encours := tscrutin.create(i, enomvote.text);
   //aux1.initialise;

   l := 25;

   // ligne pouvoirs, pour, contre , abs, non exprimé, ID incorrecte ,  incorrect : nom, prenom, n°, région, suffrage, > pouvoirs , 2 nb, 2 choix
   StringGrid1.ColWidths[0] := StringGrid1.Width - (l +1) * (StringGrid1.ColCount - 1) - 20;
   for i := 1 to StringGrid1.ColCount - 1 do StringGrid1.ColWidths[i] := l;

   caption := 'Analyse des votes par messages Zoom       version ' + Aux1.getversion + '      GG';
   Efic_msg.Text := Aux1.get_fichier_msg(rep_msg_def);
   place_ifl_ext;
   Pifl_ext.BringToFront;
   traite_params;
   image1.Hint := hint_image1;
   memo_tests := mtest.Lines;
   f1stringgrid := stringgrid1;
   stringgrid1rowscount := StringGrid1.RowCount;
   strgrd_colcount := StringGrid1.colcount;
   clear_resultats;
   init_resultats;
   if debug then colorselect := tcolorselect.Create(self); // sera déruit par form1 à la fin du programme
   color := tcolor(10867674);  //(4227327);
   cb_pouv_val := Cbpouvoirs;
   lfic_pouvoirs := Lfichier_pouvoirs;
   init_tsl_votes;
   rv_disp := RVoix_dispo;
   erj_pour := Erjpour; erj_contre := Erjcontre; erj_abs := Erjabs ;
   Bmerge.Caption := 'Merge des' + #13#10 + 'entrées';
   cb_votants_lim := cb_votes_lim ;
   ENoVote_ := ENoVote ;
   Cbenraff  := Cb_enr_aff;
   liste_infos := tstringlist.Create;
   lvotesprecfg := Lvotes_precfg;
   La_remplir := laremplir;
end;

procedure TForm1.init_tsl_votes;
begin
   sl_pv_disp  := TStringList.Create ;
   sl_v_p_disp := TStringList.Create ;
   sl_v_c_disp := TStringList.Create  ;
   sl_v_a_disp := TStringList.Create  ;
   sl_pv_util  := TStringList.Create  ;
   sl_v_p_util := TStringList.Create  ;
   sl_v_c_util := TStringList.Create  ;
   sl_v_a_util := TStringList.Create  ;
   tsl_v[1 ,1 ] :=  sl_pv_disp  ;
   tsl_v[1 ,2 ] :=  sl_v_p_disp ;
   tsl_v[1 ,3 ] :=  sl_v_c_disp  ;
   tsl_v[1 ,4 ] :=  sl_v_a_disp  ;
   tsl_v[2 ,1 ] :=  sl_pv_util   ;
   tsl_v[2 ,2 ] :=  sl_v_p_util  ;
   tsl_v[2 ,3 ] :=  sl_v_c_util  ;
   tsl_v[2 ,4 ] :=  sl_v_a_util  ;
end;


procedure TForm1.test_presentation(n : integer);
var
   i : integer;
   ok : boolean;
   fic_strgrd : string;
begin
   eff_stringgrid1;
   fic_strgrd :=  ExtractFilePath(paramstr(0)) + 'msg_rejetes\' + '\' + inttostr(n) + '\' + 'rejets_row';
   i := 0;
   ok := false;
   while fileexists(fic_strgrd + inttostr(i) + '.txt') do begin
      if not ok then
      StringGrid1.Rows[i].Clear;
      StringGrid1.Rows[i].LoadFromFile(fic_strgrd + inttostr(i) + '.txt');
      inc(i);
      ok := true;
   end;
end;

procedure TForm1.eff_stringgrid1;
var
   i : integer;
   //Rect: TGridRect;
begin
   StringGrid1.RowCount := stringgrid1rowscount;
   for i := 0 to StringGrid1.ColCount -1 do begin
      StringGrid1.cols[i].Clear;
   end;
   //StringGrid1.ScrollBars.Visible := false; //   .VertScrollBar.Position := 0;
   //StringGrid1.RowCount := 10; StringGrid1.RowCount := stringgrid1rowscount;
   StringGrid1.row := 0;
   StringGrid1.col := 0;  // efficace pour ramener la vue au début du tableau si on cliquer sur une cellule au prélable
   {rect.Top := 0;
   rect.left := 0;
   rect.Right := 1;
   rect.Bottom := 1;
   StringGrid1.Selection := rect; }
   nb_msg_affiches := 0;
end;

procedure TForm1.LAnalyseClick(Sender: TObject);
var
   i : integer;
begin
   for i := 0 to StringGrid1.RowCount -1 do begin
      //StringGrid1.Rows[i].SaveToFile(fic_strgrd + inttostr(i) + '.txt');
   end;
end;

procedure TForm1.ButtonAClick(Sender: TObject);  // appelé par tous les bouton affichant les lettres de l'alphabet
var
   lettre : string;

begin
   lettre := tbutton(sender).Caption;
   //RtousmsgClick(nil); // nil -> aff_messages non lancé
   if Rvotes_multiples.Checked then begin
      Ltous_mess.caption := 'Messages "' + lettre + '"';
      set_Efiltre_sans_aff(lettre);
      Aux1.aff_votes_multiples(Cbvnreconnus.Checked, lettre,  Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  );
   end else begin
      setchecked(Rtousmsg); //change le positionnement sans lancer un nouvel affichage
      Ltous_mess.caption := 'Messages "' + lettre + '"';
      set_Efiltre_sans_aff(lettre);
      Aux1.aff_messages(false, Cbvnreconnus.Checked, lettre, Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
      //casse sans importance pour filtre
   end;
   {Erjpour.Text := '';
   Erjcontre.Text := '';
   Erjlabs.Text := ''; }
   //aux1.aff_lvote(StringGrid1, Rrejetes.Checked, Cbvnreconnus.Checked, Efiltre.Text) ;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Aux1.Free;
   sl_pv_disp.Free ;
   sl_v_p_disp.Free ;
   sl_v_c_disp.Free ;
   sl_v_a_disp.Free ;
   sl_pv_util.Free ;
   sl_v_p_util.Free ;
   sl_v_c_util.Free ;
   sl_v_a_util.Free ;
   liste_infos.Free ;
end;

procedure TForm1.place_ifl_ext;
begin
   pIfl_ext.Left := Pdebug.Width - 30;
   pIfl_ext.Top := Pdebug.Height - 30;
end;

procedure TForm1.IcroixMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   mx := x ;
   my := y ;
   en_deplacement := false;
end;

procedure TForm1.IcroixMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
   dx , dy : integer;
begin
   if (ssLeft in Shift) and  not en_deplacement then begin
      en_deplacement := true;
      dx := x  - mx;
      dy := y  - my;
      Pdebug.Left := max(Pdebug.Left + dx, 0);
      pdebug.Top := max(Pdebug.Top + dy, 0);
      Application.ProcessMessages;
      en_deplacement := false;
   end;
end;

procedure TForm1.IcroixMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   dx , dy : integer;
begin
   if  not en_deplacement then begin
      en_deplacement := true;
      dx := x  - mx;
      dy := y  - my;
      Pdebug.Left := max(Pdebug.Left + dx, 0);
      pdebug.Top := max(Pdebug.Top + dy, 0);
      Application.ProcessMessages;
      en_deplacement := false;
   end;
end;

procedure TForm1.Ifl_extMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   mx := x  ;
   my := y ;
   en_deplacement := false;
end;

procedure TForm1.Ifl_extMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
   dx , dy : integer;
begin
   if (ssLeft in Shift) and  not en_deplacement then begin
      en_deplacement := true;
      dx := x  - mx;
      dy := y  - my;
      Pdebug.Width := max(Pdebug.Width + dx, 40);
      pdebug.Height := max(Pdebug.Height + dy, 40);
      if Pdebug.Width >= 380 then Mtest.Width := Pdebug.Width - Mtest.Left - 3;
      place_ifl_ext;
      //tcontrol(Ifl_ext).SetZOrder(true);
      Application.ProcessMessages;
      en_deplacement := false;
   end;
end;

procedure TForm1.Ifl_extMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{var
   dx , dy : integer;
begin
   if not en_deplacement then begin
      en_deplacement := true;
      dx := x  - mx;
      dy := y  - my;
      Pdebug.Width := Pdebug.Width + dx;
      pdebug.Height := Pdebug.Height + dy;
      place_ifl_ext;
      Application.ProcessMessages;
      en_deplacement := false;
   end; }
end;

procedure TForm1.BrepliClick(Sender: TObject);
begin
   Pdebug.Width := 40;
   pdebug.Height := 40;
   pdebug.Left := pinformations.left;
   pdebug.top := pinformations.Top + pinformations.Height;
   place_ifl_ext;
end;

procedure TForm1.traite_params;
var
   i : Integer;
begin
   debug := false;
   for i := 1 to ParamCount do begin
      if paramstr(i) = 'debug' then begin debug := true ; Pdebug.Visible := true; end;

   end;
   fi_debug := debug ;
   fp_debug := debug ;
end;



procedure TForm1.Btst_presClick(Sender: TObject);
begin
   test_presentation(TComponent(sender).tag);
end;

procedure TForm1.Btst_fic_msgClick(Sender: TObject);
begin
   Mtest.Lines.Add( Aux1.get_fichier_msg(rep_msg_def));
end;

procedure TForm1.Bch_msgClick(Sender: TObject);
begin
   aux1.videlistes;
   aux1.charge_fic_msg(Efic_msg.Text, aux1.lmessages_gen);
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
}
procedure TForm1.Baff_lmsgClick(Sender: TObject);
begin
   aff_strigrid(aux1.lmessages_gen); // lorsque StringGrid1.rowscount étéil = à 20 et lmessages.count était = à 121, cela n'a pa pasréé d'erreue, seules les 20 premièrsmessage étaient affichés
end;

procedure TForm1.Benr_lmsgClick(Sender: TObject);
begin
   Aux1.lmessages_gen.SaveToFile(dir_trv + 'lmessages.txt');
end;

procedure TForm1.Bcree_lvoteClick(Sender: TObject);
begin
   aux1.lvotes_dbg := Aux1.select_lvotes(ME_heure.Text, ME_duree.Text, true, false, Aux1.lmessages_gen, aux1.lvotes_dbg);
end;

procedure TForm1.BAff_lvoteClick(Sender: TObject);
var
   sl : tstringlist;
   i : integer;
begin
   sl := TStringList.Create;
   if aux1.lvotes_dbg.idx_deb >=0 then begin
      for i := aux1.lvotes_dbg.idx_deb to aux1.lvotes_dbg.idx_fin do sl.Add(aux1.lmessages_gen.Strings[i]);
      aff_strigrid(sl)   ;
      l_aff := nil;
   end;
   sl.Free;
end;

procedure TForm1.Baff_messagesClick(Sender: TObject);
var
   nb : integer;
begin
   eff_stringgrid1;
   if Rrejetes.Checked then begin
      nb := Aux1.aff_messages( Rrejetes.Checked, false, '', aux1.lmessages_gen, aux1.lvotes_dbg);
   end else begin
      nb := Aux1.aff_messages( Rrejetes.Checked, Cbvnreconnus.Checked, Efiltre.Text, aux1.lmessages_gen, aux1.lvotes_dbg);
   end;
   LNb_msg.Caption := inttostr(nb) + ' messages affichés';
end;

procedure TForm1.BAff_lparticipantsClick(Sender: TObject);
begin
   aff_strigrid(aux1.lparticipants);
   l_aff := aux1.lparticipants;
end;

procedure TForm1.aff_strigrid(str : tstrings);
begin
   eff_stringgrid1;
   StringGrid1.cols[0].Assign(str);
end;


{ANSI_CHARSET	0	Caractères ANSI.
DEFAULT_CHARSET	1	La fonte est choisie en se basant seulement sur le nom et la taille. Si la fonte décrite n'est pas disponible sur le système, Windows lui substituera une autre fonte.
SYMBOL_CHARSET	2	Jeu symbole standard.
MAC_CHARSET	77	Caractères Macintosh. Non disponible sur NT 3.51.
SHIFTJIS_CHARSET	128	Caractères Japonais shift-JIS.
HANGEUL_CHARSET	129	Caractères Coréens (Wansung).
JOHAB_CHARSET	130	Caractères Coréens (Johab). Non disponible sur NT 3.51

GB2312_CHARSET	134	Caractères Chinois simplifiés (mainland china).
CHINESEBIG5_CHARSET	136	Caractères chinois traditionnels (taïwan).
GREEK_CHARSET	161	Caractères Grecs. Non disponible sur NT 3.51.
TURKISH_CHARSET	162	Caractères Turcs. Non disponible sur NT 3.51
VIETNAMESE_CHARSET	163	Caractères Vietnamiens. Non disponible sur NT 3.51.
HEBREW_CHARSET	177	Caractères Hébreux. Non disponible sur NT 3.51
ARABIC_CHARSET	178	Caractères Arabes. Non disponible sur NT 3.51

BALTIC_CHARSET	186	Caractères Baltiques. Non disponible sur NT 3.51.
RUSSIAN_CHARSET	204	Caractères Cyrilliques. Non disponible sur NT 3.51.
THAI_CHARSET	222	Caractères Thaï. Non disponible sur NT 3.51
EASTEUROPE_CHARSET	238	Comprend les marques diacritiques pour les pays de l'Europe de l'Est. Non disponible sur NT 3.51.
OEM_CHARSET	255	Dépend de la page de code du système d'exploitation.}


procedure TForm1.StringGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   gc  : TGridCoord;
begin
   if debug then begin
      gc := StringGrid1.MouseCoord(X, Y);
      Clipboard.Open;
      if (gc.X < StringGrid1.ColCount) and (gc.Y < StringGrid1.RowCount) and (gc.X >= 0) and (gc.Y >= 0) then
         Clipboard.SetTextBuf(pchar(StringGrid1.Cells[gc.X , gc.Y]));
      Clipboard.Close;
   end;
end;

procedure TForm1.BinfoClick(Sender: TObject);
begin
   showmessage(inttostr(high(rempl_acc)));

end;

procedure TForm1.RtousmsgClick(Sender: TObject);
begin
   //Rtousmsg.Checked := true;
   Pmasque_totaux_Visible(RVoix_utilisees.Checked, false);
   Ptous_msg.Visible := true;
   LTous_mess.Caption := 'Messages';
   if tag = tag_stop then begin
      tag := 0;
   end else if Rtousmsg.Checked then begin
      set_Efiltre_sans_aff('');
      Aux1.aff_messages(false, Cbvnreconnus.Checked, '', Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  );
   end;
end;

procedure TForm1.Rvotes_multiplesClick(Sender: TObject);
begin
   Pmasque_totaux_Visible(false, false);
   Ptous_msg.Visible := true;
   LTous_mess.Caption := 'Messages';
   setCb_enr_affchecked(false);
   if tag = tag_stop then begin
      tag := 0;
   end else if Rvotes_multiples.Checked then begin
      set_Efiltre_sans_aff('');
      aux1.aff_votes_multiples(Cbvnreconnus.Checked, '',  Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  );
      //Aux1.aff_messages(false, Cbvnreconnus.Checked, '', Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  );
   end;
end;

procedure TForm1.Bvotes_multiplesClick(Sender: TObject);
begin
   {Pmasque_totaux_Visible(false, false);
   Ptous_msg.Visible := true;
   LTous_mess.Caption := 'Messages';
   setCb_enr_affchecked(false);
   if tag = tag_stop then begin
      tag := 0;
   end else if Rvotes_multiples.Checked then begin
      set_Efiltre_sans_aff('');
      aux1.aff_votes_multiples(Cbvnreconnus.Checked, '',  Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  );
      //Aux1.aff_messages(false, Cbvnreconnus.Checked, '', Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  );
   end; }
   Rvotes_multiples.Checked := true;
   Rrejetes.Enabled := false;
   Rtousmsg.Enabled := False;
   //Rvotes_multiples.Enabled := false;
   PRejets.Visible := true;
end;

procedure TForm1.set_Efiltre_sans_aff( texte : string);
begin
   Efiltre.Tag := tag_stop;
   Efiltre.Text := texte;
   Efiltre.Tag := 0;
end;

procedure TForm1.RrejetesClick(Sender: TObject);
begin
   //Rrejetes.Checked := true;
   Pmasque_totaux_Visible(true, true);
   Ptous_msg.Visible := false;
   if (tag = tag_stop)  then begin
      tag := 0;
   end else if Rrejetes.Checked then begin
      //Lmessages. := 'Messages rejetés';
      //if sender <> nil then
      set_efiltre_sans_aff('');
      Aux1.aff_messages(true, Cbvnreconnus.Checked, '', Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
   end;
end;

procedure TForm1.BvidelistesClick(Sender: TObject);
begin
   Aux1.videlistes;
end;

procedure TForm1.Bsel_strggdClick(Sender: TObject);
//var
  // Rect: TGridRect;
begin
   //FocusControl(stringgrid1);
   {rect.Top := 0;
   rect.left := 0;
   rect.Right := 1;
   rect.Bottom := 1;   }
   //StringGrid1.Selection := rect;
   //FocusControl(stringgrid1);
   //SetFocusedControl(stringgrid1) ;
   //DefocusControl(stringgrid1, true) ;

   StringGrid1.row := 0;
   StringGrid1.col := 0;

   //SetFocusedControl(stringgrid1) ;  }
   //TCustomGrid(StringGrid1).FocusCell(0,0);
   //tcustomgrid(StringGrid1).FocusCell(0,0);

end;

procedure TForm1.LRejetesMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
end;

procedure TForm1.EfiltreChange(Sender: TObject);
begin
   if efiltre.Tag <> tag_stop then begin   // sender <> Efiltre then begin (n'est pas bon : c'est le message de efiiltre qui a été changé)
      //RtousmsgClick(nil); // nil -> aff_messages non lancé
      if Rvotes_multiples.Checked then begin
         Ltous_mess.caption := 'Messages "' + Efiltre.text + '"';
         aux1.aff_votes_multiples(Cbvnreconnus.Checked, Efiltre.text, Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
      end else begin
         setchecked(Rtousmsg); //change le positionnement sans lancer un nouvel affichage

         Ltous_mess.caption := 'Messages "' + Efiltre.text + '"';
         Aux1.aff_messages(false, Cbvnreconnus.Checked, Efiltre.text, Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
         //casse sans importance pour filtre
      end;
   end;
end;

procedure TForm1.EnomvoteChange(Sender: TObject);
var
   i : integer;
begin
   i := aux1.lscrutin.IndexOf(trim(ENoVote.Text));
   if i >=0 then begin
      tscrutin(aux1.lscrutin.Objects[i]).nom := Enomvote.text;
   end;
end;

procedure TForm1.ENoVoteChange(Sender: TObject);
var
   i , num : integer;
begin
   num := strtointdef(ENoVote.Text, 0);
   if num > 0 then begin
      try
         i := aux1.lscrutin.IndexOf(inttostr(num));
         if (i >=0) then begin
            if (Aux1.scrutin_encours <> tscrutin(aux1.lscrutin.Objects[i])) then begin
               trf_entrees;
               Aux1.scrutin_encours := tscrutin(aux1.lscrutin.Objects[i]);
               Enomvote.text := Aux1.scrutin_encours.nom ;
               maj_entrees;
               Aux1.scrutin_encours.processed := false;
               Aux1.scrutin_encours.maj_resultats;
               if Aux1.scrutin_encours.ttl_exp > 0 then enable_entrees(false, false, false);
            end;
         end else begin
            trf_entrees;
            Aux1.scrutin_encours := tscrutin.create(num, '');
            Enomvote.Text := '';
            trf_entrees;
            clear_resultats;
            enable_entrees(true, false, false);
         end;
         clear_aff_messages;
      except
         On E: exception do begin
            log_infos('Erreur dans ENoVoteChange : ' + e.message);
            show_message('Erreur changement de numéro de vote', mtError);
         end;
      end
   end;
end;

procedure TForm1.maj_entrees;
begin
   ME_heure.Text := Aux1.scrutin_encours.heure_debut;
   ME_duree.Text := Aux1.scrutin_encours.duree;
   Efic_msg.Text := Aux1.scrutin_encours.fichier_message;
   Enb_membres.Text := inttostr(Aux1.scrutin_encours.nombre_membres);
   set_listbox(Aux1.scrutin_encours.scr_secret, Aux1.scrutin_encours.scr_secret);

end;

procedure TForm1.trf_entrees;
begin
   Aux1.scrutin_encours.heure_debut     :=  ME_heure.Text ;
   Aux1.scrutin_encours.duree           :=  ME_duree.Text ;
   Aux1.scrutin_encours.fichier_message :=  Efic_msg.Text ;
   Aux1.scrutin_encours.nombre_membres  :=  strtointdef(Enb_membres.Text, 1);
end;

procedure TForm1.clear_aff_messages;
begin
   eff_stringgrid1;
   //RrejetesClick(nil);  // nil -> change le positionnement sans lancer un nouvel affichage
   setchecked(Rrejetes); //change le positionnement sans lancer un nouvel affichage
end;


procedure TForm1.BTraitementClick(Sender: TObject);
var
   num : integer;
begin
   setchecked(Rrejetes); //change le positionnement sans lancer un nouvel affichage
   set_Efiltre_sans_aff('');

   num := strtointdef( ENoVote.Text, 0);
   if num > 0 then begin
      enable_entrees(false, false, false);
      if aux1.scrutin_encours = nil then begin
         aux1.scrutin_encours := tscrutin.create(num , Enomvote.Text);
      end;
      aux1.scrutin_encours.heure_debut := ME_heure.Text;
      aux1.scrutin_encours.duree := ME_duree.Text;
      if aux1.scrutin_encours.fichier_message = '' then begin   // pour l'instant
         aux1.scrutin_encours.fichier_message := Efic_msg.text;
      end else begin
         Efic_msg.Text := aux1.scrutin_encours.fichier_message;
      end;
      aux1.scrutin_encours.nom := Enomvote.Text;;
      aux1.scrutin_encours.nombre_membres := strtointdef(Enb_membres.Text, 1);
      aux1.scrutin_encours.set_secret( get_lb_topindex);//ListBox1.TopIndex);
      aux1.traitement;
   end else begin
      show_message( 'N° incorrect pour "Vote N°', mtError);
   end;

end;

procedure TForm1.clear_resultats;
begin
   Epour.Text       := '0'; Econtre.Text     := '0'; Eabs.Text        := '0' ; Enon_exp.Text    := '0'; //Evotants.Text    := '0';
   Ep_ppc_exp.Text  := '0'; Ec_ppc_exp.Text  := '0'; Ea_ppc_exp.Text  := '0';
   Ep_ppc_nbmb.Text := '0'; Ec_ppc_nbmb.Text := '0'; Ea_ppc_nbmb.Text := '0'; Ene_ppc_nbmb.Text := '0'; Ev_ppc_nbmb.Text := '0';
   Erjpour.Text     := '';  Erjcontre.Text   := ''; Erjabs.Text      := '';
end;

procedure TForm1.init_resultats;
begin
   Epour_       := Epour        ; Econtre_     := Econtre     ; Eabs_        := Eabs          ; Enon_exp_     :=   Enon_exp    ; Evotants_    := Evotants    ;
   Ep_ppc_exp_  := Ep_ppc_exp   ; Ec_ppc_exp_  := Ec_ppc_exp  ; Ea_ppc_exp_  := Ea_ppc_exp    ;
   Ep_ppc_nbmb_ := Ep_ppc_nbmb  ; Ec_ppc_nbmb_ := Ec_ppc_nbmb ; Ea_ppc_nbmb_ := Ea_ppc_nbmb   ; Ene_ppc_nbmb_ :=  Ene_ppc_nbmb ; Ev_ppc_nbmb_ := Ev_ppc_nbmb ;
   Erjpour_     := Erjpour      ; Erjcontre_   := Erjcontre   ; Erjabs_      := Erjabs        ;
   LNb_msg_     :=LNb_msg       ;
end;

procedure TForm1.ME_heureChange(Sender: TObject);
var
   st, nb, txtlim, ori : string;
   me : TMaskEdit;
   lim, i, j, d : integer;
begin
   me := TMaskEdit(sender);
   st := me.Text;
   ori := st;
   lim := 23;
   i := 1;
   if me = ME_duree then begin st := '00:' +st; d := -3 end else d:= 0;
   for j := 1 to 3  do begin
      nb := copy(st, i, 2);
      if strtointdef(nb, 99) > lim then begin
         txtlim := inttostr(lim);
         ori[i + d] := txtlim[1];
         ori[i + 1 + d] := txtlim[2];
         me.selectall;
         me.SetSelTextBuf(pchar(ori));
      end;
      lim := 59;
      i := i + 3;
   end;
   aux1.scrutin_encours.init_totaux;
   aux1.scrutin_encours.maj_resultats;
end;

procedure TForm1.LinformationClick(Sender: TObject);
begin
      Finformation.Showmodal;;
end;

procedure TForm1.BfcolorClick(Sender: TObject);
begin
   colorselect.Execute;
   form1.Color := colorselect.Dialog.Color;
   Mtest.Lines.Add('couleur Form1 : ' + inttostr(cardinal(form1.Color)));
   //par défaut from1.color = clBtnShadow
end;

procedure TForm1.enable_entrees(horaire, fic_mess, fic_csv: boolean);
begin
   ME_heure.Enabled := horaire;
   ME_duree.Enabled := horaire;
   ListBox1.Enabled := horaire;
   Efic_msg.Enabled := fic_mess;
   Enb_membres.Enabled := fic_mess;
   Bselectfic.Enabled := fic_mess;
   BMerge.Enabled := fic_mess;
end;

procedure TForm1.BEditerClick(Sender: TObject);
begin
   enable_entrees(true, enable_efic_msg, true);
   Aux1.scrutin_encours.init_totaux;
   aux1.scrutin_encours.maj_resultats;
end;

procedure TForm1.Enb_membresClick(Sender: TObject);
begin
   Aux1.scrutin_encours.init_totaux;
   aux1.scrutin_encours.maj_resultats;
end;


procedure TForm1.BtestClick(Sender: TObject);

begin
   //f1stringgrid.perform(WM_MBUTTONDOWN, 0, 0);
   //f1stringgrid.perform(WM_ACTIVATE, 0, 0);
   StringGrid1.row := 0;
   StringGrid1.col := 0;
   //memo_tests.Add(format('essai: %s', [booltostr(true)]));
end;

procedure TForm1.CbpouvoirsClick(Sender: TObject);
begin
   if (Cbpouvoirs.Tag = 0) then begin
      Cbpouvoirs.Tag :=1;
      Cbpouvoirs.Checked := cbpouvoirs_Checked;
      if not cbpouvoirs_Checked then Fpouv_in.ShowModal;
      Cbpouvoirs.Tag := 0;
   end;
end;

procedure TForm1.BExport_CSV_lparticpantsClick(Sender: TObject);
begin
   Aux1.Export_CSV_lparticpants;
end;

procedure TForm1.BselectficClick(Sender: TObject);
begin
   OpenDialog1.InitialDir := dir_exe;
   OpenDialog1.Filter := 'Fichiers texte (*.txt)|*.TXT';
   OpenDialog1.Title := ' Fichier des messages Zoom';
   if OpenDialog1.Execute then begin
      Efic_msg.Text := OpenDialog1.FileName;
      //if debug then begin
         aux1.scrutin_encours.fichier_message := Efic_msg.Text;;
         aux1.scrutin_encours.nombre_membres := strtointdef(Enb_membres.Text, 1);
         Aux1.charge_fic_msg(Efic_msg.Text, aux1.scrutin_encours.liste_message);
         Aux1.traite_lconfig;
      //end;
   end;
end;

procedure TForm1.CbvnreconnusClick(Sender: TObject);
begin
   if not Rvotes_multiples.Checked then
      Aux1.aff_messages(false, Cbvnreconnus.Checked, Efiltre.Text, Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
end;

procedure TForm1.Efic_msgChange(Sender: TObject);
begin
   Efic_msg.Hint := Efic_msg.Text;
end;

procedure TForm1.Beff_tmessagesClick(Sender: TObject);
begin
   aux1.clear_tmessages;
end;

procedure TForm1.RVoix_dispoClick(Sender: TObject);
begin
   if not Rvotes_multiples.Checked then begin
      setCb_enr_affchecked(false);
      Pmasque_totaux_Visible(RVoix_utilisees.Checked, false);
      Aux1.aff_messages(false, Cbvnreconnus.Checked,Efiltre.text, Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
   end;
end;

procedure TForm1.LTous_msgClick(Sender: TObject);

begin
   efiltre.text := '' ; // lancera aff_message si changement
   setchecked(Rtousmsg);
end;

procedure TForm1.LRejetesClick(Sender: TObject);
begin
   setchecked(Rrejetes);
end;

procedure TForm1.setchecked(rb: TRadioButton);
begin
   rb.Tag := tag_stop;
   rb.Checked := true;
end;

procedure TForm1.Pmasque_totaux_Visible(ok, hint_: boolean);
var
   i : integer;
begin
   Pmasque_totaux.Visible := ok;
   for i := 0 to ControlCount -1 do begin
      Controls[i].ShowHint := hint_;
   end;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
//
end;

procedure TForm1.ListBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Mtest.Lines.Add(inttostr(ListBox1.TopIndex));
  
end;

procedure TForm1.ListBox1Click(Sender: TObject);
begin
   Mtest.Lines.Add(inttostr(ListBox1.TopIndex));

end;

procedure TForm1.Button1Click(Sender: TObject);
var
   i : integer;
begin
   if Mtest.Lines.Count > 0 then begin
      i := strtointdef(Mtest.Lines[Mtest.Lines.Count -1], -1);
      if i in [0, 1, 2] then ListBox1.TopIndex := i;
   end;
end;

procedure TForm1.EtestsChange(Sender: TObject);
var
   i : integer;
begin
   if ListBox1.Enabled then begin
      i := strtointdef(etests.Text, -1);
      if i in [0, 1, 2] then ListBox1.TopIndex := i;
   end;
end;

procedure TForm1.BMergeClick(Sender: TObject);
begin
   fmerge.edit_fic := Efic_msg;
   Fmerge.ShowModal;
end;

procedure TForm1.cb_votes_limClick(Sender: TObject);
begin
   votants_limites := cb_votes_lim.Checked;
   if cb_votes_lim.Tag = 0 then cb_votes_lim.Tag := integer(cb_votes_lim.Color);
   if cb_votes_lim.Checked then cb_votes_lim.Color := clred else cb_votes_lim.Color := tcolor(cb_votes_lim.Tag);
end;

procedure TForm1.Benregistremt_stringgridClick(Sender: TObject);
const
   s = ';';
var
   i, j : integer;
   sl : TStringList;
   st : string;
   fs : TFormatSettings;
begin
   sl := TStringList.Create;
   st := 'message|pouvoirs|pour|contre|abs|non expr|ID|nom|prénom|N°|région|suffrage|pouvoirs|nombre|choix';
   st := StringReplace(st, '|', s, [rfReplaceAll]);
   sl.Add(st);
   for i := 0 to nb_msg_affiches -  1 do begin
      st := '';
      for j := 0 to StringGrid1.ColCount - 2 do begin
         st := st + StringGrid1.Cells[j, i] + s;
      end;
      st := st + StringGrid1.Cells[StringGrid1.ColCount - 1, i];
      sl.Add(StringReplace(st, '"', '°', [rfReplaceAll]));
   end;
   st := 'rejetés: ' + booltostr(Rrejetes.Checked , true) + '| non reconnus: ' + booltostr(Cbvnreconnus.Checked , true) + '| voix utilisées : ' + booltostr(RVoix_utilisees.Checked , true) + '| filtre = ' + Efiltre.Text;
   sl.Add(st);
   for j := 0 to StringGrid1.ColCount - 2 do begin
      st := st + s;
   end;
   st := format( '%s rejetés pour | %s rejetés contre | %s rejetés abs', [erjpour.Text, Erjcontre.Text, Erjabs.Text]);
   sl.Add(st);

   GetLocaleFormatSettings(SysLocale.DefaultLCID, fs);
   fs.DateSeparator := '_';
   fs.TimeSeparator := '_';
   fs.ShortDateFormat := 'dd/mm/yy';
   fs.ShortTimeFormat := 'hh:mm:ss';
   st := DateTimeToStr(Now, fs) ;  //'12_04_21 12_15_15'
   st[9] := '_';
   st :=  'stringgrid_ana_votes_' + st + '.csv' ;
   try
      sl.SaveToFile(dir_trv + st);
   except
      on E : exception do memo_tests.add('Erreur d''enregistrement de lparticipants: ' + E.message);
   end;
   sl.Free;
end;

procedure TForm1.Cb_enr_affClick(Sender: TObject);
begin
   if Cb_enr_aff.tag =0  then begin
      if  Cb_enr_aff.Checked then begin
          if (nb_msg_affiches > 0) then begin
              Benregistremt_stringgridClick(sender) ;
          end else begin
              setCb_enr_affchecked(false);
          end;
      end else setCb_enr_affchecked( nb_msg_affiches > 0);
   end;
end;


procedure TForm1.enregistrement_mergeClick(Sender: TObject);
begin
   enr_merge :=  enregistrement_merge.Checked ;
end;

procedure TForm1.CbanalysevisibleClick(Sender: TObject);
begin
   PRejets.Visible := Cbanalysevisible.checked;
end;

procedure TForm1.set_listbox(scr_secret, secret_only : boolean);
begin
   if scr_secret then begin
      if secret_only then ListBox1.TopIndex := lb_secret_s else ListBox1.TopIndex := lb_secret_t  ;
      Cbanalysevisible.Checked := false;
   end else ListBox1.TopIndex := lb_n_secret;
end;

function TForm1.get_lb_topindex: integer;
begin
   result := ListBox1.TopIndex;
   if result <> lb_n_secret then begin
      Cbanalysevisible.Checked := false;
   end else begin
      Rrejetes.Enabled := true; // inutile (bouton bvotes_ultiples invisible  fonction inactivée
      Rtousmsg.Enabled := true;
   end;
end;



end.

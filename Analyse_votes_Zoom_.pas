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
  informations, StdActns;

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
    StaticText1: TStaticText;
    Label3: TLabel;
    BEditer: TButton;
    Erjpour: TEdit;
    Erjcontre: TEdit;
    Erjabs: TEdit;
    Ltotaux: TLabel;
    CheckBox1: TCheckBox;
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
    procedure maj_entrees;
    procedure trf_entrees;
    procedure clear_aff_messages;
    procedure traite_params;
    procedure eff_stringgrid1;
    procedure test_presentation(n : integer);
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
    procedure LTous_msgMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EfiltreChange(Sender: TObject);
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
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    mx, my : integer ;
    en_deplacement: boolean;
    colorselect : tcolorselect;
    modif_sans_action : boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
    Clipbrd ;


procedure TForm1.FormCreate(Sender: TObject);
var
   i, l : integer;
begin
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
   modif_sans_action := false;
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
   RtousmsgClick(nil); // nil -> aff_messages non lancé
   Ltous_mess.caption := 'Messages "' + lettre + '"';
   modif_sans_action := true;
   Efiltre.Text := lettre;
   modif_sans_action := false;
   Aux1.aff_messages(false, Cbvnreconnus.Checked, lettre, Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
   //casse sans importance pour filtre

   {Erjpour.Text := '';
   Erjcontre.Text := '';
   Erjlabs.Text := ''; }
   //aux1.aff_lvote(StringGrid1, Rrejetes.Checked, Cbvnreconnus.Checked, Efiltre.Text) ;
end;


procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Aux1.Free;
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
      Pdebug.Left := Pdebug.Left + dx;
      pdebug.Top := Pdebug.Top + dy;
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
      Pdebug.Left := Pdebug.Left + dx;
      pdebug.Top := Pdebug.Top + dy;
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

procedure TForm1.traite_params;
var
   i : Integer;
begin
   debug := false;
   for i := 1 to ParamCount do begin
      if paramstr(i) = 'debug' then begin debug := true ; Pdebug.Visible := true; end;

   end;
   fi_debug := debug
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
   Rtousmsg.Checked := true;
   Pmasque_totaux.Visible := false;
   Ptous_msg.Visible := true;
   LTous_mess.Caption := 'Messages';
   if sender <> nil then begin
      Aux1.aff_messages(false, Cbvnreconnus.Checked, '', Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  );
      Efiltre.Text := '';
   end;   
end;

procedure TForm1.RrejetesClick(Sender: TObject);
begin
   Rrejetes.Checked := true;
   Pmasque_totaux.Visible := true;
   Ptous_msg.Visible := false;
   //Lmessages. := 'Messages rejetés';
   if sender <> nil then Aux1.aff_messages(true, Cbvnreconnus.Checked, '', Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
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

procedure TForm1.LTous_msgMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//
end;

procedure TForm1.EfiltreChange(Sender: TObject);
begin
   if not modif_sans_action then begin
      RtousmsgClick(nil); // nil -> aff_messages non lancé
      Ltous_mess.caption := 'Messages "' + Efiltre.text + '"';
      Aux1.aff_messages(false, Cbvnreconnus.Checked,Efiltre.text, Aux1.scrutin_encours.liste_message, Aux1.scrutin_encours.liste_votes  )
      //casse sans importance pour filtre
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
               Aux1.scrutin_encours := tscrutin(aux1.lscrutin.Objects[i]);
               Enomvote.text := Aux1.scrutin_encours.nom ;
               maj_entrees;
               Aux1.scrutin_encours.maj_resultats;
               if Aux1.scrutin_encours.ttl_exp > 0 then enable_entrees(false, false, false);
            end;
         end else begin
            Aux1.scrutin_encours := tscrutin.create(num, Enomvote.Text);
            trf_entrees;
            clear_resultats;
            enable_entrees(true, false, false);
         end;
         clear_aff_messages;
      except
         On E: exception do begin
            log_infos('Erreur dans ENoVoteChange : ' + e.message);
            showmessage('Erreur changement de numéro de vote');
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
   RrejetesClick(nil);  // nil -> change le positionnement sans lancer un nouvel affichage
end;


procedure TForm1.BTraitementClick(Sender: TObject);
var
   num : integer;
begin
   RrejetesClick(nil); // nil -> change le positionnement sans lancer un nouvel affichage
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
      aux1.scrutin_encours.nombre_membres := strtointdef(Enb_membres.Text, 0);
      aux1.traitement;
   end else begin
      showmessage( 'N° incorrect pour "Vote N°');
   end;
   
end;

procedure TForm1.clear_resultats;
begin
   Epour.Text       := '0'; Econtre.Text     := '0'; Eabs.Text        := '0' ; Enon_exp.Text    := '0'; Evotants.Text    := '0';
   Ep_ppc_exp.Text  := '0'; Ec_ppc_exp.Text  := '0'; Ea_ppc_exp.Text  := '0';
   Ep_ppc_nbmb.Text := '0'; Ec_ppc_nbmb.Text := '0'; Ea_ppc_nbmb.Text := '0'; Ene_ppc_nbmb.Text := '0'; Ev_ppc_nbmb.Text := '0';
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
   ME_duree.Enabled := horaires;
   Efic_msg.Enabled := fic_mess;
   Enb_membres.Enabled := fic_mess;
end;

procedure TForm1.BEditerClick(Sender: TObject);
begin
   enable_entrees(true, true, true);
end;

procedure TForm1.Enb_membresClick(Sender: TObject);
begin
   Aux1.scrutin_encours.init_totaux;
   aux1.scrutin_encours.maj_resultats;
end;



end.

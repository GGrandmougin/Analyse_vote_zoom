unit Analyse_votes_Zoom_;

//Un clic sur le bouton "Editer" fait disparaitre un composant transparent(label vide ?) au-dessus e la zone "Entrée" et remet à zéro les résultats

{$DEFINE Mensa } //aide: compilation conditionnelle

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Grids, Auxiliaire, math;

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
    Edit1: TEdit;
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
    Edit3: TEdit;
    Edit4: TEdit;
    Panel1: TPanel;
    Label12: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Panel4: TPanel;
    Label15: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Panel5: TPanel;
    Label16: TLabel;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Panel6: TPanel;
    Label17: TLabel;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Panel2: TPanel;
    Label13: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label14: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Edit11: TEdit;
    Image1: TImage;
    StaticText1: TStaticText;
    Label3: TLabel;
    BEditer: TButton;
    Ettlpour: TEdit;
    Ettlcontre: TEdit;
    Ettlabs: TEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
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
    Edit24: TEdit;
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
    Baff_msg: TButton;
    Benr_lmsg: TButton;
    Bcree_lvote: TButton;
    BAff_lvote: TButton;
    BAff_lparticipants: TButton;
    Label5: TLabel;
    procedure traite_params;
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
    procedure Baff_msgClick(Sender: TObject);
    procedure Benr_lmsgClick(Sender: TObject);
    procedure Bcree_lvoteClick(Sender: TObject);
    procedure BAff_lvoteClick(Sender: TObject);
    procedure BAff_lparticipantsClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    mx, my : integer ;
    en_deplacement: boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
var
   i, l : integer;
begin
   aux1 := taux.create;
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
end;

procedure TForm1.test_presentation(n : integer);
var
   i : integer;
   ok : boolean;
   fic_strgrd : string;
begin
   fic_strgrd :=  ExtractFilePath(paramstr(0)) + 'msg_rejetes\' + '\' + inttostr(n) + '\' + 'rejets_row';
   ok :=  fileexists(fic_strgrd + '0.txt');
   if ok then begin
      StringGrid1.RowCount := 20;
      for i := 0 to StringGrid1.RowCount -1 do begin
         StringGrid1.Rows[i].LoadFromFile(fic_strgrd + inttostr(i) + '.txt');
      end;
   end else begin
      {for i := 0 to StringGrid1.RowCount -1 do begin
         StringGrid1.Cells[i, StringGrid1.ColCount - 1 ] := '*' ;
      end; }
   end;
end;

procedure TForm1.LAnalyseClick(Sender: TObject);
var
   i : integer;
begin
   for i := 0 to StringGrid1.RowCount -1 do begin
      //StringGrid1.Rows[i].SaveToFile(fic_strgrd + inttostr(i) + '.txt');
   end;
end;

procedure TForm1.ButtonAClick(Sender: TObject);
var
   lettre : string;

begin
   lettre := tbutton(sender).Caption;
   Lmessages.caption := 'Messages "' + lettre + '"';
   Ettlpour.Text := '';
   Ettlcontre.Text := '';
   Ettlabs.Text := '';
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
   aux1.charge_fic_msg(Efic_msg.Text);
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
procedure TForm1.Baff_msgClick(Sender: TObject);
begin
   StringGrid1.cols[0].Assign(aux1.lmessages); // lorsque StringGrid1.rowscount étéil = à 20 et lmessages.count était = à 121, cela n'a pa pasréé d'erreue, seules les 20 premièrsmessage étaient affichés
end;

procedure TForm1.Benr_lmsgClick(Sender: TObject);
begin
   Aux1.lmessages.SaveToFile(dir_trv + 'lmessages.txt');
end;

procedure TForm1.Bcree_lvoteClick(Sender: TObject);
begin
   Aux1.select_lvotes(ME_heure.Text, ME_duree.Text, true, false);
end;

procedure TForm1.BAff_lvoteClick(Sender: TObject);
begin
   StringGrid1.cols[0].Assign(aux1.lvotes);
end;

procedure TForm1.BAff_lparticipantsClick(Sender: TObject);
begin
   StringGrid1.cols[0].Assign(aux1.lparticipants);
end;

end.

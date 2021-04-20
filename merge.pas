unit merge;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, commun;

type
  TFmerge = class(TForm)
    Efic_local: TEdit;
    Lfic_local: TLabel;
    Bselectfic_local: TButton;
    Efic_scnd_pc: TEdit;
    Lfic_scnd_pc: TLabel;
    Bselectfic_scnd_pc: TButton;
    OpenDialog1: TOpenDialog;
    lmergeOK: TLabel;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bselectfic_scnd_pcClick(Sender: TObject);
    procedure Bselectfic_localClick(Sender: TObject);
    procedure Efic_localChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
     edit_fic : tedit;

  end;
  
function  merge_fichiers(l_mess : TStringList) : tstringlist;

var
  Fmerge: TFmerge;

implementation

{$R *.dfm}

procedure TFmerge.FormShow(Sender: TObject);
begin
   Efic_local.Text := edit_fic.Text;
end;

procedure TFmerge.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   edit_fic.Text := Efic_local.Text;
   bmerge := (Efic_scnd_pc.Text <> Efic_local.Text) and FileExists(Efic_local.Text) and FileExists(Efic_scnd_pc.Text);
   if bmerge then fichier_msg_scnd_PC := Efic_scnd_pc.Text;
end;

procedure TFmerge.Bselectfic_scnd_pcClick(Sender: TObject);
begin
   OpenDialog1.InitialDir := dir_exe;
   OpenDialog1.Filter := 'Fichiers texte (*.txt)|*.TXT';
   OpenDialog1.Title := ' Fichier des messages Zoom du second PC';
   if OpenDialog1.Execute then begin
      if OpenDialog1.FileName <> Efic_local.Text then
         Efic_scnd_pc.Text := OpenDialog1.FileName;
   end;
end;

procedure TFmerge.Bselectfic_localClick(Sender: TObject);
begin
   OpenDialog1.InitialDir := dir_exe;
   OpenDialog1.Filter := 'Fichiers texte (*.txt)|*.TXT';
   OpenDialog1.Title := ' Fichier des messages Zoom du PC local';
   if OpenDialog1.Execute then begin
      if OpenDialog1.FileName <> Efic_scnd_pc.Text then
         Efic_local.Text := OpenDialog1.FileName;
   end;
end;

procedure TFmerge.Efic_localChange(Sender: TObject);
begin
   bmerge := (Efic_scnd_pc.Text <> Efic_local.Text) and FileExists(Efic_local.Text) and FileExists(Efic_scnd_pc.Text);
   if bmerge then lmergeOK.visible := true;
end;



function merge_fichiers(l_mess: TStringList): tstringlist;
begin
//
end;

procedure TFmerge.FormCreate(Sender: TObject);
begin
   a_merge_fichier := merge_fichiers;
end;

end.

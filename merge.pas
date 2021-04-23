unit merge;

interface

uses
  Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, commun, ExtCtrls, math;

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
    Pdebug: TPanel;
    Icroix: TImage;
    Mtest: TMemo;
    Pifl_ext: TPanel;
    Ifl_ext: TImage;
    Btest_merge: TButton;
    Eheure: TEdit;
    Bmemo2fics: TButton;
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
    function merge_fichiers(l_mess, l_cfg : tstringlist; memotst : tstrings; hfin : TDateTime) : boolean;
    function merge_details(sl1, sl2, slrslt : tstringlist) : boolean;
    procedure Bselectfic_scnd_pcClick(Sender: TObject);
    procedure Bselectfic_localClick(Sender: TObject);
    procedure Efic_localChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Btest_mergeClick(Sender: TObject);
    procedure Bmemo2ficsClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
     edit_fic : tedit;
     mx, my : integer ;
     en_deplacement : boolean;
     sl_local, sl_2pc, slcfg_l, slcfg_2 : tstringlist;
  end;
  


var
  Fmerge: TFmerge;

implementation

{$R *.dfm}
procedure TFmerge.place_ifl_ext;
begin
   pIfl_ext.Left := Pdebug.Width - 30;
   pIfl_ext.Top := Pdebug.Height - 30;
end;

procedure TFmerge.IcroixMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   mx := x ;
   my := y ;
   en_deplacement := false;
end;

procedure TFmerge.IcroixMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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

procedure TFmerge.IcroixMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFmerge.Ifl_extMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   mx := x  ;
   my := y ;
   en_deplacement := false;
end;

procedure TFmerge.Ifl_extMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
   dx , dy : integer;
begin
   if (ssLeft in Shift) and  not en_deplacement then begin
      en_deplacement := true;
      dx := x  - mx;
      dy := y  - my;
      Pdebug.Width := max(Pdebug.Width + dx, 40);
      pdebug.Height := max(Pdebug.Height + dy, 40);
      if Pdebug.Width >= 200 then Mtest.Width := Pdebug.Width - Mtest.Left - 3;
      if Pdebug.Height >= 100 then Mtest.Height := Pdebug.Height - Mtest.top - 3;
      place_ifl_ext;
      //tcontrol(Ifl_ext).SetZOrder(true);
      Application.ProcessMessages;
      en_deplacement := false;
   end;
end;

procedure TFmerge.Ifl_extMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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

procedure TFmerge.FormShow(Sender: TObject);
begin
   Efic_local.Text := edit_fic.Text;
   Pdebug.Visible := debug;
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

procedure TFmerge.FormCreate(Sender: TObject);
begin
   //a_merge_fichier := merge_fichiers;
   sl_local := tstringlist.Create;
   sl_2pc := tstringlist.Create;
   slcfg_l := tstringlist.Create;
   slcfg_2 := tstringlist.Create;
end;

procedure TFmerge.FormDestroy(Sender: TObject);
begin
   sl_local.Free;
   sl_2pc.Free;
   slcfg_l.Free;
   slcfg_2.Free;
end;

function TFmerge.merge_fichiers(l_mess, l_cfg: tstringlist; memotst : tstrings; hfin : TDateTime): boolean;
begin
   result := false;// FileDateToDateTime(FileAge(Efic_local.Text))
   if (frac(FileDateToDateTime(FileAge(Efic_local.Text))) < hfin) or (frac(FileDateToDateTime(FileAge(Efic_scnd_pc.Text))) < hfin) then show_message('L''heure d''un ou deux fichiers' + #13#10 + 'de message est inférieure' + #13#10 + 'à celle de la fin de la plage horaire', mtWarning);
   try
      sl_local.loadfromfile(Efic_local.Text);
      result := sl_local.Count > 0;
      if debug then Mtest.Lines.Add('fichier local chargé: ' + inttostr(sl_local.Count) + ' lignes');
   except
      on E: Exception do log_infos('ERREUR: ' + E.Message + ' pour le fichier: ' + Efic_local.Text); // log_infos dupplique l message dans memo_tests
   end;
   try
      sl_2pc.loadfromfile(Efic_scnd_pc.Text);
      result := result and (sl_2pc.Count > 0);
      if debug then Mtest.Lines.Add('fichier 2eme PC chargé: ' + inttostr(sl_2pc.Count) + ' lignes');
   except
      on E: Exception do log_infos('ERREUR: ' + E.Message + ' pour le fichier: ' + Efic_scnd_pc.Text); // log_infos dupplique l message dans memo_tests
   end;
   if result then begin
      depart_trtmnt := GetTickCount;
      pretraitement_lmsg(sl_local, slcfg_l, memotst);
      pretraitement_lmsg(sl_2pc, slcfg_2,  memotst);
      merge_details(sl_local, sl_2pc, l_mess ) ;
      merge_details(slcfg_l, slcfg_2, l_cfg) ;
   end;
   //if debug then l_cfg.Text := slcfg_l.Text;
   //if debug then l_mess.Text := sl_local.Text;

end;

function TFmerge.merge_details(sl1, sl2, slrslt : tstringlist) : boolean;
var
   i, j, a , b : integer;
begin
   i := 0;
   j := 0;
   result := true;
   while (i < sl1.Count) and (j < sl2.Count) do begin
       if sl1.Strings[i] = '' then begin
          inc(i);
       end else if sl2.Strings[j] = '' then begin
          inc(j);
       end else if sl1.Strings[i] = sl2.Strings[j] then begin
          slrslt.Add(sl1.Strings[i]);
          inc(i);
          inc(j);
       end else if sl1.Strings[i] < sl2.Strings[j] then begin
          slrslt.Add(sl1.Strings[i]);
          inc(i);
       end else begin // sl1.Strings[i] > sl2.Strings[j
          slrslt.Add(sl2.Strings[j]);
          inc(j);
       end;
   end;
   if i < sl1.Count then begin
      a := i;
      for i := a to sl1.Count do slrslt.Add(sl1.Strings[i]);
   end;
   if j < sl2.Count  then begin
      b := j;
      for j := b to sl2.Count do slrslt.Add(sl2.Strings[j]);
   end;
end;
{      if fileexists(fic) then begin
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
            enable_efic_msg := false;
            pretraitement_lmsg(lmfic, memo_tests);
            if debug then memo_tests.Add('fichier messages chargé, nb lignes: ' + inttostr(lmessages.Count));
         end else begin
            if debug then memo_tests.Add('erreur chargement fichier');
            log_infos('problème au fichier des messages: ' + fic );
         end;
      end;}



procedure TFmerge.Btest_mergeClick(Sender: TObject);
var
   sl, slcfg : tstringlist;
   hfin : TDateTime;
begin
   sl := tstringlist.Create;
   slcfg := tstringlist.Create;
   hfin := 1;
   try
      hfin := strtotime(Eheure.Text  ) ;
   except
      show_message('erreur entrée heure' , mterror);
   end;
   if FileExists(Efic_local.Text) and FileExists(Efic_scnd_pc.Text) then begin
      merge_fichiers(sl, slcfg, Mtest.Lines, hfin);

      try
         sl.SaveToFile(dir_trv + 'merge.txt');
      except

      end;
   end else Mtest.Lines.Add('il manque des fichiers');
   Mtest.Lines.AddStrings(slcfg);
   sl.Free;
   slcfg.free; //strtotime(
end;

procedure TFmerge.Bmemo2ficsClick(Sender: TObject);
begin
   if Mtest.Lines.Count >= 2 then begin
      Efic_local.Text := Mtest.Lines[0];
      Efic_scnd_pc.Text := Mtest.Lines[1];
   end;
end;

end.

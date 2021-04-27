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
    procedure test_meme_codage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Btest_mergeClick(Sender: TObject);
    procedure Bmemo2ficsClick(Sender: TObject);
    function egalite(var st1, st2 : string) : boolean;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
     edit_fic : tedit;
     mx, my : integer ;
     en_deplacement : boolean;
     sl_local, sl_2pc, slcfg_l, slcfg_2 : tstringlist;
     offset : integer;
     b_offst : boolean ;
  end;
  


var
  Fmerge: TFmerge;
  offset : integer = 0;
  b_offst : boolean = false;
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
      if OpenDialog1.FileName <> Efic_local.Text then begin
         Efic_scnd_pc.Text := OpenDialog1.FileName;
         test_meme_codage;
      end;
   end;
end;

procedure TFmerge.Bselectfic_localClick(Sender: TObject);
begin
   OpenDialog1.InitialDir := dir_exe;
   OpenDialog1.Filter := 'Fichiers texte (*.txt)|*.TXT';
   OpenDialog1.Title := ' Fichier des messages Zoom du PC local';
   if OpenDialog1.Execute then begin
      if OpenDialog1.FileName <> Efic_scnd_pc.Text then begin
         Efic_local.Text := OpenDialog1.FileName;
         test_meme_codage;
      end;
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
   offset := 0;
   b_offst := false;
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
   st1, st2 : string;
begin
   i := 0;
   j := 0;
   result := true;
   while (i < sl1.Count) and (j < sl2.Count) do begin
       st1 := sl1.Strings[i];
       st2 := sl2.Strings[j];
       if length(st1) < 8 then begin
          inc(i);
       end else if length(st2) < 8  then begin
          inc(j);
       end else begin
          if egalite(st1, st2) then begin
             slrslt.Add(st1);
             inc(i);
             inc(j);
          end else if st1 < st2 then begin
             slrslt.Add(st1);
             inc(i);
          end else begin // sl1.Strings[i] > sl2.Strings[j
             slrslt.Add(st2);
             inc(j);
          end;
       end;
   end;
   if i < sl1.Count then begin
      a := i;
      for i := a to sl1.Count - 1 do slrslt.Add(sl1.Strings[i]);
   end;
   if j < sl2.Count  then begin
      b := j;
      for j := b to sl2.Count - 1 do slrslt.Add(sl2.Strings[j]);
   end;
end;

function TFmerge.egalite(var  st1,  st2 : string) : boolean;
var
   s1, s2 : string;
   h1, h2 : integer;
   str_egal : boolean;
function str2dt(st : string): integer;
begin
   if length(st) >= 8 then
      result := strtointdef(copy(st, 7, 2), 0 ) + 60 *( strtointdef(copy(st, 4, 2), 0 ) + 60 *(strtointdef(copy(st, 1, 2), 0 )))
   else
      result := 0;
end;
function dt2str(dt : integer): string;
var
   h, m, s : integer;
begin
   s := dt mod 60;
   m := dt div 60;
   h := m div 60;
   m := m mod 60;
   result := format('%d:%d:%d', [h, m, s]);
end;
begin
   h2 := -1;
   if b_offst and (offset <> 0) then begin
      //h1 := str2dt(st1);
      h2 := str2dt(st2) + offset;
      st2 := dt2str(h2 );
   end ;
   result := st1 = st2 ;
   if  result then begin
      if not b_offst then begin
          b_offst := true;
          offset := 0;
      end;
   end else begin
      if copy(st1, 9, length(st1)) = copy(st2, 9, length(st2)) then begin
         h1 := str2dt(st1);
         if h2 = -1 then h2 := str2dt(st2);
         if b_offst then begin
            result := abs(h1 - h2 ) < 5;  // il peut y avoir une erreur de presque 1 sur l'offset , une erreur de presque 1 sur h1 , une erreur de presque 1 sur h1, une erreur due au resau internet de presque 1 (au pif)
         end else if abs(h1 - h2 ) < 60 then begin
            result := true;
            b_offst := true;
            offset := h1 - h2;
            st2 := dt2str(  h2 + offset);
         end;
      end;
   end

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

procedure TFmerge.test_meme_codage;
var
   tfl, tf2 : textfile;
   sl, s2 : string;
   p, q, r ,s : integer;
begin
   if fileexists(Efic_local.text) and FileExists(Efic_scnd_pc.text) then begin
      try
         assignfile(tfl,Efic_local.text);
         Reset(tfl);
         Readln(tfl, sl);
         closefile(tfl);
      except
         //pour ne pas ajouter l'erreur à l'erreur
      end;
      try
         assignfile(tf2,Efic_scnd_pc.text);
         Reset(tf2);
         Readln(tf2, s2);
         closefile(tf2);
      except
         //pour ne pas ajouter l'erreur à l'erreur
      end;
      q := 0;
      s := 0;
      p := pos( 'Ã   Tout le monde:', sl ) ;
      if p=0 then q := pos( 'à  Tout le monde:', sl ) ;
      r := pos( 'Ã   Tout le monde:', s2 ) ;
      if r=0 then s := pos( 'à  Tout le monde:', s2 ) ;
      if ( (p > 0) and ( s > 0)) or ( (q > 0) and ( r > 0)) then show_message('Un fichier sur 2 en codage UTF-8)', mtError);


      {if (length(sl) > 3) and (length(s2) > 3) then begin
         if (copy(sl , 1 , 3) = #$EF#$BB#$BF ) <> (copy(s2 , 1 , 3) = #$EF#$BB#$BF ) then show_message('Un fichier sur 2 en codage UTF-8)', mtError);
      end; }
   end;  // '12:11:17 De  GÃ©rard Grandmougin  Ã   Tout le monde:'  '17:52:15 De  Gérard Grandmougin  à  Tout le monde:'
end; // 'E:\GitHub\Analyse_vote_zoom\cas_tests\6\meeting_saved_chat_260421_hp.txt' '17:52:15 De  Gérard Grandmougin  à  Tout le monde:'
     // 'E:\GitHub\Analyse_vote_zoom\cas_tests\6\meeting_saved_chat_270421_hp.txt' '14:48:24 De  VOTE SECRET  Ã   Tout le monde:'


end.

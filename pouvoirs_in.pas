unit pouvoirs_in;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, StdCtrls, ExtCtrls, math, commun, Mask;

const
   tag_encours = -3;

type
  TFpouv_in = class(TForm)
    IdFTP1: TIdFTP;
    IdHTTP1: TIdHTTP;
    Pdebug: TPanel;
    Icroix: TImage;
    Pifl_ext: TPanel;
    Ifl_ext: TImage;
    Mtest: TMemo;
    Pftp: TPanel;
    Cbftp: TCheckBox;
    Pweb: TPanel;
    Cbweb: TCheckBox;
    Plocal: TPanel;
    Cblocal: TCheckBox;
    Ech_local: TEdit;
    Ech_web: TEdit;
    Ech_ftp: TEdit;
    Eftp_id: TEdit;
    Eftp_pw: TEdit;
    Button1: TButton;
    Mrecu: TMemo;
    Lconnected: TLabel;
    Blist: TButton;
    Bconnect: TButton;
    Bdeconnexion: TButton;
    Bget: TButton;
    Eget: TEdit;
    Cbdetails: TCheckBox;
    Cb_relatif: TCheckBox;
    Pftp_dbg: TPanel;
    LServeur: TLabel;
    Lidentifiant: TLabel;
    LMot_de_passe: TLabel;
    LNom_du_fichier: TLabel;
    Button2: TButton;
    cbaucunpouvoirs: TCheckBox;
    Pimporter: TPanel;
    Limporter: TLabel;
    procedure place_ifl_ext;
    procedure recois_http;
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
    procedure CbftpClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure IdHTTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure IdFTP1Connected(Sender: TObject);
    procedure IdFTP1Disconnected(Sender: TObject);
    procedure BlistClick(Sender: TObject);
    procedure BconnectClick(Sender: TObject);
    function ftp_connexion : boolean ;
    procedure BgetClick(Sender: TObject);
    procedure BdeconnexionClick(Sender: TObject);
    procedure IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure IdFTP1AfterGet(ASender: TObject; VStream: TStream);
    procedure charge_fichier;
    procedure convertit_UTF8_accents;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PimporterClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
   mx, my : integer ;
   en_deplacement : boolean;
   memo1 : tmemo;
   exedir, dirfic : string;
   strl : tstringlist;
   strm : TMemoryStream;
  end;

var
  Fpouv_in: TFpouv_in;
  fp_debug : boolean;
  dirfic : string = 'essais\';
implementation

{$R *.dfm}

procedure TFpouv_in.place_ifl_ext;
begin
   pIfl_ext.Left := Pdebug.Width - 30;
   pIfl_ext.Top := Pdebug.Height - 30;
end;

procedure TFpouv_in.IcroixMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   mx := x ;
   my := y ;
   en_deplacement := false;
end;

procedure TFpouv_in.IcroixMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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

procedure TFpouv_in.IcroixMouseUp(Sender: TObject; Button: TMouseButton;
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

procedure TFpouv_in.Ifl_extMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   mx := x  ;
   my := y ;
   en_deplacement := false;
end;

procedure TFpouv_in.Ifl_extMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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

procedure TFpouv_in.Ifl_extMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
procedure TFpouv_in.FormCreate(Sender: TObject);
begin
   memo1 := mtest;
   strl := tstringlist.create;
   strm := TMemoryStream.Create;
   LImporter.Caption := 'Importer le fichier' + #13#10 + '   des pouvoirs';
end;

procedure TFpouv_in.FormShow(Sender: TObject);
begin
   Pdebug.Visible := fp_debug;
   exedir := ExtractFilePath(paramstr(0));
   ForceDirectories(exedir + dirfic) ;
   Pftp_dbg.Visible := fp_debug;

end;

procedure TFpouv_in.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if LConnected.Visible then IdFTP1.Disconnect;
   if cbaucunpouvoirs.Checked then begin  // on a décidé qu'il n'y aura pas de pouvoirs transférés
      cb_pouv_val.Checked := true;
      cbpouvoirs_Checked := true;
   end;
end;

procedure TFpouv_in.FormDestroy(Sender: TObject);
begin
   strl.Free;
   strm.Free;
end;

procedure TFpouv_in.CbftpClick(Sender: TObject);
begin
   if Cbftp.tag <> tag_encours then begin
      Cbftp.tag := tag_encours;
      Cbftp.Checked := false;
      Cbweb.Checked := false;
      cbaucunpouvoirs.Checked := false;
      Cblocal.Checked := false;
     // setCbPouvoirschecked;
      TCheckBox(sender).Checked := true;
      if sender = cbaucunpouvoirs then cbaucunpouvoirs.Color := clYellow else cbaucunpouvoirs.Color := clBtnFace;
      Cbftp.tag := 0;
   end;
end;



procedure TFpouv_in.Button1Click(Sender: TObject);
var
   fichier : string;
begin
   strl.Clear;
   if cbweb.Checked then begin
      recois_http;
   end else if Cbftp.Checked then begin
      if ftp_connexion then begin
         BgetClick(nil);
      end;
      BdeconnexionClick(nil);
      fichier := Ech_ftp.Text;
   end else if Cblocal.Checked then begin
      charge_fichier;
      fichier := Ech_local.Text;
   end;
   if strm.Size > 0 then begin
      convertit_UTF8_accents;
      if debug then Mrecu.Lines.Assign(strl);
      p_traite_pouvoirs(strl, ExtractFileName(fichier ));
   end;

end;
{  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    MaxLineAction = maException
    ReadTimeout = 0
    OnDisconnected = IdFTP1Disconnected
    Host = 'node1-fr.n0c.com'
    OnConnected = IdFTP1Connected
    Password = 'KmdrGvjFnc2gW7yn_4mJ'
    TransferType = ftASCII
    Username = 'gerard@catho-rama.go.yj.fr'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    OnAfterClientLogin = IdFTP1AfterClientLogin
    Left = 40
    Top = 24
  end
  object IdHTTP1: TIdHTTP
    OnStatus = IdHTTP1Status
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Firefox/86.0.1'
    HTTPOptions = [hoForceEncodeParams]
    Left = 272
    Top = 520
  end}

procedure TFpouv_in.IdFTP1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
   Mtest.Lines.Add( AStatusText);
end;

procedure TFpouv_in.IdHTTP1Status(ASender: TObject;
  const AStatus: TIdStatus; const AStatusText: String);
begin
   Mtest.Lines.Add( AStatusText);;
end;

procedure TFpouv_in.IdFTP1Connected(Sender: TObject);
begin
   Lconnected.Visible := true;
end;

procedure TFpouv_in.IdFTP1Disconnected(Sender: TObject);
begin
   Lconnected.Visible := false;
end;

procedure TFpouv_in.BlistClick(Sender: TObject);
var
   AFiles : TStringList  ;

begin
   AFiles := TStringList.Create;
   try
      IdFTP1.List(AFiles, '', CbDetails.Checked); //, '*.*', True);
      //IdFTP1.DirectoryListing.Items[0];
      Mtest.lines.AddStrings(Afiles);
      Mtest.lines.Add('');
   except
      showmessage('erreur list');
   end;
   afiles.Free;
end;

function TFpouv_in.ftp_connexion : boolean ;
begin
   result := false;
   IdFTP1.Host := Ech_ftp.Text;
   IdFTP1.Username := Eftp_id.Text;
   IdFTP1.Password := Eftp_pw.Text;
   try
      IdFTP1.Connect(true);
      result := true;
   except
      //showmessage('erreur de connexion') ;
      on E: Exception do log_infos('ERREUR: ' + E.Message, 0, Mtest);
   end;
end;

procedure TFpouv_in.BconnectClick(Sender: TObject);
begin
   ftp_connexion;
end;

procedure TFpouv_in.BgetClick(Sender: TObject);
begin
   if Lconnected.visible then begin
      try
          IdFTP1.Get(eget.text, strm, true ); //exedir + dirfic + eget.text, true);
          if debug then Mtest.Lines.Add(eget.text + ' reçu') ;
      except
         on E: Exception do log_infos('ERREUR: ' + E.Message, 0, Mtest);
      end;
   end;
end;


procedure TFpouv_in.BdeconnexionClick(Sender: TObject);
begin
   IdFTP1.Disconnect;
end;

procedure TFpouv_in.IdFTP1WorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
//
end;

procedure TFpouv_in.IdFTP1AfterGet(ASender: TObject; VStream: TStream);
begin
   //
end;

procedure TFpouv_in.charge_fichier;
begin
   strm.Clear;
   try
      if Cb_relatif.Checked then begin
         strm.LoadFromFile(dir_exe + Ech_local.Text);
      end else begin
         strm.LoadFromFile(Ech_local.Text);
      end;
   except
      on E: Exception do log_infos('ERREUR: ' + E.Message,0, Mtest);
   end;
   if strm.Size > 0 then Mtest.Lines.Add('fichier chargé: ' + Ech_local.Text)
end;

procedure TFpouv_in.convertit_UTF8_accents;
var
   texte : string;
   //c : char;
   i, j, lim, b  : integer;
   p : PByteArray ; //PByteArray = ^TByteArray; TByteArray = array[0..32767] of Byte;
   suivant : boolean ;
begin
   lim := -1;
   suivant := true;
   p := pointer(0); //pour éviter message du compilateur
   if debug then Mtest.Lines.Add('strm.size: ' + inttostr(strm.size));
   for i := 0 to strm.Size -1 do begin
      j := i mod 32700;   // < 32768 -> p peut adresser des bytes à une osition supérieure à celle en cours
      if j = 0 then p := pointer(longint(cardinal(strm.Memory)) + i );
      if i > lim then begin  // permet de sauter des caractères
         b := p^[j];
         if (b >= 65) and ( b <= 90) then begin
            texte := texte + chr(b + 32);  // remplacement des mauscules par des minuscules
         end else if (b = $C3) and suivant then begin  // UTF-8
            p^[j + 1] := remplAcc[p^[j + 1] - $80] ;
            suivant := false;  // empêche pb ds cas du caractère $C3
         end else if (b = $E2)  and (p^[j +1 ] = $80) and (p^[j +2 ] = $99 ) then begin
            texte := texte + '''';
            lim := i + 2;
         end else if b = 34 then begin
            //on saute le caractère: "  (34)   
         end else begin
            texte := texte + chr(b) ;
            suivant := true;
         end;
      end;
   end;
   strl.Text := texte;
   //if debug then begin Mtest.Lines.Add('length(texte): ' + inttostr(length(texte))); strl.SaveToFile(dir_exe + 'tests\tests.txt');  end;   
end;
// A 65   Z 90      a 97     z 122
{function Taux.remplace_caracteres_UTF8( texte : string) : string ; // https://www.charset.org/utf-8  (https://graphemica.com/%F0%9F%92%BB)
var
  st : string;
  p : integer;
begin
   st := texte ;
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
procedure TForm1.Brecept_httpClick(Sender: TObject);
var
   strm : tmemorystream;
   i : integer;
   txt : string;
   p : tpbuf;
begin     //http://catho-rama.net/dessins/xyz.csv
//Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0; MAAU)
// 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0'
// d'origine : Mozilla/3.0 (compatible; Indy Library)
   //IdHttp1.Request.UserAgent := 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';

//add Request.Username and supply the correct mysql username
//idHttp1.Request.Username := 'username';

//do the same for the password
//idHttp1.Request.Password := 'password';

//then add a UserAgent property with the string below
//idHttp1.Request.UserAgent :=  'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
idHttp1.Request.UserAgent :=  'Firefox/86.0.1';




   strm := TMemoryStream.Create;
   try
      IdHTTP1.Get(E_URL.text, strm);
      // while size > 10000 do begin;
      for i := 0 to strm.Size - 1 do begin
         p := strm.Memory ;
         txt := txt + p^[i];
      end;
      strl.Clear;
      strl.Text := txt;
      Memo1.Lines.AddStrings(strl);
   except
      on E: Exception do Memo1.Lines.add('ERREUR: ' + E.Message);
   end;
   strm.Free;
}

procedure TFpouv_in.recois_http;
begin
   showmessage('Le mode WEB n''est pas encore fonctionnel');
   {try
      IdHTTP1.Get(Ech_web.Text, strm);
   except
      on E: Exception do log_infos('ERREUR: ' + E.Message, 0, mtest);
   end; }
end;


procedure TFpouv_in.Button2Click(Sender: TObject);
begin
   procedure_test(nil)
end;

procedure TFpouv_in.PimporterClick(Sender: TObject);
var
   fichier : string;
begin
   strl.Clear;
   if cbweb.Checked then begin
      recois_http;
   end else if Cbftp.Checked then begin
      if ftp_connexion then begin
         BgetClick(nil);
      end;
      BdeconnexionClick(nil);
      fichier := Eget.Text;
      source_pouvoirs := 'FTP  serveur: ' + Ech_ftp.Text + ' ID login: ' + Eftp_id.Text ;
   end else if Cblocal.Checked then begin
      charge_fichier;
      fichier := Ech_local.Text;
      source_pouvoirs := 'Fichier local ' ;
   end;
   if strm.Size > 0 then begin
      convertit_UTF8_accents;
      if debug then Mrecu.Lines.Assign(strl);
      p_traite_pouvoirs(strl, ExtractFileName(fichier ));
      if not debug then Close;
   end else begin

   end;
end;

end.

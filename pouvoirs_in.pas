unit pouvoirs_in;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdHTTP, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdFTP, StdCtrls, ExtCtrls, math;

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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure FormDestroy(Sender: TObject);
    procedure BdeconnexionClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
   mx, my : integer ;
   en_deplacement : boolean;
   memo1 : tmemo;
   exedir, dirfic : string;
   strl : tstringlist;
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
      Pdebug.Left := Pdebug.Left + dx;
      pdebug.Top := Pdebug.Top + dy;
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
      Pdebug.Left := Pdebug.Left + dx;
      pdebug.Top := Pdebug.Top + dy;
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
end;

procedure TFpouv_in.FormShow(Sender: TObject);
begin
   Pdebug.Visible := fp_debug;
   exedir := ExtractFilePath(paramstr(0));
   ForceDirectories(exedir + dirfic) ;
   Blist.Visible := fp_debug;
   Bconnect.Visible := fp_debug;
   Bdeconnexion.Visible := fp_debug;
   Bget.Visible := fp_debug;
   Eget.Visible := fp_debug;
end;

procedure TFpouv_in.CbftpClick(Sender: TObject);
begin
   if Cbftp.tag <> tag_encours then begin
      Cbftp.tag := tag_encours;
      Cbftp.Checked := false;
      Cbweb.Checked := false;
      Cblocal.Checked := false;
      TCheckBox(sender).Checked := true;
      Cbftp.tag := 0;
   end;
end;

procedure TFpouv_in.Button1Click(Sender: TObject);
begin
   if cbweb.Checked then begin

   end else if Cbftp.Checked then begin
      if ftp_connexion then begin
         BgetClick(nil);
      end;
      BdeconnexionClick(nil);
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
      memo1.lines.AddStrings(Afiles);
      memo1.lines.Add('');
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
      on E: Exception do Memo1.Lines.add('ERREUR: ' + E.Message);
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
          IdFTP1.Get(eget.text, exedir + dirfic + eget.text, true);
          Memo1.Lines.Add(eget.text + ' reçu') ;
      except
         on E: Exception do Memo1.Lines.add('ERREUR: ' + E.Message);
      end;
   end;
end;

procedure TFpouv_in.FormDestroy(Sender: TObject);
begin
   strl.Free;
end;

procedure TFpouv_in.BdeconnexionClick(Sender: TObject);
begin
   IdFTP1.Disconnect;
end;

procedure TFpouv_in.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if LConnected.Visible then IdFTP1.Disconnect;
end;

end.

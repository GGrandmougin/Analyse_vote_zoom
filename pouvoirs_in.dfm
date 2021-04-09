object Fpouv_in: TFpouv_in
  Left = 484
  Top = 277
  Width = 1280
  Height = 768
  Caption = 'Importation des pouvoirs'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Pdebug: TPanel
    Left = 880
    Top = 72
    Width = 380
    Height = 656
    Hint = 'Affichage de lvotes'
    BorderWidth = 3
    BorderStyle = bsSingle
    TabOrder = 0
    Visible = False
    object Icroix: TImage
      Left = 0
      Top = 0
      Width = 25
      Height = 25
      Picture.Data = {
        07544269746D6170A2000000424DA2000000000000003E000000280000001900
        0000190000000100010000000000640000000000000000000000020000000000
        000000000000FFFFFF000000000000080000001C0000002A0000004900000008
        00000008000000080000000800000808080010080400200802007FFFFF002008
        020010080400080808000008000000080000000800000008000000490000002A
        0000001C00000008000000000000}
      OnMouseDown = IcroixMouseDown
      OnMouseMove = IcroixMouseMove
      OnMouseUp = IcroixMouseUp
    end
    object Mtest: TMemo
      Left = 136
      Top = 0
      Width = 241
      Height = 241
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object Pifl_ext: TPanel
      Left = 350
      Top = 626
      Width = 25
      Height = 25
      TabOrder = 0
      object Ifl_ext: TImage
        Left = 0
        Top = 0
        Width = 25
        Height = 25
        Picture.Data = {
          07544269746D6170A2000000424DA2000000000000003E000000280000001900
          0000190000000100010000000000640000000000000000000000020000000000
          000000000000FFFFFF00000000000000000000003E000000060000000A000000
          1200000022000000400000008000000100000002000000040000000800000010
          0000002000000040000000800000010000002200000024000000280000003000
          00003E0000000000000000000000}
        OnMouseDown = Ifl_extMouseDown
        OnMouseMove = Ifl_extMouseMove
        OnMouseUp = Ifl_extMouseUp
      end
    end
    object Button1: TButton
      Left = 0
      Top = 624
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Mrecu: TMemo
      Left = 135
      Top = 248
      Width = 241
      Height = 377
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
    end
    object Button2: TButton
      Left = 8
      Top = 592
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 4
      OnClick = Button2Click
    end
  end
  object Pftp: TPanel
    Left = 32
    Top = 16
    Width = 537
    Height = 209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object Lconnected: TLabel
      Left = 32
      Top = 176
      Width = 94
      Height = 25
      Caption = 'Connect'#233
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object LServeur: TLabel
      Left = 32
      Top = 72
      Width = 55
      Height = 20
      Caption = 'Serveur'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lidentifiant: TLabel
      Left = 164
      Top = 88
      Width = 71
      Height = 20
      Caption = 'Identifiant'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LMot_de_passe: TLabel
      Left = 120
      Top = 120
      Width = 115
      Height = 20
      Caption = 'LMot_de_passe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LNom_du_fichier: TLabel
      Left = 136
      Top = 152
      Width = 101
      Height = 20
      Caption = 'Nom du fichier'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Cbftp: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'FTP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CbftpClick
    end
    object Ech_ftp: TEdit
      Left = 32
      Top = 48
      Width = 489
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'node1-fr.n0c.com'
    end
    object Eftp_id: TEdit
      Left = 240
      Top = 88
      Width = 281
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      Text = 'vote_zoom@catho-rama.net'
    end
    object Eftp_pw: TEdit
      Left = 240
      Top = 120
      Width = 281
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      Text = 'Y76Sj4qlsyVjrb58TZFm'
    end
    object Eget: TEdit
      Left = 240
      Top = 152
      Width = 281
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'ExempleExport.csv'
    end
    object Pftp_dbg: TPanel
      Left = 32
      Top = 72
      Width = 185
      Height = 97
      BevelOuter = bvNone
      TabOrder = 4
      object Blist: TButton
        Left = 8
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Blist'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BlistClick
      end
      object Bconnect: TButton
        Left = 8
        Top = 0
        Width = 113
        Height = 25
        Caption = 'Bconnect'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BconnectClick
      end
      object Bdeconnexion: TButton
        Left = 8
        Top = 72
        Width = 153
        Height = 25
        Caption = 'Bdeconnexion'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = BdeconnexionClick
      end
      object Bget: TButton
        Left = 8
        Top = 48
        Width = 75
        Height = 25
        Caption = 'Bget'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = BgetClick
      end
      object Cbdetails: TCheckBox
        Left = 88
        Top = 32
        Width = 97
        Height = 17
        Caption = 'Cbdetails'
        TabOrder = 4
      end
    end
  end
  object Pweb: TPanel
    Left = 32
    Top = 248
    Width = 537
    Height = 209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Cbweb: TCheckBox
      Left = 8
      Top = 16
      Width = 97
      Height = 17
      Caption = 'WEB'
      TabOrder = 0
      OnClick = CbftpClick
    end
    object Ech_web: TEdit
      Left = 32
      Top = 56
      Width = 489
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'https://abandonware-magazines.org/lib/default.css'
    end
  end
  object Plocal: TPanel
    Left = 32
    Top = 480
    Width = 537
    Height = 209
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Cblocal: TCheckBox
      Left = 8
      Top = 16
      Width = 169
      Height = 17
      Caption = 'Dossier local'
      TabOrder = 0
      OnClick = CbftpClick
    end
    object Ech_local: TEdit
      Left = 32
      Top = 56
      Width = 489
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'pouvoirs\ExempleExport.csv'
    end
    object Cb_relatif: TCheckBox
      Left = 32
      Top = 88
      Width = 313
      Height = 17
      Caption = 'relatif au r'#233'pertoire de l'#39#233'x'#233'cutable'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
  end
  object cbaucunpouvoirs: TCheckBox
    Left = 592
    Top = 24
    Width = 241
    Height = 25
    Caption = 'Aucun pouvoir donn'#233
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = CbftpClick
  end
  object BImporter: TButton
    Left = 608
    Top = 320
    Width = 185
    Height = 41
    Caption = 'Importer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = BImporterClick
  end
  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    MaxLineAction = maException
    ReadTimeout = 0
    OnDisconnected = IdFTP1Disconnected
    OnWorkEnd = IdFTP1WorkEnd
    OnConnected = IdFTP1Connected
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    OnAfterGet = IdFTP1AfterGet
    Left = 840
    Top = 672
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
    Left = 808
    Top = 672
  end
end

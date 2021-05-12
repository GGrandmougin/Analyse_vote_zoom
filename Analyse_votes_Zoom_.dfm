object Form1: TForm1
  Left = 450
  Top = 129
  Width = 1280
  Height = 768
  Caption = 'Analyse des votes  par ZOOM   v1.0'
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PEntrees: TPanel
    Left = 12
    Top = 12
    Width = 401
    Height = 145
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 3
    BorderWidth = 3
    BorderStyle = bsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LEntree: TLabel
      Left = 155
      Top = 0
      Width = 54
      Height = 16
      Caption = 'Entr'#233'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Ldebut: TLabel
      Left = 48
      Top = 36
      Width = 107
      Height = 16
      Caption = 'Heure du d'#233'but'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 88
      Width = 87
      Height = 16
      Caption = 'Fichier '#224' traiter'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Lduree: TLabel
      Left = 256
      Top = 36
      Width = 43
      Height = 16
      Caption = 'Dur'#233'e'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label21: TLabel
      Left = 8
      Top = 68
      Width = 97
      Height = 16
      Caption = 'Nb de membres'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 362
      Top = 31
      Width = 21
      Height = 16
      Caption = 'm,s'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ME_heure: TMaskEdit
      Left = 160
      Top = 28
      Width = 81
      Height = 28
      Hint = 'heure du d'#233'but du vote'
      EditMask = '!90:00:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentFont = False
      TabOrder = 0
      Text = '12:00:00'
      OnChange = ME_heureChange
    end
    object Efic_msg: TEdit
      Left = 8
      Top = 104
      Width = 353
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = 'C:\telechergements_Zoom\meeting_saved_chat.txt'
      OnChange = Efic_msgChange
    end
    object ME_duree: TMaskEdit
      Left = 304
      Top = 28
      Width = 53
      Height = 28
      Hint = 'dur'#233'e du vote'
      EditMask = '!90:00;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 5
      ParentFont = False
      TabOrder = 2
      Text = '05:00'
      OnChange = ME_heureChange
    end
    object Enb_membres: TEdit
      Left = 112
      Top = 68
      Width = 49
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '   4261'
      OnClick = Enb_membresClick
    end
    object BEditer: TButton
      Left = 6
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editer'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = BEditerClick
    end
    object Bselectfic: TButton
      Left = 365
      Top = 104
      Width = 20
      Height = 17
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = BselectficClick
    end
    object ListBox1: TListBox
      Left = 168
      Top = 68
      Width = 137
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      Items.Strings = (
        'Vote non secret'
        'Vote secret strict'
        'vote secret tol'#233'rant')
      ParentFont = False
      TabOrder = 6
      OnClick = ListBox1Click
      OnKeyUp = ListBox1KeyUp
    end
    object BMerge: TButton
      Left = 311
      Top = 64
      Width = 75
      Height = 33
      Caption = 'Merge'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      WordWrap = True
      OnClick = BMergeClick
    end
    object Cbanalysevisible: TCheckBox
      Left = 288
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Analyse visible'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 8
      OnClick = CbanalysevisibleClick
    end
  end
  object PAction: TPanel
    Left = 424
    Top = 12
    Width = 141
    Height = 145
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 3
    BorderWidth = 3
    BorderStyle = bsSingle
    TabOrder = 1
    object LAction: TLabel
      Left = 43
      Top = 0
      Width = 44
      Height = 16
      Caption = 'Action'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 40
      Height = 13
      Caption = 'Vote N'#176' '
    end
    object Lnomvote: TLabel
      Left = 16
      Top = 48
      Width = 64
      Height = 13
      Caption = 'Nom du vote:'
    end
    object Lvotes_precfg: TLabel
      Left = 8
      Top = 120
      Width = 3
      Height = 13
    end
    object BTraitement: TButton
      Left = 24
      Top = 88
      Width = 89
      Height = 25
      Caption = 'Traitement'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BTraitementClick
    end
    object ENoVote: TEdit
      Left = 72
      Top = 20
      Width = 33
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '1'
      OnChange = ENoVoteChange
    end
    object Enomvote: TEdit
      Left = 8
      Top = 64
      Width = 121
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnChange = EnomvoteChange
    end
    object UpDown1: TUpDown
      Left = 105
      Top = 20
      Width = 16
      Height = 28
      Associate = ENoVote
      Min = 1
      Position = 1
      TabOrder = 3
    end
  end
  object PResultats: TPanel
    Left = 576
    Top = 12
    Width = 673
    Height = 145
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 3
    BorderWidth = 3
    BorderStyle = bsSingle
    TabOrder = 2
    object LResultats: TLabel
      Left = 300
      Top = 0
      Width = 66
      Height = 16
      Caption = 'R'#233'sultats'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 40
      Top = 16
      Width = 54
      Height = 24
      Caption = 'Choix:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label18: TLabel
      Left = 32
      Top = 40
      Width = 69
      Height = 24
      Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label19: TLabel
      Left = 24
      Top = 72
      Width = 93
      Height = 20
      Caption = '% / exprim'#233's:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 24
      Top = 104
      Width = 96
      Height = 20
      Caption = '% / membres:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Ppour: TPanel
      Left = 112
      Top = 16
      Width = 89
      Height = 113
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object Label11: TLabel
        Left = 24
        Top = 0
        Width = 45
        Height = 24
        Caption = 'Pour'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Epour: TEdit
        Left = 24
        Top = 24
        Width = 49
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '125'
      end
      object Ep_ppc_exp: TEdit
        Left = 32
        Top = 56
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '53'
      end
      object Ep_ppc_nbmb: TEdit
        Left = 32
        Top = 88
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '25'
      end
    end
    object Pcontre: TPanel
      Left = 224
      Top = 16
      Width = 89
      Height = 113
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object Label12: TLabel
        Left = 24
        Top = 0
        Width = 63
        Height = 24
        Caption = 'Contre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Econtre: TEdit
        Left = 24
        Top = 24
        Width = 49
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '63'
      end
      object Ec_ppc_exp: TEdit
        Left = 32
        Top = 56
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '27'
      end
      object Ec_ppc_nbmb: TEdit
        Left = 32
        Top = 88
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '12'
      end
    end
    object Pabs: TPanel
      Left = 328
      Top = 16
      Width = 89
      Height = 113
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object Label16: TLabel
        Left = 24
        Top = 0
        Width = 37
        Height = 24
        Caption = 'Abs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Eabs: TEdit
        Left = 24
        Top = 24
        Width = 49
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '6'
      end
      object Ea_ppc_exp: TEdit
        Left = 32
        Top = 56
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '5'
      end
      object Ea_ppc_nbmb: TEdit
        Left = 32
        Top = 88
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '2'
      end
    end
    object Pnon_exp: TPanel
      Left = 440
      Top = 16
      Width = 89
      Height = 113
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 3
      object Label17: TLabel
        Left = 0
        Top = 0
        Width = 81
        Height = 24
        Caption = 'Non exp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Enon_exp: TEdit
        Left = 24
        Top = 24
        Width = 49
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '4'
      end
      object Edit21: TEdit
        Left = 32
        Top = 56
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '4'
        Visible = False
      end
      object Ene_ppc_nbmb: TEdit
        Left = 32
        Top = 88
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '2'
      end
    end
    object Pvotants: TPanel
      Left = 552
      Top = 16
      Width = 89
      Height = 113
      BevelOuter = bvNone
      TabOrder = 4
      object Label13: TLabel
        Left = 16
        Top = 0
        Width = 70
        Height = 24
        Hint = 'nombre de voix des participants  et  leurs pouvoirs'
        Caption = 'Votants'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Laremplir: TLabel
        Left = 16
        Top = 56
        Width = 72
        Height = 20
        Caption = 'A remplir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Evotants: TEdit
        Left = 24
        Top = 24
        Width = 57
        Height = 32
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Text = '0'
      end
      object Edit9: TEdit
        Left = 32
        Top = 56
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '49'
        Visible = False
      end
      object Ev_ppc_nbmb: TEdit
        Left = 32
        Top = 88
        Width = 25
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        Text = '49'
      end
    end
  end
  object RichEdit1: TRichEdit
    Left = 12
    Top = 229
    Width = 1237
    Height = 488
    Color = clBtnFace
    Lines.Strings = (
      
        '#####1\fbidis\ansi\ansicpg1252\deff0\deflang1036{\fonttbl{\f0\fr' +
        'oman\fprq2\fcharset0 Liberation Serif;}{\f1\froman\fprq2\fcharse' +
        't128 Liberation Serif;}{\f2\fnil MS Sans Serif;}}'
      '\viewkind4\uc1\pard\ltrpar\sa140\sl276\slmult1\f0\fs24 '
      
        '\par \pard\ltrpar\li4082\sl276\slmult1\b\f1\fs40 R\u233?sum\u233' +
        '? utilisation\b0\f0\fs24 '
      '\par \pard\ltrpar\sl276\slmult1\b\fs28 '
      
        '\par \pard\ltrpar\li1644\sl276\slmult1 Le nommage dans la r\'#39'e9u' +
        'nion Zoom \b0\fs24 (l\rquote ordre de ces informations, la casse' +
        ', les accents sont indiff\'#39'e9rents)'
      
        '\par \pard\ltrpar\li2268\sl276\slmult1 Doit figurer :   \b nom\b' +
        '0 ,  \b pr\'#39'e9nom\b0  ,  code (3 lettres) de la \b r\'#39'e9gion\b0 ' +
        ', et le \b num\'#39'e9ro\b0  de membre '
      '\par \pard\ltrpar\sl276\slmult1\b\fs28 '
      
        '\par \pard\ltrpar\li1644\sl276\slmult1 Le vote se fait par les m' +
        'essages Zoom\b0\fs24 '
      
        '\par \pard\ltrpar\li2268\sl276\slmult1 1 seule indication de cho' +
        'ix par message'
      '\par Si on a plusieurs voix , on peut indiquer plusieurs choix'
      '\par \pard\ltrpar\sl276\slmult1 '
      
        '\par \pard\ltrpar\li1644\sl276\slmult1\b\fs28 Choix possibles et' +
        ' nombre  \b0\fs24 (l\rquote ordre de ces informations, la casse,' +
        ' les accents sont indiff\'#39'e9rents)'
      
        '\par \pard\ltrpar\li2268\sl276\slmult1\b pour\b0 , \b contre \b0' +
        ' et abstention (que l\rquote on peut abr\'#39'e9ger en \b abs\b0  ou' +
        '  abst )'
      
        '\par dans le m\'#39'eame message, on indique le \b nombre \b0 de voi' +
        'x qu\rquote on attribue \'#39'e0 ce choix '
      '\par le nombre peut \'#39'eatre omis pour au maximum un choix'
      '\par \pard\ltrpar\sl276\slmult1\fs28 '
      '\par \pard\ltrpar\li1644\sl276\slmult1\b Corrections\b0\fs24 '
      
        '\par \pard\ltrpar\li2268\sl276\slmult1 pour un choix donn\'#39'e9 c\' +
        'rquote est le dernier message envoy\'#39'e9 qui compte, si on ne don' +
        'ne plus aucune voix \'#39'e0 ce choix , indiquez 0  (chiffre z\'#39'e9ro' +
        ')'
      '\par \pard\ltrpar\'#39'b0\f2\fs16 '
      '\par }')
    ReadOnly = True
    TabOrder = 7
  end
  object Bvotes_multiples: TButton
    Left = 424
    Top = 172
    Width = 145
    Height = 25
    Caption = 'Affichage des votes multiples'
    TabOrder = 8
    Visible = False
    OnClick = Bvotes_multiplesClick
  end
  object PRejets: TPanel
    Left = 12
    Top = 168
    Width = 1237
    Height = 549
    BevelInner = bvRaised
    BevelOuter = bvNone
    BevelWidth = 3
    BorderWidth = 3
    BorderStyle = bsSingle
    TabOrder = 3
    object LAnalyse: TLabel
      Left = 595
      Top = 0
      Width = 57
      Height = 16
      Caption = 'Analyse'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LAnalyseClick
    end
    object Image1: TImage
      Left = 832
      Top = 16
      Width = 369
      Height = 91
      Picture.Data = {
        07544269746D617072880000424D728800000000000036040000280000007101
        00005B00000001000800000000003C8400000000000000000000000100000000
        0000F0F0F00006010000E5EBEE00EDF0F000F0F0EF00010209000C0300000000
        0000EFF0F00000010400F0F0EC000309130003112100EAEEF000EFEEED00F0EF
        E600ECE7DF001B0E0200ACC8DE0001031000D1F0F00005040300140C0500E6EF
        F000ECEDED00021A3000DFEAF000DBC3A500CCDCE600F0EFEA0001022F00EEE9
        E4004B6A97001E0201006A97BA00F0EFE1009B784B004C2B1B000B101900EEEB
        E8001305010092929200321B0000E4D8C80001284800F0E3CD00C4D7E300A783
        60007495B800D8E7EE00DDF0F000E0E7EC002311040001031C0021160C002E2E
        2E00EAE1D200F0E7D500C7AD8C0017181A007D9EBD00517EA200B38F63006F4A
        2A0000012300EFE5D80015263F000B0B0C00E1E0E00016130E0098BBDB009FC0
        D900E5DCD100A5C4D700BA9B78002F1B0F00BEA48500CACACB0083603D009670
        5100E4D4BC0044260000C1C0C000D9C6A8008C68410032537700D2B28D007A58
        37001E375500EAE3DC00081D3800DDC9AE00131B48004F759800D2BB9C00D4E0
        E800382111000D152500B2926F007D7D7C00957249000E1E2B0044668600DDD6
        CD00E6CBAB008FB1CE002A3F5E00D1E3ED006D91AF003A678B00496D8E00E8DD
        C700DAE0E60042291500835F3200BACFE0002F3B4C00211B15001D1E20005556
        5600BAD9E40015223200B5B6B500F0E9DB00646363007550310052352300D1C7
        BB007F94AB00212934005C5C5C003E2F2400B6A79700EFE1C200E2E5E7006C8C
        B4008D614500A3999000E6E0D8006287A800594A3D00C19D7400C5CFD8007474
        720037160D00A1A3A600483B3100C0D5E400200D010095B9D60048341D008589
        8F005C3A21002B221500B7C9D800C6DDEC00693C2A00AD8A67005D6D7B00BBC3
        D00068503900B3D2E1003A2817002E4A6D00345E82001F3A5C00172B49002B11
        05002A3E6700C8B8A4003B4754003E5B7A009D81610097ACC000D3DCDE009F7A
        560021242800444341002B577B00E2D0B50085848200EFD9BE00CCB393005733
        1700D3C2AE00CBA9820033292000563E2B004E4E4D00816C5900DCCDB800C5A1
        76001F314D00B7BABE007BA5C800CABBAE00908474003B39360040505E00A8B7
        C60061452E0084A7C500D4CFC900204B6E00A3BDD1009AB5CD004D2C0800A4AC
        B900A18A71003A517D00A28F7D0046628E00354B66006F675B003B516C008EA5
        BB00C2AF9C004A5C6E00223142006F6A69005F7FA300CFD2D30066441F00CAD3
        DE00625949009397A30074839100587C9C00E0D2C200DDBC9600828F9E00928B
        8500B0A9A200AEB0AE00AD97840069788400D9CEC1008D9DB100020F3300917A
        6200628FB2008563470085776A00AFC1CD005C636F0079634F003E1F0500F0F0
        D900CBE8ED002E373F006C849F00657D9400BCB3A80045230B00516D8600B5D4
        EE000000000000000000009FC231030000000000000000000000000000000000
        0000000000030303030303030303030303030303030300000000000000000000
        00000302F8F8F802030000000000000000000000000000000000000003000000
        0331F81708000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0008030303030303030303030303030303030000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000D311A030000009B6B08000000000000
        0000000000000000000303030303030303030303030303030308000000000000
        0000000000000000000000000000000000000000000000000000000000000008
        0D31F8F81A0D0800000000000000000000000000000000000000000000000091
        07EE6647330300000000000000000000000000000000000000DC202020202020
        20202020202020202020860000000000000000000D47662C1E1EEE2C20A10300
        0000000000000000000000000000333CFB18003166EE1EA5CC03000000000000
        00000000000000CC2222222222222222222222CD000000000000000000464646
        464646464646464646464646467300000000000000000000000000C922222222
        222222222222229A00000000000000000000000000C720202020202020202020
        2020202020208600000002787878787878787878787878787878780200000000
        00000000000000000E2222222222222222222222225F00000000000000000000
        0000089355EE5A6E1C0018AA5A6C0200000000000000000000000000DF202020
        2020202020202020202020202080000000000000000000C92222222222222222
        2222229A00000000000000000000000000003130A85A1E1E5AA3303100000000
        000000000000000000000000000000000000007FDE110113A58B730200000000
        00000000000000000000000000BA010707012828060707070707070707074400
        000000000000000DFA0B01114B603611070CD703000000000000000000000000
        0070D4093BDD0DD60736A701658E000000000000000000000000007C01070707
        0707070707070782000000000000000000150707070707070707070707070707
        077C00000000000000000000000000C501070707070707070707079700000000
        000000000000000000B401070701282806070707070707070707AE0000005240
        404040404040404040404040404040C100000000000000000000000018060107
        0707070707070707075200000000000000000000000070C001360607D618107E
        0613800800000000000000000000000052060707070628280107070707070707
        07B1000000000000000000C50107070707070707070707B40000000000000000
        00000000001CA50706366060360607A55F000000000000000000000000000000
        0000000000000000231B247128091955C91C0300000000000000000000000000
        008437063F623AB64CF11115BD2F2F2F2F2F1F0000000000000000C71311AF53
        852DB51BF106618E00000000000000000000000000E6074B2F59F343995BB3BB
        07E200000000000000000000000000A9E0014B3F72727272727272EA00000000
        00000000007E252525252525252525252525252525C400000000000000000000
        0000004CC501A25772727272727272D800000000000000000000000000ECC506
        3F623AB64CF11107BD2F2F2F2F2F100000005201070745252525252525252525
        252525520000000000000000000000000EF22634987264646464646464670000
        0000000000000000000091078C50AC15058E0439EF01F9860000000000000000
        000000008AC443A7544AB6B662980199AC2F2F2F2F4C0000000000000000004C
        C501605772727272727272D800000000000000000000000003D907254C502D2D
        B34A2507D903000000000000000000000000000000000000000000000000042D
        4C57A70105426ECC00000000000000000000000003FE15AC0F000000001D4C16
        D40D00000000000000000000000000C615D00A00000000000FBD07EB00000000
        0000000000000000187443D800009707630000E8077700000000000000000000
        000000C761A0500F000000000000000000000000000000000039393939393939
        3939393939393939392300000000000000000000000000800B4F6F0A00000000
        0000000000000000000000000000000000C715EF23000000001D4C16D40D0000
        00000000000010AC340726E68A393939393939393939391D0000000000000000
        000000002E5A835323040000000000000000000000000000000000000000F407
        E8007B1607E200008ABA0BDD000000000000000000000000DFDA4B5E04000000
        0041F513ED0000000000000000000000000000800B4F6F0A0000000000000000
        0000000000000000000000008E0B4BE40000000000006F4B0B8E000000000000
        0000000000000000000000000000000000000000000F504AA016077900000000
        00000000000000009F26921F0000000000000AE005C700000000000000000000
        0000000B3B5900000000000000CA07F9000000000000000000000000180B761F
        0000F407E90000C1077700000000000000000000000018AA75EC000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000070818359000000000000000000000000000000000000
        000000000074921F0000000000000AE005C70000000000000000001D5E980113
        AB9300000000000000000000000000000000000000000000B407E70000000000
        00000000000000000000000000000000000077077A00008C0774000004B1074D
        000000000000000000000000FB07D2040000000000002B45420E000000000000
        0000000000007081835900000000000000000000000000000000000000000000
        E109DB0000000000000000DB09E1000000000000000000000000000000000000
        000000000000000000039B3CD60B073B00000000000000000000000091077C00
        000000000000008F072900000000000000000000000000153B03000000000000
        007007370000000000000000000000002707B000000074076700009107F20000
        0000000000000000000044133704000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000C105
        82000000000000000000000000000000000000000000000000267C0000000000
        000000630729000000000000000000000038AC1107793C020000000000000000
        000000000000000000000000D207D90300000000000000000000000000000000
        000000000000D507E10000E71515020018B1154D000000000000000000000000
        BC07520000000000000004760918000000000000000000000000C10577000000
        0000000000000000000000000000000000000000290763000000000000000063
        072900000000000000000000000000000000000000000000000000F8C2551905
        07347D56000000000000000000000000E915AA1800000000000000C615840000
        0000000000000000000000990BF300000000000000D7078C0000000000000000
        0000000027063B5F00187606270002C606C30000000000000000000000004407
        B031000000000000000000000000000000000000001414141414141414141414
        1414141414320000000000000000000000007A07AA0D00000000000000000000
        000000000000000000000000003BAA1800000000000000C61584000000000000
        0000000000000A53B70713552E00000000000000000000000000000000000000
        597D4C2700000000000000000000000000000000000000000000E80779690D48
        3B0780009A2683590000000000000000000000007707ED00000000000000DF26
        A70E0000000000000000000000007A07AA0D0000000000000000000000000000
        0000000000000000E815740D0000000000000DAA15E800000000000000000000
        0000000000000000000000033195D3EE0901343F8D6F0A000000000000000000
        00000000487507300D080000000D3C15995900000000000000000000000000EF
        075A303300000033696101840000000000000000000000000E9209E31A9F43B1
        026B5D058C1F0000000000000000000000001F8309D39B020202020202020218
        000000000000000000EE1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E9E000000000000
        000000000000CA750587F802020202020202020D000000000000000000000000
        00D507300D080000000D3C05995900000000000000000000000000007BAF1107
        193C0D0000000000000000000000000000000000000A080212C23D8B22A10D00
        000000000000000000000000000059BB07754400F50735551907D00000000000
        00000000000000008407797303000000036BD607BD0400000000000000000000
        000067750587F80202020202020202180000000000000000000000001F990955
        470000000D9B6E09991F000000000000000000000000000000000000000000C7
        5A090111DE8D850A0000000000000000000000000000000000D0060555309569
        30550B06EA0000000000000000000000000000599801454D000000D41301A027
        00000000000000000000000000D201052C420765A6EE07076ACD000000000000
        00000000000004D21507402C2C2C2C2C2C2C2CFE000000000000000000150716
        161616161616161616161606077C0000000000000000000000000AF50707EE2C
        2C2C2C2C2C2C2CED00000000000000000000000000E406055530956930550B06
        EA00000000000000000000000000000000041B980105552E0800000000000000
        00000000000000000003CD580507070707135573080000000000000000000000
        0000002B54F127002B9606061188100000000000000000000000000059C80719
        206995698BC0096067000000000000000000000000000ABD0707EE2C2C2C2C2C
        2C2C2C8000000000000000000000000000B694078C000000CFEE09163A000000
        000000000000000000000000000000000000009111989D680F00000000000000
        000000000000000000000000000F9D4B010707070706904A0000000000000000
        000000000000000038AC571F000000F260AF7B00000000000000000000000000
        001F6460111111111111112801BC00000000000000000000000000272F713611
        11111111111111D50000000000000000001545686868686868686868686868F2
        077C000000000000000000000000008A4F60361111111111111111E700000000
        000000000000000000009D4B0107070707069062000000000000000000000000
        0000000000000041AF34075A3C02000000000000000000000000000000AD0B06
        25BB0783729007428E000000000000000000000000000000000F00000041564A
        1B1D0000000000000000000000000000006F7D11070707070728C85B00000000
        00000000000000000000008A4F60361111111111111111E70000000000000000
        0000000000001B57EA000000679998B600000000000000000000000000000000
        00000000000000675B230017316B311700000000000000000000000000000000
        0000005062549C3F4E4A6F040000000000000000000000000000000000042317
        316B31672D00000000000000000000000000000000000A855B1B1B1B1B1B1BB6
        62D00000000000000000000000000000043950531B1B1B1B1B1B1BE400000000
        0000000000153B00000000000000000000000029077C00000000000000000000
        000000000A2DB31B1B1B1B1B1B1B1B4800000000000000000000000000000050
        62549C3F4E622B0400000000000000000000000000000000000000000A5E9801
        13AB7303000000000000000000000000027906AC7B9107DB042BA007D9180000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000F5EAC579C7D243A7B0000000000000000000000000000000000
        0A2DB31B1B1B1B1B1B1B1B480000000000000000000000000000001D0F000000
        00B32300000000000000000000000000000000000000000000000000006B6C55
        C042C0A36C9B0000000000000000000000000000000000000004230F04000000
        0000000000000000000000000000000003938BA3C04258556C6B000000000000
        0000000000000000000000000000000000000000000A00000000000000000000
        00000000000000000000000000000000000000000000000000153B0000000000
        0000000000000029077C00000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000004230F0400000000000000
        000000000000703C3C3C3C3C3C3C3C3C3C3C80B00707798E0000000000000000
        000393CCCF078C0F009107DB0000EC3676AE0000000000000000000000000212
        12121212121212736B03000000000000000000000000000000000000000A231D
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000002121212121212121212121212121212125F000000000000
        000000000000000000000000000000009AC00507212121070542CC0000000000
        0000000000000000000000174930DCDC30471A00000000000000000000000000
        00000008AD5A09012121210705A69A0000000000000000000032323232323232
        323232323232323232320000000000000000000000000000000DA13C8BE36C69
        6B000000000000000000000000153B00000000000000000000000029077C0000
        000000000000000000000000001712308BDC30471A0000000000000000000000
        0000000000000000000000000000000000000000000000000000520505050505
        05050505050505090707077A0000000000000000736E65DB63072900009107DB
        00001DB115520000000000000000000000004D0C0C0C0C0C0C0C0C61A6DC3300
        0000000000000000000000000000006B696CE38B3CA103000000000000000000
        0000000000000000001712308BDC30471A00000000000000000000004D0C0C0C
        0C0C0C0C0C0C0C0C0C0C0C0C0CE1000000000000000000000000000000000000
        0000005FDA0798BF5BB35BB99807791C000000000000000000000000000049A8
        0B050707050BA5CD0000000000000000000000000000009A61067D3A5BB353BF
        B707DA1C000000000000000000D65C5C5C5C5C5C5C5C5C5C5C5C5C5C5C9E0000
        0000000000000000000000002EAB61050907050BA63017000000000000000000
        00153B03000000000000000000000097077C0000000000000000000000000000
        12A326050907050B5869080000000000000000000000000000EDCBCBCBCBCBCB
        CBCBCBCBCBAD00000000000000006788888888888888888888888888888888EC
        0000000000000000BC0971B8B4079700009107DB000003BC0752000000000000
        000000000000CA51515151515151512A0709FB03000000000000000000000000
        00026C420B0507091361661C0000000000000000000000000000000012A32605
        0907050B586908000000000000000000CA5151515151060728F6515151515151
        518900000000000000000000000000000000000000000080097E590000000000
        41C807EB000000000000000000000000009A6107F64E4F4F4EF6072649000000
        00000000000000000000009E07F51F0000000000397E07970000000000000000
        0037070707070707070721210607070121E0000000000000000000000000005F
        5807347D4F4F88B7011380030000000000000000007545AE0000000000000000
        0000008F0763000000000000000000000000007379072A574F4F4EFD010BCC00
        00000000000000000000000000C4210707070707070707070729000000000000
        0000040A0A0A0A0A0A0A0A0A0A0A0A0A0A0A0A040000000000000000B1576F04
        FC07AA03009107DB00001C793BDD0000000000000000000000000E1010101010
        10101038AF01817000000000000000000000000003FA0506B7544F4F3F94076A
        3300000000000000000000000000007379072A574F4F4EFD010BCD0000000000
        000000000E10101010D7137D1B59101010101010102700000000000000000000
        0000000000000000000000AA07C300000000000000BE15810000000000000000
        000000000D6A075741040404047B4E07810D0000000000000000000000000061
        452B00000000000000C30774000000000000000000B568686868B10657E58585
        B5B99843292D00000000000000000000000008FB07965004040404279D16268E
        0000000000000000008C15ED08000000000000000000337907A9000000000000
        0000000000000DD407A038040404047BF1017917000000000000000000000000
        00AE65F6AFBF56E5E5E5E5E5E548000000000000000000000000000000000000
        000000000000000000000000000000001B1F00000E71055D6B9107DB001CD607
        8C1D000000000000000000000000000000000000000000001092054D00000000
        00000000000000009F26164C1D040404045BA207E20000000000000000000000
        00000DD607A038040404047BF10165170000000000000000000000008665711F
        0000000000000000000000000000000000000000000000000000000000000037
        07440000000000000000153B0000000000000000000000009F26605900000000
        00001F7143C100000000000000000000000000153B0000000000000000440737
        00000000000000000000000008FA01EF0F000000000041C8269F000000000000
        000000000000868116C30000000000001DF50797000000000000000000890765
        490300000000000000336E0983440000000000000000000000008E3B4B480000
        000000001F7E15CF00000000000000000000000000D483380000000000000000
        0000000000000000000000003178780200000000000000000000000000000000
        0000000000000000005B60095A4207DB18420736B80000000000000000000000
        00000000000000000000000008B106CA000000000000000000000000E207BD0E
        000000000000A916810E0000000000000000000000008E3B4B48000000000000
        1F7E15CF000000000000000000000000ED096300000000000000000000000000
        0000000000000000000000000000000000000092079F00000000000000AE07BA
        00000000000000000000000091097C00000000000000008F07E1000000000000
        00000000000000453B70000000000000009F0792000000000000000000000000
        1865758A0000000000000084079E0000000000000000000000004405370E0000
        0000000000E907820000000000000000001FBB0719DC126B31316B73C9A30543
        D8040000000000000000000000007A09770400000000000000B4079700000000
        000000000000000000458208000000000000000000000000000000000000009A
        A57661663100000000000000000000000000000000000000000000000000504E
        601128DB0EE0BB1B000000000000000000000000000000000000000000000000
        1C799259000000000000000000000000BC0752000000000000000E7605180000
        000000000000000000007A09770400000000000000B407970000000000000000
        000000002907EB00000000000000000000000000000000000000000000000000
        00000000000000C407C61A000000000002D907F2000000000000000000000000
        E8077C08000000000000008F072900000000000000000000000000E009EB0200
        000000001AC607C40000000000000000000000002707B003000000000000007A
        07770000000000000000000000004415371800000000000000E9078200000000
        0000000000002BC806090C42C0C0420C0507A74C0E0000000000000000000000
        00007A157708000000000000006307E700000000000000000000000000BB3786
        0000000000000000000000000000000000007074C81BB636EB00000000000000
        000000000000000000000000000000000000000A6F1BB6BE002B7B0000000000
        000000000000000000000000000000000000036BFE1184000000000000000000
        00000000BC07C100000000000000187615180000000000000000000000007A15
        770300000000000000B407E7000000000000000000000000E815797317000000
        000000000000000000000000000000000000000000000000000000679909D6CC
        9B9B9BCDAB0536EC0000000000000000000000007F45B05F0000000000003381
        43C300000000000000000000000000C3160BFE499B9B9369D609996700000000
        0000000000000000187526F30000000000000D9E07F200000000000000000000
        00001FBA43C700000000000002F407D200000000000000000000004162983406
        0707012171645B0A0000000000000000000000000000CA3676DF000000000000
        33F915A9000000000000000000000000005B5B27000832320D00000000000000
        0000000000005209FC0000D57600000000000000000000000000000000000000
        0000000000000000036B9B9B310300000000000000000000000000000000AE6D
        6D6D6D6D6D6DA4A605773070000000000000000000000000C4079E0D00000000
        0000CF43830E000000000000000000000000CA7576DF00000000000033F915A9
        00000000000000000000000010A20765556D6D6D6D6D6D6D6DC7000000000000
        00000000000000000000000000000000D860070B6565650B07114C0000000000
        00000000000000000E8C07D49B000000039BAB07920E00000000000000000000
        0000000E6234090C6565650B0734D80000000000000000000000000004BD07C0
        49030000006BFA0B117F00000000000000000000000004C407DA49030000086B
        FA0B7567000000000000000000000000047BBEB6B9B93A1B380A000000000000
        000000000000000000000EE0076A9B000000039B660983180000000000000000
        00000000000000A18BA4A5A5CBE31208000000000000000000007F16CF0000D9
        BA000000000000000000000000000000000000000000000000001AC955426565
        A6A4471700008B6C310000000000000000004D0707070707070707070705054D
        0000000000000000000000007F450B6C1A00000017CC4207D200000000000000
        0000000000000EE0076A93000000039B66098318000000000000000000000000
        00B8710107070707070707070729000000000000000000000000000000000000
        0000000004E44FCEA721A7CE4E53040000000000000000000000000000BE4B07
        5AB26E6E55650794B80000000000000000000000000000000A534E51A7212ACE
        54BE0400000000000000000000000000004825070CCB6E6E66420528D20E0000
        00000000000000000000008ABB070CCB6E6EA4420506EA0E0000000000000000
        00000000000000000000000000000000000000000000000000000000000000EC
        600719B26E6E555A0911C3000000000000000000000000000000306109070707
        07070CE30D0000000000000000001FA0813C8B43D20000000000000000000000
        000000000000000000000000009BA81307212AA70607265D1A00D50574020000
        0000000000008A3E3E3E3E3E3E3E3E3E3E3E3E8A000000000000000000000000
        0ED0060558666E6EA52607C8100000000000000000000000000000EC600719B2
        6E6E555A0911A9000000000000000000000000000000385E8D3E3E3E3E3E3E3E
        3EBE0000000000000000000000000000000000000000000000000A1F6F853810
        1D0000000000000000000000000000000004B33F060707070706B75E04000000
        00000000000000000000000000001D106F8538100A0000000000000000000000
        0000000000006F54A70707070701B73A0E000000000000000000000000000000
        3854940707070701F64A1D000000000000000000000000000000000000000000
        0000000000000000000000000000000000000004507D060707070701CEB60400
        00000000000000000000000000700B0654620783565428096C00000000000000
        0000004854FDCE9D0E0000000000000000000000000000000000000000000000
        0E6A07718D50382D682F9405FA007FA207E60000000000000000000000000000
        000000000000000000000000000000000000000000274CFD0707070707214E38
        00000000000000000000000000000004507D280707070701CEB6040000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000003030800080303030303030303030303030000000000000000
        0000000000000004688D2F9DBF680F0000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000002DB93E3E
        BF680F00000000000000000000000000000000000000B5B92F2F8DE57B000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000068BF2F9D8D1B23000000000000000000000000000003
        08EB074C00DD07C500003A0626860000000000000000000000230F0000000000
        0000000000000000000000000000000000000000F307A22B000000000000D816
        B0AE00C315B100000000000000008E2C66000000000000000000000000000000
        00000000000000000000007BE53E2F3EB9B50A00000000000000000000000000
        00000000000068BF2F9D8D1B2300000000000000000000000000000000000003
        337847127833030000000000000000000000000000000000000000D7D39F009F
        D3D3D3D3D3D3D3D3D3D3D35D0000000000000000000000000000000000000000
        00000000000000000000000000000000000000CCF0F0F0F0F0F0F0F0F0F0F03C
        000000000000000000000000000000080D080000000302080000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000017735DAE81922700DD07C50000008C
        15CF000000000000000000000000000000000000000000000000000000000000
        0000000000000000B407C40000000000000027B109520027157600000000000D
        1CA1AD07F9A1A1A1A1A1A1A1A1A1A10200000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000001CE32C350905352CE31C00000000
        000000000000000000000000000000DB06910091060606060606060606060675
        000000000000000000000000001C2E2E2E2E2E2E2E1C31030000000000000000
        000000000000008F010707070707070707070737000000000000000000000000
        00081C8BD38B1C0800DFA33C3300000000000000000000000000005F2E2E2E2E
        2E2E2E2E2E2E2E5F000000000000000000000000000000000000000000000000
        0000000000000000000000000000009A49494949494949494949491C00000000
        000000007066611667437C0000DD07C500000063072900000000000000000000
        0000000000000000000000000000000000000000000000000000000063072900
        00000000000003BC1552000315750000000003FA194035070540404040404040
        4040404D000000000000000000000000022E2E2E2E2E2E2E2E1C1A0800000000
        00000000000000000000007349494949494949494949491C0000000000000000
        00000000001C42071171B7B7A21607421C000000000000000000000000000000
        000000B84A6700674A4A4A4A4A4A4A4A4A4A4A4C000000000000000000000000
        0074191919191919195AC0E3700000000000000000000000000000B8D5014B7D
        54545454545454AC000000000000000000000000002EA6070707A6AE00290105
        FE02000000000000000000000000009E19191919191919191919199E00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000007435353535353535353535359700000000000000004D07604C1D997703
        00DD07C50000009E072900000000000000000000000000000000000000000000
        00000000000000000000000000000000C301C602000000000000DFB09948009A
        1592000000009F0B01A2990716A2A2A2A2A2A2A2A2A2A2CA0000000000000000
        000000009F191919191919191942A8D703000000000000000000000000000074
        35353535353535353535359700000000000000000000000003D607BB5E2DF7F7
        2DB67E07D4030000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000BB2A2A2A2A2A2A2A2A0107
        D903000000000000000000000000009A61C8500F000000000000000000000000
        000000000000000008F407A09D3607E200E4AF160BF300000000000000000000
        000000D0830701A72A2A2A2A2A2A2ABD00000000000000000000000000000000
        0000000000000000000000000000000000000000000000AC8307347196969696
        9696968900000000000000004DC8BE0400D5269A00DD07C500005F65437F0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000001DA0055D1C0300000D93D601EF0E6BD407C4000000002907A06FC307
        B12D2D2D2D2D2D2D2D2D2D1D0000000000000000000000007F2A2A2A2A2A2A2A
        2A94070BAD0000000000000000000000000000AC830734719696969696969689
        0000000000000000000000008E0B4B2B0000000000002B4B439F000000000000
        0000000000000000000000000000001C6B0000000000000000001A3C00000000
        000000000000000000482B2B2B2B2B2B2BE49D060B8E00000000000000000000
        000000C645EC000000000000000000000000000000000000000000001861752B
        04EF077918000EBD07EB00000000000000000000000000AE744B62BE2B2B2B2B
        2B2B2B8A00000000000000000000000000000000000000000000000000000000
        0000000000000000000000AD613FBE3841414141414141270000000000000000
        2741000000EC15423CCD07C50049A507BB1D0000000000000000000000000000
        0000000000000000000000000000000000000000000000000EFB450942B25D6E
        CB650943ABB2A609A23800000000290763004D288C0000000000000000000000
        000000000000000000000000272B2B2B2B2B2B2B2B5BA007AA08000000000000
        00000000000000AD613FBE38414141414141411F000000000000000000000000
        E109DB0000000000000000DB09E1000000000000000000000000000000000000
        00000091A64900000000000000A1A87600000000000000000000000000000000
        0000000000000AE009E1000000000000000000000000000B3B04000000000000
        000000000000000000000000000000002709B00400FC0609DF00007A07770000
        00000000000000000000039E16D8040000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000070DA
        BA8A0000000000000000000000000000000000000000000000004F06052607C5
        00BC0760BE000000000000000000000000000000000000000000000000000000
        000000000000000000000000180907070707070707070707070721DEB3000000
        0000FCCE89004D65D90000000000000000000000000000000000000000000000
        000000000000000000002B45131800000000000000000000000070DABA8A0000
        0000000000000000000000000000000000000000290763000000000000000063
        0729000000000000000000000000000000000000000000E80135DC3200000017
        6C0C07BB00000000000000000000000000000000000000000000008F07890000
        0000000000000000000000153B6B000000000000000000000000000000000000
        0000000027067618001F7607970000C107BC0000000000000000000000008661
        3727000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000C105820000000000000000000000
        00000000000000000000000000000E5E4EB7F68C00EA546F0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0EBFBFBFBFBFBFBFBFBFBFBFBF5650270000000000000F1F0214F307B1141414
        141414141414140D000000000000000000000000000000000000000000000476
        0618000000000000000000000000C10577000000000000000000000000000000
        00000000000000008415AA0800000000000008AA158400000000000000000000
        0000000000000000000000232F3407A5490DA1A80916AF7B0000000000000000
        000000000000000000000000000003C645EC0000000000000000000000000092
        09D178313333333333333333000000000000000000000000188305800200E007
        AA0308E207630000000000000000000000004407371700000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000007A07AA0200000000000000000000000000000000000000000000
        000000000004F7F7000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000083C2C1E4007131E1E1E1E1E1E1E1E1E1E4D00000000
        000000000000000000000000000000000000DF268C0400000000000000000000
        00007A07AA02000000000000000000000000000000000000000000001F750930
        0D00000008023009991F00000000000000000000000000000000000000000000
        005B98060C6661017E5E00000000000000000000000000000000000000000000
        0817D743BD0000000000000000000000000000841507352C2C2C2C2C2C2C2CD4
        00000000000000000000000000D20113FB00FC1515873061167F000000000000
        00000000000086360BAD17080000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000CA7505669547
        474747474747471C000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000003170D00001717171717171717171717170300000000000000008E26
        0136450715363636363636363636364D00000000000000000000000000000000
        00000000036BAB11A900000000000000000000000000CA750566954747474747
        4747471C00000000000000000000000000EA0605D13C696987A30506EA000000
        000000000000000000000000000000000000000000007BF2070707F538000000
        000000000000000000000000006C3D3D3D3D3D3D5DA30BC5AD1C000000000000
        000000000000000E627E4B343434343434343492000000000000000000000000
        0010F134D20027C807070728EF0E0000000000000000000000000EF5070CD13D
        3D3D3D3D3D3D3DD7000000000000000000000000000000000000000000000000
        00000000000000000000000000000AD016070513131313131313139700000000
        000000000000000000C73D3D3D3D3D3D3D3D3D3D3DF300000000000000000000
        0000000000000000000000000000000000000000000000008ED1800018D1D1D1
        D1D1D1D1D1D1D1D1D1DF00000000000000002907BB50A90792B5B5B5B5B5B5B5
        B5B5B527000000000000000000000000AE3D3D3D3D3D3D3D6EC0438F69080000
        000000000000000000000AD01607051313131313131313970000000000000000
        00000000000A9D4B01070707070134AC0A000000000000000000000000000000
        000000000000000000023C5A013401423C020000000000000000000000000000
        00B007070707070707070713132900000000000000000000000000000439505B
        5B5B5B5B5B5B5BBE00000000000000000000000000000F5B48000048AF3F573A
        27000000000000000000000000000067BB280707070707070707078200000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000278F07A77E9C9C9C9C9C9C9C8400000000000000000000000000B40107
        0707070707070707072900000000000000000000000000000000000000000000
        0000000000000000000000007A06820018060606060606060606060606520000
        000000000000290763004D06BC00000000000000000000000000000000000000
        0000000052070707070707070707091313180000000000000000000000000027
        8F15A77E9C9C9C9C9C9C9C84000000000000000000000000000004B32F579C3F
        729D5B0400000000000000000000000000000000000000000000000093AB1328
        F15B4F1113AB2E00000000000000000000000000009D24242424242424242424
        24B8000000000000000000000000005FA1310000000000000000000000000000
        00000000000000000000000000000000000F0F00000000000000000000000000
        00000000383A9D24242424242424244C00000000000000000000000000000000
        0000000000000000000000000000000000000000000000D761F1B37B23232323
        2323231D00000000000000000000000000E4C5067E6424242424242424B80000
        0000000000000000000000000000000000000000000000000000000000000000
        8A3AB8000E3A3A3A3A3A3A3A3A3A3A3A3A590000000000000000E8608900593A
        B800000000000000000000000000000000000000000000006724242424242424
        24242424240E00000000000000000000000000AD61F1B37B232323232323231D
        00000000000000000000000000000000001D230F0A0000000000000000000000
        0000000000000000000000000000009F7907713A27001DB625075A3000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000006361910000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000005F818359000000000000000000000000000000000000
        00000000009A43D0410400000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000010481F003395959595959595959595959533
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000007081835900000000000000000000000000000000000003143200
        0032141414141414141414141417000000000000000000000000000000000000
        0000009106F16F0000000000384F287600000000000000000000000000000000
        0000000000000000000000000000000000000000D76666DA076A666666666666
        665D3C1700000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000C105
        82000000000000000000000000000000000000000000000000D9922700000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000017F8FFFFF80000000000000000000000
        0000000000004D0B0B0B0B0B0B0B0B0B0B0B0B4D000000000000000000000000
        AEC2310000000000000000000000000000000000000000000000C10577000000
        00000000000000000000000000000000DD5CD90000C05C5C5C5C5C5C5C5C5C5C
        5CE1000000000000000000000000000000000000000000C33A1D000000000000
        00045E7E0000000000000000000000000069C2C2C2C2C2C2C2C2C2C2C22E0000
        000000000000009A3B0707070707070707070707070705FA0000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000007A07743300000000000000000000
        00000000000000000000000000267C0000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00006B8B5840130B1ECBC917000000000000000000000000000048F5430690CE
        DEDEDEDEDEDEDE6700000000000000000000000052095A6E470D080000000000
        00000000000000000000000000007A0774330000000000000000000000000000
        000000004D218C00004B21212121212121212121212900000000000000000000
        00000000000000000000000000000000000000000000007B0000000000000000
        0000000000BA0107070707070707070707290000000000000000007F8D8D8D8C
        07F58D8D8D8D8D8D624E07F90000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000677507ABC946464646464646461C000000000000000000000000
        0045AA0200000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000002EA60706A79090340109AB
        33000000000000000000000000009A5A7156F704000000000000000000000000
        00000000000000006798160105A5F02E02000000000000000000000000000000
        0000679907ABC946464646464646461C00000000000000000F852D0000858585
        8585858585858585857B00000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000D2762871DE574E
        4E4E4E4E4EC3000000000000000000000000008F018900000000000000440737
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000AAC28070707
        0707070707070797000000000000000000000000008C05DC731C1C1C1C1C1C1C
        1C33000000000000000000000000000000000000000000000000000000000000
        00000000000000000DD4077E562DF7F7B5623405FA0800000000000000000000
        0000F407E80000000000000000000000000000000000000000000000000F1B4F
        600607EE55691C0300000000000000000000000000000AAC2807070707070707
        070707B4000000000000000000000000000300000000000000000000080D0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000706A364C390A0000000000000000000000000000
        00000000000000B862EC00000000000000272F9D000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000F3A543F3F3F3F3F3F3F3F3F8400000000
        000000000000000000A90107405A5A5A5A5A5A5A5AE100000000000000000000
        000000000000000000000000000000000000000000000000000000009A05602B
        0000000000043A288170000000000000000000000000D507E608000000000000
        00000000000000000000000000000000000000002D4C57340105425DCC080000
        00000000000000000000000F3A543F3F3F3F3F3F3F3F3F840000000000000000
        00000000006C3300000000000000001A6C910000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        E909820400000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000F0F0F0F0F0F0F0F0F0A0000000000000000000000000000AC7E
        602A2A2A2A2A2A2A2A8900000000000000000000000000000000000000000000
        000000000000000000000000000000009707F2000000000000001F92134D0000
        00000000000000000000C37EEA0E000000000000000000000000000000000000
        000000000000000000000FB362C8160735180000000000000000000000000000
        00000F0F0F0F0F0F0F0F0F0A0000000000000000000000000026A37300000000
        000073D605290000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000FC0674020000000000000000
        000000000000000000000000000000D7A4A4A4A4A4A4A4A4A4A4A4E300000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000323217000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000A416F5050505050505050590000
        0000000000000000000000000000000000000000000000000000000000000000
        000000006307290000000000000000BC07520000000000000000000000001D41
        04310D00000312C969310000000000000000000000000000000000000000086B
        CDFE260707180000000000000000000000000000000000000000000000000000
        000000000000000000000000007E07656C1A00001A8B6507257F000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000001F572F1F0000000000000000000000000000000000000000
        000000F221070707070707070707073700000000000000000000000000000000
        000000000000000000000000000000000000000000000000009B6CA4A5A6A566
        6917000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000008907F40000000000
        0000863716CA00000000000000000000000000338BA69F00036E0C130B587300
        0000000000000000000000000000000031956EA60B0721986204000000000000
        000008303030303030303030303030303030309A000000000000000000000000
        00384F2813A373126A05284F3800000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000001F0A00
        0000000000000000000000000000000000000000000000DD74287D2F8DB9B9B9
        B9B9B95E00000000000000000000000000000000000000000000000000000000
        000000000000000000000000CD420507070707070B551C000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000003295DC6E6E
        DC69310000000000000000000000000000000000000000000000000000000000
        0000000000000000000000008A0626CD00000000000DDC09921F000000000000
        00000000000002D90507B400ED05347D9007C602000000000000000000000000
        001712DCA6130728B72F5B10040000000000000000000E050505050505050505
        050505050505059700000000000000000000000000001D5EB707650C07B75E1D
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000D4433A0E0400000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000009F
        61017DB94515E52F4B07D9020000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000CDA60907070707095CC90800000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0EEF07265D951212C2A30916D8000000000000000000000000009F0B36BF3908
        F907A90E7F3626DD0000000000000000000000008E58130715FD2F680F040000
        000000000000000000000857575757577507347DAF4F57CE017688A900000000
        0000000000000000000000089A76070737AE0800000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000015
        3B0D000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000018D907BD0F003B150000BE9905C1
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00332601254F9D9DAFB70113AD00000000000000000000000000000000000000
        0000000000000000000000000000000000000000001054160707070707073662
        0A00000000000000000000000000E207C400005F3B4500000EB1074D00000000
        00000000000000005228FD64E523000000000000000000000000000000000000
        0000088043A085000000001F2F065D0800000000000000000000000000000230
        190171600742C902000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000002545F300000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000008661754800003B15000000C407EB000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000008001F17B00000000234F01
        7902000000000000000000000000000000000000000000000000000000000000
        000000000000000000001D5E549825B73FAF5B00000000000000000000000000
        000082077A0000C743B1000008B1064D0000000000000000000000008A5E7B00
        031A311A170000000000000000000000000000000000AE79BA48000000000000
        0AA0139F0000000000000000000000000073A305114F386F4E2813AB2E030000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000005E4C3800001732170800000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000440737000000
        3B15000000E90782000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000074A259000000000000277E05CF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000FF7230A000000000000000000000000000000000077077A0000E615D50000
        AEB0BA8A00000000000000000000000000001A69D3A8C06AD16C1C0300000000
        000000000000000000007A09770400000000000000B407970000000000000000
        0000000000790725B61D00000F4C25075AC70000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000003169E3
        55A8555D69020000000000000000000000000000000000000000000000000000
        00000000000000000000000000004445B03300003B1500000091077C00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000267C04
        0000000000000063072900000000000000000000000000000000000000000000
        0000000000000000000000000000000008121212121212121212121212330000
        00000000000000000000D507E20300DB07E700038009BD0E0000000000000000
        00000000002EA30B07282128010542AD0800000000000000000000000000C115
        AA02000000000000009E072900000000000000000000000000754F3800000000
        0000384F16290000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000009A6A0B07070707070B552E0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000278C058003003B15000033C6078900000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000458208000000000000008F07290000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000180C0C0C0C0C0C0C0C0C0C0C0C520000000000000000000000008407
        653C128107AD47E32645520000000000000000000000000033D607602F5E5E5E
        4AC80165730000000000000000000000000048990BAD080000000000CC2606E4
        000000000000000000000000005E1D00000000000000001D3AD8000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000AE42017E2F75074AAF60076A3300000000000000000000000000000000
        0000000000000000000000000000000000000000000000A9160CDC123B150073
        5509994800000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000008C3B1C00000000000031B0437F0000000000000000000000000000
        0000000000000000000000000000000000000000000000000E7D750728F65151
        51515151517F0000000000000000000000008A960713260707260B09070558AE
        000000000000000000000000C71360BE0400000000415707F400000000000000
        00000000000004EF150C5D47FFFF47E36107BD04000000000000000000000000
        000000000000000000000000041D000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000EB07A0380437074404
        6F6009E100000000000000000000000000000000000000000000000000000000
        00000000000000000000000E4C34090B071500B407343A040000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000084075878000000
        03FFD407BB0E0000000000000000000000000000000000000000000000000000
        00000000000000000000000000ED434E5B59101010101010100E000000000000
        00000000000000E464B7CECECECECECEF6A7014D000000000000000000000000
        F407EA04000000000000E445610E00000000000000000000000000105428090B
        0B0B0B09064E1F00000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000007945EC000037074400008407C60000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0450AFDECE9000EC57B304000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000004A20735A55555A53507A7E400000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        700BBB1F000000000000000000000000000000000000000000000000040E0E0E
        0E0E0E0E232D568A000000000000000000000000BC0752000000000000000076
        07180000000000000000000000000000041B64CE90F6B74E1B1D000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000015
        3B00000037074400008A07370000000000000000000000000000000000000000
        00000000000000000000000000000000000000030000000023F700000000000D
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00006F543406060606343F5B0000000000000000000000000000000000000000
        0000000000000000000000000000000000000000E607E7000000000000000000
        00000000000000000000000000000000000003021A1A17080000000000000000
        0000000000000000E007E900000000000000863B160E00000000000000000000
        000000000000000FF7F70A000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000453B3300003707440000AE0737
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000AD2E00000000000000000DCDE6000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000050564A4A56B30F00
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000630797000000000000000000000000000000000000000000
        000000000249E3A3A5A5D16C1C030000C9CC020000000000000000008907745F
        00000000000DE2158C0400000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000008C058003003707440000FB07D5000000000000000000000000
        0000000000000000000000000000000000000000000000000000007C42690D00
        000000005F5D3582000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000D32323232323232323232320D00000000000000000000
        000000000000000000000000000000000000000000000000000000008907DA93
        17000000000000000000000000000000000000000000001CAB35072811210109
        423C0D00BC0BFE0D0000000000000000488309D4CC9B6B6B12E30B28A9000000
        00000000000000000000006C5D5D5D5D5D5D5D5D5D5D5DC70000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000C316616C73
        B00744316C0B16A9000000000000000000000000000000000000000000000000
        000000000000000000000000000000C406356E1C000003CDC0094B4C00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000EDA8A8
        A8A8A8A8A8A8A8A8A8CF00000000000000000000000000000000000000000000
        0000000000000000000000000000000059360979556D6D6D6D6D6D6D6DDF0000
        0000000000000000000086D40971AFB61B5E4A7D2835D700D83605AD00000000
        0000000000A9A2070C7942420C0928AC0E000000000000000000000000000092
        2807070707070707070707B40000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000E4A340561050744E905064F1D00000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000104A4B09A6696B5D26063F5B0A00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000E71107070707070707070707290000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000484600107070707070707070752000000000000000000000000AD09
        71BE04000000000FD006F9860AEA0777000000000000000000045064FDA721A7
        F63F3A27000000000000000000000000000000E8B0947D249D6262626262627F
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000E5354B72A21448A984C270000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000ABE57060BA609A7
        6210000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000059DA34AFB9565656565656562B0000000000000000000000000000
        00000000000000000000000000000000000000000000000000046F568D3E3E3E
        3E3E3E3E3E48000000000000000000000000F407890400000000000059830BDD
        0059078100000000000000000000001D3850B350481F04000000000000000000
        0000000000005FC04BB80F040000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000A1F386F0E00
        1F04000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000086C60707437A040000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000D716B804000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000077077A0000000000000000B1074D001807760000000017141700
        0D141414141414141414141414000000000000000000000000007A0777040000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0312A5092125010C6C1A00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000DA820E00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000C407E2080000
        00000000AE81756700DF079200000000E61EE600521E1E1E1E1E1E1E1E1E1E1E
        1E180000000000000000000000007F1181700000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000338B0C01981B232F3405A3120D
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0043820300000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000067A261CD020000000331FE07BD0E02AB07C4
        0000000089908900529090909090909090909090900E00000000000000000000
        00000E9DB910025F78781C330300000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000EB0934AC4100000453C8150C80000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000B065CC311A1A1A1A1A1A1A
        1A0D000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000033E2430B558BC93C5D580945FB8BA3094B2B00000000232D23000F2D2D2D
        2D2D2D2D2D2D2D2D2D00000000000000000000000000000002C9A32C404019A5
        6C5F000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000007C985E0A00
        00000000412FA782000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000D0070C586A6A6A6A6A6A6A6ACF00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000004D130907070707070707
        0707070706715E00000000000000000000000000000000000000000000000000
        000000000000000000000033661306A707064B2809A51C000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000B83800000000000000000A5ED200000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000FC807
        0728212121212121218900000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000486464646464646464646464649D3A6F000000000000
        00000000000000000000000000000000000000000000000000000000000000E2
        054B4CB807372B3A2507D6000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000F00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000D744B2F5E53535353535353480000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000008EB2B2B2B2B2B2B2
        B2B2B2B2B20E000000000000000000000000708116A9044407370000E436058E
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000CD8787878787878787
        8787878787878787DF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000ED36BE040000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000D14320D0000000000
        0000000000000000000000005221010707070707070707070718000000000000
        000000000000C105BC1800440737000000BD0729000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000007C0909090909090909090909090909090991000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000DA820400000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000001AC2A458EE5C5820A1000000000000000000000000000000
        869E4398AF8D56565656565656040000000000000000000000007A0777000044
        0737000000B407B4000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000D8
        E0072A4E3E8D3E7D1107BB4E4E4E4E4E7F000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000043820300000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000001C6A090115
        071506070C8B0D000000000000000000000000008005EF1D0000000000000000
        00000000000000000000000000007F167402004407370000089E072900000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000CD267E50000000000AB6365870
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00BA26CC311A1A1A1A1A1A1A1A0D000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000033C6077E4AF507D5E554160BD70000000000
        0000000000000000BC07C1000000000000000000000000000000000000000000
        00001F920580174407370003F326066700000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000002DA457F00000000000004C407E6000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000D0070BA658585858585858
        58CF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000C705832B0063078F000AD0017402000000000000000000000000EF06E203
        0000000000000000000000000000000000000000000000A9360BAB6C07370080
        1907570000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000004409370E0000
        0000000000E90782000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000001F7D2A9494949494949494948900000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000009E0789000063078F0000
        8ABA26DD000000000000000000000000484AE417030000000031170000000000
        00000000000000000000000AB6250607073700D5067D38000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000004415B07000000000000000E607BD00000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000002350
        5353535353535353538A00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000077077A000063078F000004B1074D0000000000000000
        0000000000318BA3B2C9030086C6AB7308000000000000000000000000000000
        00383AAF4E4F007F4C1000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000279209FB0D0000000000738106FC00000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000D507
        E1000063078F000002F9154D00000000000000000000000033D60907070B8000
        CA36075A8E000000000000000000000000000000000000001D0F000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000840613ABC9FFFF478B
        4207A01F00000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000FC01745F0063078F0000AD0BBA59
        000000000000000000000000CF099656A0078102275E96079E00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000001D4A34070505050509067D48000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000001FA00758C29E078F0D870C07AC00000000000000000000000000
        F40784006F1505CF0000B816650E000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00502F3FFDFDB754560F00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000003857280707
        078F869906571000000000000000000000000000BC07520000BA07EB00000A76
        0718000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000023F71D0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000F5664DEB7E70ED04A0F000000000000
        0000000000000000E007E900008F078103001876151800000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000005F93939393939393939393935F000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000A230F000000000000000000000000000000000000E7076A93
        03C307269F00F343C50E00000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000009E19191919
        191919191919199E000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000674B07DA8627BA076A6CC007D2000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000D2BA0728A7F6717171717171F200000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000004D87EA027044C16070706A010000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000003ED61C8B650483838383838381000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000004412B00001D5E
        24884C1000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000086619948000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000A1D04000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000004406B033000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000027A0
        9652000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000002D390000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000000000000000000000000000000000000000000000}
    end
    object Label3: TLabel
      Left = 964
      Top = 488
      Width = 233
      Height = 20
      Caption = '^^^^^^^^^^^Incorrect^^^^^^^^^'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Lmessages: TLabel
      Left = 408
      Top = 72
      Width = 171
      Height = 25
      Caption = 'Messages rejet'#233's'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LNb_msg: TLabel
      Left = 152
      Top = 488
      Width = 150
      Height = 26
      AutoSize = False
      Caption = '0 messages affich'#233's'
    end
    object Lnb_pouvoirs_confies: TLabel
      Left = 16
      Top = 16
      Width = 3
      Height = 13
    end
    object Inombres: TImage
      Left = 792
      Top = 24
      Width = 32
      Height = 80
      AutoSize = True
      Picture.Data = {
        07544269746D6170361E0000424D361E00000000000036000000280000002000
        0000500000000100180000000000001E00000000000000000000000000000000
        0000FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFF000000FFFFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
        000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF000000FFFFFFFFFF
        FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
        C0C0FFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C0FFFFFFFF
        FFFF}
    end
    object LCompte_resultats: TLabel
      Left = 686
      Top = 32
      Width = 104
      Height = 13
      Caption = 'Compt'#233' dans r'#233'sultats'
    end
    object LCompte_partiellement: TLabel
      Left = 692
      Top = 56
      Width = 98
      Height = 13
      Caption = 'Compt'#233' partiellement'
    end
    object Lcompte_rejetes: TLabel
      Left = 694
      Top = 80
      Width = 96
      Height = 13
      Caption = 'Compt'#233' dans rejet'#233's'
    end
    object Linfo_moins1: TLabel
      Left = 464
      Top = 488
      Width = 375
      Height = 13
      Caption = 
        'Lorsque le nombre de voix n'#39'est pas indiqu'#233' dans le message,  il' +
        ' est affich'#233' "-1"'
    end
    object Linfo_pv: TLabel
      Left = 348
      Top = 504
      Width = 491
      Height = 13
      Caption = 
        'Le nombre indiqu'#233' dans la colonne "voix" indique le nombre pouvo' +
        'irs confi'#233's plus la voix de la personne'
    end
    object Lnb_mess_ph: TLabel
      Left = 16
      Top = 520
      Width = 66
      Height = 13
      Caption = 'Lnb_mess_ph'
      Visible = False
    end
    object StringGrid1: TStringGrid
      Left = 152
      Top = 112
      Width = 1064
      Height = 369
      ColCount = 15
      FixedCols = 0
      RowCount = 1000
      FixedRows = 0
      ScrollBars = ssVertical
      TabOrder = 0
      OnMouseDown = StringGrid1MouseDown
    end
    object Pchoix_msg: TPanel
      Left = 8
      Top = 112
      Width = 145
      Height = 393
      BevelOuter = bvNone
      TabOrder = 1
      object LRejetes: TLabel
        Left = 24
        Top = 12
        Width = 73
        Height = 25
        Caption = 'Rejet'#233's'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        OnClick = LRejetesClick
        OnMouseUp = LRejetesMouseUp
      end
      object LTous_msg: TLabel
        Left = 8
        Top = 48
        Width = 137
        Height = 16
        Caption = 'Tous les messages'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = LTous_msgClick
      end
      object ButtonA: TButton
        Left = 8
        Top = 88
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'A'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = ButtonAClick
      end
      object Button4: TButton
        Left = 40
        Top = 88
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'B'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = ButtonAClick
      end
      object Button5: TButton
        Left = 72
        Top = 88
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'C'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = ButtonAClick
      end
      object Button7: TButton
        Left = 104
        Top = 88
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 17
        OnClick = ButtonAClick
      end
      object Button8: TButton
        Left = 8
        Top = 120
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'E'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 18
        OnClick = ButtonAClick
      end
      object Button9: TButton
        Left = 40
        Top = 120
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'F'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 19
        OnClick = ButtonAClick
      end
      object Button10: TButton
        Left = 72
        Top = 120
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'G'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 20
        OnClick = ButtonAClick
      end
      object Button11: TButton
        Left = 104
        Top = 120
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'H'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 21
        OnClick = ButtonAClick
      end
      object Button12: TButton
        Left = 8
        Top = 152
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'I'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 22
        OnClick = ButtonAClick
      end
      object Button13: TButton
        Left = 40
        Top = 152
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'J'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 23
        OnClick = ButtonAClick
      end
      object Button14: TButton
        Left = 72
        Top = 152
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'K'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 24
        OnClick = ButtonAClick
      end
      object Button15: TButton
        Left = 104
        Top = 152
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'L'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 25
        OnClick = ButtonAClick
      end
      object Button24: TButton
        Left = 8
        Top = 184
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'M'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        OnClick = ButtonAClick
      end
      object Button25: TButton
        Left = 40
        Top = 184
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        OnClick = ButtonAClick
      end
      object Button26: TButton
        Left = 72
        Top = 184
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        OnClick = ButtonAClick
      end
      object Button27: TButton
        Left = 104
        Top = 184
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        OnClick = ButtonAClick
      end
      object Button20: TButton
        Left = 8
        Top = 216
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'Q'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = ButtonAClick
      end
      object Button21: TButton
        Left = 40
        Top = 216
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        OnClick = ButtonAClick
      end
      object Button22: TButton
        Left = 72
        Top = 216
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'S'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        OnClick = ButtonAClick
      end
      object Button23: TButton
        Left = 104
        Top = 216
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'T'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        OnClick = ButtonAClick
      end
      object Button16: TButton
        Left = 8
        Top = 248
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'U'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = ButtonAClick
      end
      object Button17: TButton
        Left = 40
        Top = 248
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'V'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 26
        OnClick = ButtonAClick
      end
      object Button18: TButton
        Left = 72
        Top = 248
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'W'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = ButtonAClick
      end
      object Button19: TButton
        Left = 104
        Top = 248
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = ButtonAClick
      end
      object Button28: TButton
        Left = 40
        Top = 280
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'Y'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        OnClick = ButtonAClick
      end
      object Button29: TButton
        Left = 72
        Top = 280
        Width = 25
        Height = 25
        Hint = 'messages dont le nom de l'#39'exp'#233'diteur commence par cette lettre'
        Caption = 'Z'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        OnClick = ButtonAClick
      end
      object Efiltre: TEdit
        Left = 8
        Top = 320
        Width = 121
        Height = 28
        Hint = 
          'filtre des messages: messages dont le nom de l'#39'exp'#233'diteur commen' +
          'ce par:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnChange = EfiltreChange
      end
      object Rrejetes: TRadioButton
        Left = 0
        Top = 16
        Width = 10
        Height = 17
        Checked = True
        TabOrder = 27
        TabStop = True
        OnClick = RrejetesClick
      end
      object Rtousmsg: TRadioButton
        Left = 0
        Top = 48
        Width = 10
        Height = 17
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 28
        OnClick = RtousmsgClick
      end
      object Rvotes_multiples: TRadioButton
        Left = 0
        Top = 368
        Width = 137
        Height = 17
        Caption = 'Votes multiples'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 29
        OnClick = Rvotes_multiplesClick
      end
    end
    object Pmasque_totaux: TPanel
      Left = 860
      Top = 484
      Width = 80
      Height = 52
      BevelOuter = bvNone
      TabOrder = 2
      object Ltotaux: TLabel
        Left = 15
        Top = 28
        Width = 48
        Height = 16
        Hint = 
          'indique des valaurs max que les prises en compte des rejets aura' +
          'ient chang'#233'es'
        Caption = 'Totaux'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Erjpour: TEdit
        Left = 0
        Top = 4
        Width = 28
        Height = 21
        Hint = 
          'prend en compte  le contexte  (pouvoirs  , message  plus r'#233'cent ' +
          'etc ..)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '7'
      end
      object Erjcontre: TEdit
        Left = 28
        Top = 4
        Width = 24
        Height = 21
        Hint = 
          'prend en compte  le contexte  (pouvoirs  , message  plus r'#233'cent ' +
          'etc ..)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = '6'
      end
      object Erjabs: TEdit
        Left = 52
        Top = 4
        Width = 24
        Height = 21
        Hint = 
          'prend en compte  le contexte  (pouvoirs  , message  plus r'#233'cent ' +
          'etc ..)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Text = '1'
      end
    end
    object Ptous_msg: TPanel
      Left = 16
      Top = 16
      Width = 657
      Height = 89
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Visible = False
      object Ltous_mess: TLabel
        Left = 384
        Top = 56
        Width = 200
        Height = 25
        AutoSize = False
        Caption = 'Messages'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Cbvnreconnus: TCheckBox
        Left = 136
        Top = 60
        Width = 169
        Height = 17
        Caption = 'Votes non reconnus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = CbvnreconnusClick
      end
      object RVoix_dispo: TRadioButton
        Left = 536
        Top = 16
        Width = 121
        Height = 17
        Caption = 'Voix disponibles'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        OnClick = RVoix_dispoClick
      end
      object RVoix_utilisees: TRadioButton
        Left = 536
        Top = 36
        Width = 113
        Height = 17
        Caption = 'Voix_utilis'#233'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = RVoix_dispoClick
      end
    end
    object Cb_enr_aff: TCheckBox
      Left = 1056
      Top = 516
      Width = 169
      Height = 17
      Caption = 'Enregistrement de l'#39'afffichage'
      TabOrder = 4
      OnClick = Cb_enr_affClick
    end
  end
  object Pinformations: TPanel
    Left = 16
    Top = 172
    Width = 97
    Height = 57
    BevelWidth = 3
    TabOrder = 6
    OnClick = LinformationClick
    object Linformation: TLabel
      Left = 8
      Top = 8
      Width = 13
      Height = 25
      Caption = '?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LinformationClick
    end
    object LUtilisation: TLabel
      Left = 28
      Top = 20
      Width = 45
      Height = 13
      Caption = 'Utilisation'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      OnClick = LinformationClick
    end
  end
  object Ppouvoirs: TPanel
    Left = 112
    Top = 172
    Width = 301
    Height = 57
    BevelWidth = 3
    TabOrder = 5
    object Lfichier_pouvoirs: TLabel
      Left = 16
      Top = 32
      Width = 3
      Height = 13
    end
    object Cbpouvoirs: TCheckBox
      Left = 16
      Top = 8
      Width = 153
      Height = 17
      Caption = 'Pouvoirs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = CbpouvoirsClick
    end
    object cb_votes_lim: TCheckBox
      Left = 188
      Top = 8
      Width = 105
      Height = 41
      Caption = 'Vote limit'#233' aux participants inscrits'
      Checked = True
      Color = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      State = cbChecked
      TabOrder = 1
      WordWrap = True
      OnClick = cb_votes_limClick
    end
  end
  object Pdebug: TPanel
    Left = 456
    Top = 288
    Width = 380
    Height = 280
    Hint = 'Affichage de lvotes'
    BorderWidth = 3
    BorderStyle = bsSingle
    TabOrder = 4
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
    object Pifl_ext: TPanel
      Left = 350
      Top = 250
      Width = 25
      Height = 25
      TabOrder = 2
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
    object Btst_pres: TButton
      Tag = 1
      Left = 24
      Top = 0
      Width = 57
      Height = 17
      Hint = 'exemple de messages rejet'#233's'
      Caption = 'tst_pres1'
      TabOrder = 0
      OnClick = Btst_presClick
    end
    object Button3: TButton
      Tag = 2
      Left = 80
      Top = 0
      Width = 57
      Height = 17
      Hint = 'exemple messages rejet'#233's pour la lettre "M"'
      Caption = 'tst_pres2'
      TabOrder = 1
      OnClick = Btst_presClick
    end
    object Mtest: TMemo
      Left = 136
      Top = 0
      Width = 241
      Height = 121
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 3
    end
    object Btst_fic_msg: TButton
      Left = 24
      Top = 16
      Width = 113
      Height = 17
      Hint = 
        'selectionne le dernier fichier  des message zoom dans le r'#233'perto' +
        'ire standard'
      Caption = 'Btst_fic_msg'
      TabOrder = 4
      OnClick = Btst_fic_msgClick
    end
    object Bch_msg: TButton
      Left = 0
      Top = 32
      Width = 65
      Height = 17
      Hint = 'charge le fichier des messages zoom'
      Caption = 'Bch_msg'
      TabOrder = 5
      OnClick = Bch_msgClick
    end
    object Baff_lmsg: TButton
      Left = 64
      Top = 32
      Width = 73
      Height = 17
      Hint = 'affiche les messages  charg'#233's'
      Caption = 'Baff_lmsg'
      TabOrder = 6
      OnClick = Baff_lmsgClick
    end
    object Benr_lmsg: TButton
      Left = 0
      Top = 48
      Width = 65
      Height = 17
      Hint = 'enregistre lmessages dans .\tests\lmessages.txt'
      Caption = 'Benr_lmsg'
      TabOrder = 7
      OnClick = Benr_lmsgClick
    end
    object Bcree_lvote: TButton
      Left = 64
      Top = 48
      Width = 73
      Height = 17
      Hint = 's'#233'lection des messages selon plage horaire -> lvotes'
      Caption = 'Bcree_lvote'
      TabOrder = 8
      OnClick = Bcree_lvoteClick
    end
    object BAff_lvote: TButton
      Left = -8
      Top = 64
      Width = 73
      Height = 17
      Hint = 'affichage lvotes'
      Caption = 'BAff_lvote'
      TabOrder = 9
      OnClick = BAff_lvoteClick
    end
    object BAff_lparticipants: TButton
      Left = 64
      Top = 64
      Width = 73
      Height = 17
      Hint = 'affichage lparticpants'
      Caption = 'Aff_lparticipant'
      TabOrder = 10
      OnClick = BAff_lparticipantsClick
    end
    object Binfo: TButton
      Left = 272
      Top = 256
      Width = 75
      Height = 17
      Caption = 'Binfo'
      TabOrder = 11
      OnClick = BinfoClick
    end
    object Baff_messages: TButton
      Left = 0
      Top = 80
      Width = 65
      Height = 17
      Hint = 'Affichage pr'#233'vu pour les messages (toutes les colonnes)'
      Caption = 'Aff_messages'
      TabOrder = 12
      OnClick = Baff_messagesClick
    end
    object Bvidelistes: TButton
      Left = 64
      Top = 80
      Width = 73
      Height = 17
      Caption = 'Bvidelistes'
      TabOrder = 13
      OnClick = BvidelistesClick
    end
    object Bsel_strggd: TButton
      Left = 0
      Top = 264
      Width = 57
      Height = 17
      Caption = 'Bsel_strggd'
      TabOrder = 14
      OnClick = Bsel_strggdClick
    end
    object Bfcolor: TButton
      Left = 56
      Top = 264
      Width = 49
      Height = 17
      Caption = 'Bfcolor'
      TabOrder = 15
      OnClick = BfcolorClick
    end
    object Btest: TButton
      Left = 104
      Top = 264
      Width = 49
      Height = 17
      Caption = 'Btest'
      TabOrder = 16
      OnClick = BtestClick
    end
    object BExport_CSV_lparticpants: TButton
      Left = 0
      Top = 96
      Width = 137
      Height = 17
      Caption = 'BExport_CSV_lparticpants'
      TabOrder = 17
      OnClick = BExport_CSV_lparticpantsClick
    end
    object Beff_tmessages: TButton
      Left = -8
      Top = 112
      Width = 145
      Height = 17
      Caption = 'Beff_tmessages'
      TabOrder = 18
      OnClick = Beff_tmessagesClick
    end
    object Etests: TEdit
      Left = 8
      Top = 176
      Width = 105
      Height = 21
      TabOrder = 19
      Text = 'Etests'
      OnChange = EtestsChange
    end
    object Benregistremt_stringgrid: TButton
      Left = 0
      Top = 128
      Width = 137
      Height = 17
      Caption = 'Benregistremt_stringgrid'
      TabOrder = 20
      OnClick = Benregistremt_stringgridClick
    end
    object enregistrement_merge: TCheckBox
      Left = 0
      Top = 144
      Width = 137
      Height = 17
      Caption = 'enregistrement_merge'
      TabOrder = 21
      OnClick = enregistrement_mergeClick
    end
    object Brepli: TButton
      Left = 344
      Top = 232
      Width = 33
      Height = 17
      Caption = 'Repli'
      TabOrder = 22
      OnClick = BrepliClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 360
    Top = 152
  end
end

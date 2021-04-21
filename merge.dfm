object Fmerge: TFmerge
  Left = 410
  Top = 209
  Width = 1280
  Height = 768
  Caption = 'Analyse des votes par Zoom: merge des fichiers de message'
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
  object Lfic_local: TLabel
    Left = 24
    Top = 40
    Width = 188
    Height = 13
    Caption = 'Fichier local des messages Zoom'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lfic_scnd_pc: TLabel
    Left = 24
    Top = 120
    Width = 283
    Height = 13
    Caption = 'Fichier des messages Zoom venant du second PC'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lmergeOK: TLabel
    Left = 24
    Top = 216
    Width = 308
    Height = 25
    Caption = 'Les fichiers de merge sont pr'#234'ts'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Efic_local: TEdit
    Left = 24
    Top = 64
    Width = 937
    Height = 21
    TabOrder = 0
    OnChange = Efic_localChange
  end
  object Bselectfic_local: TButton
    Left = 973
    Top = 64
    Width = 20
    Height = 17
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Bselectfic_localClick
  end
  object Efic_scnd_pc: TEdit
    Left = 24
    Top = 144
    Width = 937
    Height = 21
    TabOrder = 2
    OnChange = Efic_localChange
  end
  object Bselectfic_scnd_pc: TButton
    Left = 973
    Top = 144
    Width = 20
    Height = 17
    Caption = '...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Bselectfic_scnd_pcClick
  end
  object Pdebug: TPanel
    Left = 1008
    Top = 0
    Width = 249
    Height = 721
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
    object Mtest: TMemo
      Left = 0
      Top = 72
      Width = 241
      Height = 641
      Lines.Strings = (
        'E:\GitHub\Analyse_vote_zoom\cas_tests\5\n5_a.txt'
        'E:\GitHub\Analyse_vote_zoom\cas_tests\5\n5_b.txt')
      ScrollBars = ssBoth
      TabOrder = 1
    end
    object Pifl_ext: TPanel
      Left = 220
      Top = 690
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
    object Btest_merge: TButton
      Left = 0
      Top = 24
      Width = 75
      Height = 17
      Caption = 'Btest_merge'
      TabOrder = 2
      OnClick = Btest_mergeClick
    end
    object Eheure: TEdit
      Left = 72
      Top = 24
      Width = 57
      Height = 17
      TabOrder = 3
      Text = '12:00:00'
    end
    object Bmemo2fics: TButton
      Left = 24
      Top = 0
      Width = 75
      Height = 17
      Caption = 'Bmemo2fics'
      TabOrder = 4
      OnClick = Bmemo2ficsClick
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 1160
    Top = 16
  end
end

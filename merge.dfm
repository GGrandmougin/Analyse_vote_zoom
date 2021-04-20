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
  object OpenDialog1: TOpenDialog
    Left = 1160
    Top = 16
  end
end

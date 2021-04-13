object Finformation: TFinformation
  Left = 462
  Top = 194
  Width = 1279
  Height = 767
  Caption = 'Vote par Zoom   Information'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Istructure: TImage
    Left = 0
    Top = 0
    Width = 936
    Height = 690
    AutoSize = True
    Visible = False
  end
  object Lcreateur: TLabel
    Left = 944
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Cr'#233'ateur:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lprnm: TLabel
    Left = 944
    Top = 24
    Width = 39
    Height = 13
    Caption = 'G'#233'rard'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Lnom: TLabel
    Left = 944
    Top = 40
    Width = 75
    Height = 13
    Caption = 'Grandmougin'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object RichEdit1: TRichEdit
    Left = 16
    Top = 8
    Width = 761
    Height = 649
    TabOrder = 0
  end
  object P_debug: TPanel
    Left = 1032
    Top = 0
    Width = 233
    Height = 729
    TabOrder = 1
    Visible = False
    object Bstructure: TButton
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Structure'
      TabOrder = 0
      OnClick = BstructureClick
    end
  end
end

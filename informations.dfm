object Finformation: TFinformation
  Left = 462
  Top = 194
  Width = 1279
  Height = 767
  Caption = 'Analyse des votes par Zoom   Information'
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
    Lines.Strings = (
      
        '#####1\fbidis\ansi\ansicpg1252\deff0\deftab709{\fonttbl{\f0\from' +
        'an\fprq2\fcharset0 Liberation Serif;}{\f1\fswiss\fprq2\fcharset0' +
        ' Liberation Sans;}{\f2'
      '\froman\fprq2\fcharset128 Liberation Serif;}}'
      
        '\viewkind4\uc1\pard\ltrpar\keepn\hyphpar0\sb240\sa120\lang1036\f' +
        '0\fs24  \u8203?\tab\kerning1\f1\fs26 Le \f2 logiciel\f1  prend p' +
        'ar d\'#39'e9faut le dernier '
      
        'fichier g\'#39'e9n\'#39'e9r\'#39'e9 par  l'#39'application Zoom (dans l'#39'applicat' +
        'ion pour Windows, en bas \'#39'e0 droite du panneau des message, cli' +
        'quer sur "Fichier" puis sur "Votre '
      'ordinateur" pour obtenir le fichier des messages) \b\fs36 '
      
        '\par \kerning0\b0\f0\fs24  \u8203?\tab\kerning1\b\f1\fs36 protoc' +
        'ole'
      
        '\par \pard\ltrpar\hyphpar0\sa140\sl276\slmult1\b0\f0\fs24    Le ' +
        'membre doit indiquer comme nom dans ZOOM un texte comportant au ' +
        'moins son pr\'#39'e9nom, '
      
        'son nom, son N\'#39'b0 de membre et les 3 lettres de sa r\'#39'e9gion. L' +
        #39'ordre , la casse et l'#39'accentuation sont indiff\'#39'e9rents  '
      
        '\par    Un message est pris en compte uniquement s\rquote il com' +
        'porte:'
      
        '\par \pard\ltrpar\hyphpar0\fi-360\li1140\sa140\sl276\slmult1\ker' +
        'ning0\u61623?\tab\kerning1 un et un seul groupe de lettres conti' +
        'gu\'#39'ebs formant un des 4 '
      
        'mots "pour" , "contre" , "abs" ou "abstention" peu importe la ca' +
        'sse'
      
        '\par \kerning0\u61623?\tab\kerning1  un groupe au maximum de chi' +
        'ffres contigus (indiquant le nombre de voix)( si le groupe de ch' +
        'iffres est absent, cela vaut '
      
        'pour 1)  ("0" , "00"  sont admis indiquant 0 voix pour ce choix,' +
        ' utile pour une correction)'
      
        '\par \kerning0\u61623?\tab\kerning1 l'#39'ordre est de ces groupes e' +
        'st indiff\'#39'e9rent'
      
        '\par \kerning0\u61623?\tab\kerning1 la pr\'#39'e9sence de caract\'#39'e8' +
        'res autres que des lettres ou chiffres est admise et ces caract\' +
        #39'e8res sont ignor\'#39'e9s  '
      '(exemples valides "Pour: 10." , "10 POUR" , "5 -> contre")'
      
        '\par \pard\ltrpar\hyphpar0\sa140\sl276\slmult1    Le membre peut' +
        ' envoyer un nombre quelconque de messages valides, seul comptera' +
        '  le dernier message '
      'pour un choix donn\'#39'e9 (pour, contre ou abstention)'
      
        '\par    Dans le cas ou un membre envoie plus de voix que le nomb' +
        're de pouvoirs qu'#39'il poss\'#39'e8de:'
      
        '\par \pard\ltrpar\hyphpar0\fi-360\li1200\sa140\sl276\slmult1\ker' +
        'ning0\u61623?\tab\kerning1 s'#39'il n'#39'exprime qu'#39'un seul choix , le ' +
        'nombre de voix est limit\'#39'e9 au '
      'nombre de pouvoirs qu'#39'il poss\'#39'e8de'
      
        '\par \kerning0\u61623?\tab\kerning1 s'#39'il exprime plusieurs choix' +
        ', le vote est d\'#39'e9clar\'#39'e9 nul (non exprim\'#39'e9)'
      '\par '
      '\par '
      '\par '
      '\par }')
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

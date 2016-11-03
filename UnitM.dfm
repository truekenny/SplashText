object FrmSplashText: TFrmSplashText
  Left = 1007
  Top = 359
  BorderStyle = bsNone
  Caption = 'SplashText'
  ClientHeight = 280
  ClientWidth = 397
  Color = clPurple
  TransparentColor = True
  TransparentColorValue = clPurple
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lbl: TLabel
    Left = 8
    Top = 24
    Width = 56
    Height = 32
    Caption = 'MASTER'#13#10'PROCESS'
    Color = clPurple
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object lblMove: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    AutoSize = False
    Color = clGray
    ParentColor = False
    PopupMenu = pm
    Transparent = False
    OnMouseDown = lblMoveMouseDown
  end
  object lblClose: TLabel
    Left = 11
    Top = 9
    Width = 7
    Height = 11
    Caption = 'X'
    Color = clGray
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Lucida Console'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    PopupMenu = pm
    OnClick = lblCloseClick
  end
  object tmr: TTimer
    OnTimer = tmrTimer
    Left = 152
    Top = 40
  end
  object pm: TPopupMenu
    Left = 200
    Top = 40
    object miAdd: TMenuItem
      Caption = 'Add...'
      OnClick = miAddClick
    end
    object miSeparator1: TMenuItem
      Caption = '-'
    end
    object miEditText: TMenuItem
      Caption = 'Edit Text...'
      OnClick = miEditTextClick
    end
    object miChangeColor: TMenuItem
      Caption = 'Change Color...'
      OnClick = miChangeColorClick
    end
    object miSeparator2: TMenuItem
      Caption = '-'
    end
    object miShowAll: TMenuItem
      Caption = 'Show All'
      OnClick = miShowAllClick
    end
    object miTransparentClick: TMenuItem
      Caption = 'Transparent Click'
      OnClick = miTransparentClickClick
    end
    object miOpenConfig: TMenuItem
      Caption = 'Config'
      OnClick = miOpenConfigClick
    end
    object miSeparator3: TMenuItem
      Caption = '-'
    end
    object miQuit: TMenuItem
      Caption = 'Quit'
      OnClick = miQuitClick
    end
  end
  object dlgColor: TColorDialog
    Left = 256
    Top = 40
  end
end

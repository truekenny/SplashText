object Frm: TFrm
  Left = 886
  Top = 336
  BorderStyle = bsNone
  Caption = 'Frm'
  ClientHeight = 512
  ClientWidth = 695
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
    Width = 120
    Height = 64
    Caption = 
      'Veldspar  10780'#13#10'Scordite   7186'#13#10'Pyroxeres  3593'#13#10'Kernite     8' +
      '98'
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
    OnDblClick = lblCloseDblClick
  end
  object tmr: TTimer
    Interval = 60000
    OnTimer = tmrTimer
    Left = 152
    Top = 40
  end
  object pm: TPopupMenu
    Left = 200
    Top = 40
    object miOpenConfig: TMenuItem
      Caption = 'Open config...'
      OnClick = miOpenConfigClick
    end
  end
end
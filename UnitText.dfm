object FrmText: TFrmText
  Left = 967
  Top = 289
  Caption = 'SplashText'
  ClientHeight = 274
  ClientWidth = 545
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    545
    274)
  PixelsPerInch = 96
  TextHeight = 13
  object mmo: TMemo
    Left = 8
    Top = 8
    Width = 529
    Height = 202
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Fixedsys'
    Font.Style = []
    Lines.Strings = (
      'mmo')
    ParentFont = False
    TabOrder = 0
  end
  object btnOk: TButton
    Left = 16
    Top = 233
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'OK'
    TabOrder = 1
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 104
    Top = 233
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
end

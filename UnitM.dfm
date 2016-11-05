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
  object lblShadow: TLabel
    Left = 8
    Top = 72
    Width = 48
    Height = 13
    Caption = 'lblShadow'
    Color = clBtnFace
    ParentColor = False
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
  object lblShadow2: TLabel
    Left = 8
    Top = 91
    Width = 54
    Height = 13
    Caption = 'lblShadow2'
    Visible = False
  end
  object lblShadow3: TLabel
    Left = 8
    Top = 110
    Width = 54
    Height = 13
    Caption = 'lblShadow3'
    Visible = False
  end
  object lblShadow4: TLabel
    Left = 8
    Top = 129
    Width = 54
    Height = 13
    Caption = 'lblShadow4'
    Visible = False
  end
  object lbl: TLabel
    Left = 8
    Top = 24
    Width = 56
    Height = 32
    Caption = 'MASTER'#13#10'PROCESS'
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object tmr: TTimer
    OnTimer = tmrTimer
    Left = 152
    Top = 40
  end
  object pm: TPopupMenu
    Images = il
    Left = 200
    Top = 40
    object miAdd: TMenuItem
      Caption = 'Add...'
      ImageIndex = 0
      OnClick = miAddClick
    end
    object miSeparator1: TMenuItem
      Caption = '-'
    end
    object miEditText: TMenuItem
      Caption = 'Edit Text...'
      ImageIndex = 4
      OnClick = miEditTextClick
    end
    object miChangeColor: TMenuItem
      Caption = 'Change Color...'
      ImageIndex = 2
      OnClick = miChangeColorClick
    end
    object miChangeFontSize: TMenuItem
      Caption = 'Change Font Size...'
      ImageIndex = 6
      OnClick = miChangeFontSizeClick
    end
    object miSeparator2: TMenuItem
      Caption = '-'
    end
    object miShowAll: TMenuItem
      Caption = 'Show All'
      ImageIndex = 5
      OnClick = miShowAllClick
    end
    object miClickThrough: TMenuItem
      Caption = 'Click-Through'
      OnClick = miClickThroughClick
    end
    object miOpenConfig: TMenuItem
      Caption = 'Config'
      ImageIndex = 3
      OnClick = miOpenConfigClick
    end
    object miSeparator3: TMenuItem
      Caption = '-'
    end
    object miQuit: TMenuItem
      Caption = 'Quit'
      ImageIndex = 1
      OnClick = miQuitClick
    end
  end
  object dlgColor: TColorDialog
    Left = 248
    Top = 40
  end
  object il: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 152
    Top = 96
    Bitmap = {
      494C010107000C00300010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000000000000000001D000000340000
      0036000000360000003600000036000000360000003600000036000000360000
      003600000036000000330000001D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000034E5E5E5F5F8F8
      F8FDFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFF8F8F8FDE1E1E1F300000033000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FAFAFAFEFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFF8F8F8FD00000036000000000000000000000000000000000000
      000000000000D8D8D8FFD5D5D5FFD3D3D3FFD1D1D1FFCFCFCFFFCDCDCDFFCBCB
      CBFFC9C9C9FFC7C7C7FFC4C4C4FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFCFC
      FCFF164158FF295F88FF4A89BDFF6DA7CBFFE0E9F1FFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFCFCFCFF00000036000000010000000000000000000000000000
      000000000000DADADAFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFC7C7C7FF0000000000000000602F19AED88C5BFEDB8F
      5EFFBA7043ED3B180C8D000000100501002A4D1E11A2AF5E36EAD67C4FFFD57A
      4BFF6C2D1ABD0602003100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFCFC
      FCFF2C6584FF93C7F9FF90C9F9FF3F84C9FF2469ADFFD4E2EEFFFAFAFAFFFAFA
      FAFFFAFAFAFFFCFCFCFF00000036000000010000000000000000000000000000
      000000000000DDDDDDFFFDFDFDFFFAFAFAFFFAFAFAFFFAFAFAFFF9F9F9FFF9F9
      F9FFF9F9F9FFFCFCFCFFCACACAFF00000000000000000000000A0E060344E1A3
      73FFBB774AEC0B04023D0000000000000000010000133011097FDC9569FFDB8E
      5EFF140603540000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFCFC
      FCFF4188A9FFE0F2FFFF5299D8FF1878BDFF4797C4FF468DC7FFD8E6F3FFF8F8
      F8FFF8F8F8FFFCFCFCFF000000360000000100000000DC996EFFDA956CFFDA93
      68FFD89065FFD88D62FFD68B60FFD5885DFFD5855BFFD48458FFD28257FFD282
      56FFF9F9F9FFFCFCFCFFCCCCCCFF000000000000000000000000000000014E2A
      179BE2A87AFF48241399000000000000000000000000622F19B1DF9F75FFDA88
      58FF030100220000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFCFC
      FCFFA4C2D7FF78B5D5FF8FB6D1FF53C9E4FF59DFF5FF76D0EDFF4F9CDDFFDFEB
      F5FFF8F8F8FFFCFCFCFF000000360000000100000000DE9D73FFE5B293FFE4B0
      90FFE3AD8EFFE2AB8CFFE1A989FFE1A787FFDFA485FFDFA283FFDEA181FFD283
      58FFFAFAFAFFFCFCFCFFCECECEFF000000000000000000000000000000000100
      0015B87B4DEAE2A677FF945931D364321BB267331CB5985630D8E3A780FFCF7F
      50F90200001B0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFCFC
      FCFFFCFCFCFFB1D5E5FF74B9D7FFC1F6FDFF61DFF7FF5BE2F8FF77D3F0FF4797
      DCFFDEE9F2FFFCFCFCFF000000360000000100000000E1A279FFE6B596FFE5B3
      94FFE4B191FFE3AE8FFFE3AC8CFFE1AA8AFFE1A888FFE0A686FFDFA484FFD585
      5BFFFAFAFAFFFCFCFCFFD1D1D1FF000000000000000000000000000000000000
      00001A0D065CCF915FF6925C35D11208044E0502012A512815A0E1A578FFC277
      49F20000000D0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFAED4E5FF75CBE7FFC7F7FDFF5CDCF5FF58E1F7FF79D4
      F1FF4999DDFFD4E5F5FF000000360000000100000000E1A67DFFE8B99AFFE7B7
      98FFE6B495FFE5B293FFE4B090FFE3AD8EFFE2AB8CFFE1A989FFE1A787FFD588
      5FFFFDFDFDFFFCFCFCFFD3D3D3FF000000000000000000000000000000000000
      0000000000035F381CAAD19462F7200F07660000000A391B0E88E1A577FF9052
      2DD2000000060000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFBCE5F2FF77D3EEFFC7F7FDFF5DDCF5FF59E2
      F7FF78D6F2FF4FA1E2FF04090D5C0000000100000000E3AA82FFE9BC9DFFE8BA
      9BFFE8B899FFE6B596FFE5B394FFE4B191FFE3AE8FFFE3AC8CFFE1AA8AFFD88D
      62FFDADADAFFD8D8D8FFD6D6D6FF000000000000000000000000000000000000
      00000000000003010022AE784CE2A87246DF160B0554341A0D80E2A87AFF572C
      17A5000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFFBFB
      FBFFFCFCFCFFFCFCFCFFFBFBFBFFF8F8F8FFB9E3F0FF7BD4EEFFC3F6FDFF6ADD
      F6FF6BCAEDFF61A2D7FF5087B7F00103042700000000E5AE85FFEABFA1FFEABD
      9FFFE8BB9CFFE8B99AFFE7B798FFE6B495FFE5B293FFE4B090FFE3AD8EFFD991
      68FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000002E1A0D77D49B68F7643E1FAD543019A0E4AD81FF4A26
      1499000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFF9F9
      F9FFF9F9F9FFF9F9F9FFF7F7F7FFF6F6F6FFF2F2F2FFA7D9E8FF80D6EEFFB1E3
      F9FF8ABFE7FFADD3F6FFC3E0FCFF5E94C5F700000000E5B188FFEBC1A3FFEBC0
      A1FFEABE9FFFE9BC9DFFE8BA9BFFE8B899FFE6B596FFE5B394FFE4B191FFDA95
      6CFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000201001C754F2DBACC9766F2CF9A69F5D39968F74A29
      1598000000080000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000100000036FCFCFCFFF7F7
      F7FFF9F9F9FFF7F7F7FFF7F7F7FFF3F3F3FFF0F0F0FFEAEAEAFFAEE4F3FF75BD
      E7FFB3D2F0FFE5F3FFFFABD2EFFF3A72A4E800000000E6B28BFFECC3A5FFEBC2
      A4FFEBC1A2FFEABFA1FFEABD9FFFE8BB9CFFE8B99AFFE7B798FFE6B495FFDD9A
      71FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000160D0653AB7E50DEE9BB90FFE7B98EFFE7B68AFFDA9D
      6BFB6D3F20B60000000A00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000036F7F7F7FDF4F4
      F4FFF5F5F5FFF5F5F5FFF5F5F5FFF1F1F1FFEFEFEFFFE9E9E9FFFCFCFCFFABD5
      E4FF56A4D8FF84B0DBFF449CD0FF05141C5E00000000E6B28BFFE6B28BFFE6B2
      8BFFE5B188FFE5AE87FFE5AD84FFE3AA82FFE2A87EFFE1A57BFFE1A279FFDE9E
      75FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000D0804403A251185492F1894442A148F442914904E2F
      179A3D21108A0000000D00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000033DBDBDBF0F7F7
      F7FDFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFF8F8F8FF2F2F
      2F91000000200000000200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000001C000000330000
      0036000000360000003600000036000000360000003600000036000000360000
      0020000000020000000000000000000000000000000000000000000000000000
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
      00000600002E2F00067E610018B684002ED57E003BD2550034AE24001B720300
      0221000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000010201230E22117D296531DB307C38F32C7A35F3226027DB0A1E0C7D0002
      0023000000000000000000000000000000000000000000000000000000000000
      00000505134C2D3293D23D44C1F0363DB5E9343BB3E9353DBFF0232990D20304
      16540000000600000000000000000000000000000000000000000000000C3901
      0085BD030AF1E13E57FFEE6183FFF371A0FFF06FB1FFE458B5FFD234B3FF9901
      91E61F00226E0000000200000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      000000000000000000000000000000000000000000000000000000000000070F
      0953367942E63F984EFF7BC18EFF95D0A5FF95CFA5FF76BD88FF348C40FF2367
      29E6040D04530000000000000000000000000000000000000000000000000506
      134C4E55B6E48896FAFF8394FFFF7D8FFCFF7B8DFAFF7B8CF7FF7B8AF2FF4F57
      DDFF06082A73000000000000000000000000000000000000000E691300AEE950
      3EFFF88483FFFF959EFFFF7290FFFF5E99FFFF5EB6FFFF76D8FFFC91EFFFE86F
      EAFFB530CCFF2B003C9100000005000000000000000000000000000000000000
      000000000000FFFFFFFF9B8268FF8A7158FF8A7158FF8A7158FFFFFFFFFF0000
      000000000000000000000000000000000000000000000000000008100A53458E
      53F462B376FFA7DBB4FF86CC97FF64BB7BFF62B97AFF85CB97FFA4D9B3FF56A9
      69FF27742EF4040D0453000000000000000000000000000000000607134D5157
      AEDF95A4FAFF5872FFFF304EFFFF2E4DFFFF2A47FEFF2340FAFF465EF9FF8593
      F4FF3B41A5DC0304124D0000000000000000000000004E1B0092F07542FFFCA5
      91FFFF796DFFFF4F56FFFF5877FFFF5C9AFFFF5ABBFFFF55DAFFFF4AF7FFF179
      FFFFD684F1FF9632CFFF1200246F00000000000000000000000000000000FFFF
      FFFFFFFFFFFFC5AC93FFFEEBD8FFFDE4CBFFF8E0C7FFF2DAC2FF796149FFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000001020122438251E568B8
      7BFFA7DBB1FF5EBB75FF5AB971FF57B76EFF57B46DFF56B46DFF59B672FFA4D9
      B2FF58A96AFF226729E50002002200000000000000000708134B6066BAE59EAC
      FBFF6580FFFF3E5CFFFF3E5CFFFF3A57FFFF3553FFFF314EFFFF2644FDFF4863
      FDFF8895F6FF434BB2E50304124B000000000E07003EF0760AFBFBB88DFFFF96
      68FFFF7759FFFF6F69FFFF7488FFFF7AACFFFF79CDFFFF6FEDFFF761FFFFD950
      FFFFCF7AFFFFB271ECFF4A05ADEB010003220000000000000000FFFFFFFFD3BC
      A4FFD3BCA4FFDEC5ACFFFEEBD8FFD9C0A7FFCAB39CFFC0A890FFBDA58CFF8A71
      58FF796149FFFFFFFFFF00000000000000000000000016281B7E51AA66FFA9DD
      B3FF62C077FF5DBD6FFF5EBB75FFFFFFFFFFFFFFFFFF57B76EFF56B46CFF5AB6
      72FFA5DAB3FF368E41FF0A1F0C7E00000000000000004E529ED5A1B1FCFF718E
      FFFF4D6EFFFF4D6CFFFF4967FFFF4462FFFF3F5CFFFF3A58FFFF3553FFFF2A49
      FFFF4C65FFFF8392FAFF2C3196D500000000603E009EFDBD5EFFFFD09BFFFFA4
      59FFFFA16FFFFF9983FFFF969AFFFF9EBEFFFF9EE0FFFE91FBFFE77AFFFFC964
      FFFFA74DFFFFBD94FDFF703EDDFF0B002D7900000000FFFFFFFFD3BCA4FFFEF2
      E7FFFEF2E7FFFFFFFFFFFDE4CBFFF0D7BEFFD9C0A7FFCAB198FFC0A890FFEFD8
      C0FFEBD4BCFF796149FFFFFFFFFF0000000000000000467E55DB89CC97FF88D3
      95FF69C578FF61C06EFF53AA63FFFFFFFFFFFFFFFFFF57B76EFF57B76EFF59B8
      70FF84CC96FF79BD8CFF226029DB00000000000000006F75CEF2A5BAFFFF5D7D
      FFFF5D7CFFFF5877FFFF5371FFFF4E6CFFFF4967FFFF4462FFFF3F5CFFFF3957
      FFFF2F4DFFFF8698FFFF444BC5F200000000AB8506D5FEDD7EFFFFD16AFFFFC7
      69FFFFC784FFFFC39DFFFFBCB2FFFFBED0FFFFBEF1FFF4AFFFFFD695FFFFB577
      FFFF945CFFFF9875FFFF8163ECFF14026BB700000000FFFFFFFFCAB39CFFFEF2
      E7FFFFFFFFFFF2DAC2FFFFFFFFFFFEF2E7FFFFFCFAFFDEC5ACFFCAB198FFC0A8
      90FFF2DAC2FF8A7158FFFFFFFFFF00000000000000005CA270F6A8DDB2FF7BCF
      89FF73CC80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57B7
      6EFF65BD7BFF9BD4AAFF2F7D37F600000000000000006E71C0E9AABDFFFF6B8C
      FFFF6788FFFF6382FFFF5D7CFFFF5877FFFF5372FFFF4E6DFFFF4967FFFF4461
      FFFF3D5AFFFF899AFFFF444AB7E900000000D7C20CF1FFF28FFFFFE960FFFFE8
      74FFFFE792FFFFE7AFFFFFE6CAFFFFE5E5FFFCDEFDFFE1C5FFFFC1A5FFFFA083
      FFFF7C64FFFF7462FFFF8779F6FF110598D80000000000000000FFFFFFFFCAB3
      9CFFFEF2E7FFFFFFFFFFF8E0C7FFAE967CFFFFFFFFFFFFFCFAFFE7CEB5FFFDE4
      CBFFAE967CFFFFFFFFFF00000000000000000000000060A574F6B5E2BDFF8AD5
      96FF78C985FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57B7
      6EFF67C07CFF9CD4A9FF32803CF600000000000000007479C2EAB0C3FFFF7497
      FFFF7192FFFF6C8DFFFF6788FFFF6382FFFF5D7CFFFF5877FFFF5371FFFF4D6C
      FFFF4665FFFF8FA0FFFF4A51BBEA00000000D6D80CF4F9FA91FFFAFD62FFFAFD
      79FFF9FD97FFFAFDB4FFFAFED3FFFAFEEFFFEFF3FFFFD0D5FFFFAEB2FFFF8C90
      FFFF6A6DFFFF6567FFFF8182FBFF06099FDB0000000000000000FFFFFFFFCAB5
      A1FFFEF2E7FFEBD4BCFFFFFFFFFFAE967CFFAE967CFFFEF2E7FFF0D7BEFFFEEB
      D8FFAE967CFFFFFFFFFF0000000000000000000000004F855FDBABDDB5FFA5DF
      AEFF80CB8BFF7AC985FF6CBC77FFFFFFFFFFFFFFFFFF59AB68FF5EBB75FF5AB9
      71FF8AD198FF7EC491FF2B6733DB00000000000000008388D1F2B7CDFFFF7B9F
      FFFF7A9CFFFF7698FFFF7192FFFF6C8DFFFF6788FFFF6382FFFF5E7CFFFF5776
      FFFF4D6EFFFF97A9FFFF575ECAF20000000097AC0ADBE4F581FFE5FF6DFFE0FF
      77FFE0FF94FFDFFFAEFFDCFFC7FFDCFFE0FFD9FEFAFFC4E9FFFFA6CAFFFF86A9
      FFFF678AFFFF768DFFFF7185FBFF04127BBE00000000FFFFFFFFC4B09CFFFEF9
      F6FFE8D2BDFFE9D2BAFFEDD5BCFFFFFFFFFFFDE4CBFFFFFFFFFFFDE4CBFFEDD5
      BCFFFEEBD8FFAE967CFFFFFFFFFF00000000000000001B2C207E84C796FFD2EE
      D7FF94D99FFF89D393FF7DC888FFFFFFFFFFFFFFFFFF77CD84FF69C27AFF6DC7
      7CFFABDFB4FF439D55FF0F22127E00000000000000006569A2D4BBCDFCFF9BBA
      FFFF80A4FFFF80A1FFFF7A9DFFFF7698FFFF7292FFFF6D8DFFFF6788FFFF5E7E
      FFFF7692FFFF9DACFBFF44499AD400000000516A03ADC5EB65FFDDFF9AFFC4FF
      6DFFC2FF8BFFBDFFA0FFB8FFB2FFBCFFCFFFBCFFEEFFAFF8FFFF98DEFFFF7CC1
      FFFF61A2FFFF9DBCFFFF5782F8FF010F418A00000000FFFFFFFFCAB5A1FFFEF9
      F6FFFEF9F6FFE8D2BDFFE9D2BAFFF0D7BEFFFFFFFFFFFDE4CBFFFFFFFFFFFEF2
      E7FFFEF2E7FFC0A890FFFFFFFFFF00000000000000000103022259936BE5A9DA
      B6FFD8F1DCFF91D89CFF87CD92FF83CC8DFF8AD495FF89D494FF82D28DFFAEE0
      B6FF69B87BFF397A43E50102012200000000000000000C0C134A8389BFE4C0D1
      FCFF9FBEFFFF85A9FFFF84A6FFFF80A1FFFF7A9CFFFF7697FFFF6D8FFFFF84A0
      FFFFABB9FBFF676DB9E40808124A000000000F1700529FE136FFCBF696FFADFF
      6AFFA3FF78FF9CFF8CFF9AFFA2FFA3FFC3FFA1FFDFFF96FFF8FF84EFFFFF6CD3
      FFFF76C4FFFF91C4FCFF1164E2F6000309320000000000000000FFFFFFFFCAB5
      A1FFD3BCA4FFF5E0CBFFFEF7F1FFEDD5BCFFF2DAC2FFFFFFFFFFE7CEB5FFDEC5
      ACFFD9C0A7FFFFFFFFFF000000000000000000000000000000000B130E5365A7
      7AF4AEDCBAFFDCF2E0FFB5E4BCFF9ADBA4FF95D99FFFA4DFAEFFBFE8C4FF77C1
      89FF488F55F407100953000000000000000000000000000000000B0C12497E83
      B6DFC3D4FCFFA2C1FFFF8AAEFFFF88AAFFFF83A6FFFF7C9FFFFF90ADFFFFB3C2
      FBFF656AACDB0809124A000000000000000000000006376704B093E255FFBAF9
      9CFF89FF6CFF77FF74FF81FF96FF88FFB5FF86FFD1FF7CFFECFF6BFBFEFF74E8
      FFFF9ADFFCFF52B9FBFF02274C8E00000000000000000000000000000000FFFF
      FFFFFFFFFFFFC4B09CFFFEF9F6FFFEF9F6FFFEF2E7FFFEF2E7FFD9C0A7FFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000B13
      0E535A956CE693CEA3FFC2E6CBFFCFEBD4FFC9E9CEFFAEDDB7FF6BB87DFF4685
      54E608100A530000000000000000000000000000000000000000000000000C0C
      134A868CC0E4C1D3FCFFC0D6FFFFBCD1FFFFBACFFFFFB8CEFFFFB6C8FCFF979E
      EDFF18182C720000000000000000000000000000000001030020318C08CF72E1
      56FFA0F698FF9DFFA5FF79FF9DFF6EFFADFF6EFFC7FF7AFFE3FFA4FFFAFF97F4
      FBFF53D8F5FF065D7FB600000111000000000000000000000000000000000000
      000000000000FFFFFFFFC4B09CFFC4B09CFFCAB198FFCAB5A1FFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020302231A2B207D508560DB5EA272F35CA06FF3478056DB16281B7D0103
      0223000000000000000000000000000000000000000000000000000000000000
      00000D0D144B6A6D9FD28D91D1F08386C4E98184C4E9868BCFF061659ED20D0E
      1853000000060000000000000000000000000000000000000000010300220E62
      04AF38D73BFF68E67AFF87F3A9FF95F9C3FF96FBD3FF86F7DBFF66EFE0FF18DD
      DCFA034B53980000011200000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000300160154056218AF0E9A3DDA14C268F414BF7CF10D956FD405584AA20010
      0F45000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end

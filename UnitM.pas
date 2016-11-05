unit UnitM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, Menus, ShellApi, UnitText, Math,
  System.ImageList, Vcl.ImgList;

const
  WM_ICONTRAY = WM_USER + 1;
  DEFAULT_FONT = 'Fixedsys,204,FF0000,12,SSSS';

type
  TFrmSplashText = class(TForm)
    lbl: TLabel;
    lblMove: TLabel;
    tmr: TTimer;
    lblClose: TLabel;
    pm: TPopupMenu;
    miOpenConfig: TMenuItem;
    miQuit: TMenuItem;
    miAdd: TMenuItem;
    miShowAll: TMenuItem;
    miEditText: TMenuItem;
    miSeparator1: TMenuItem;
    miSeparator2: TMenuItem;
    miSeparator3: TMenuItem;
    dlgColor: TColorDialog;
    miClickThrough: TMenuItem;
    il: TImageList;
    lblShadow: TLabel;
    lblShadow2: TLabel;
    lblShadow3: TLabel;
    lblShadow4: TLabel;
    miChangeFont: TMenuItem;
    FontDialog: TFontDialog;

    procedure CreateParams(var Params: TCreateParams); override;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure lblCloseClick(Sender: TObject);
    procedure lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrTimer(Sender: TObject);

    procedure miAddClick(Sender: TObject);
    procedure miEditTextClick(Sender: TObject);
    procedure miShowAllClick(Sender: TObject);
    procedure miClickThroughClick(Sender: TObject);
    procedure miOpenConfigClick(Sender: TObject);
    procedure miQuitClick(Sender: TObject);
    procedure miChangeFontClick(Sender: TObject);
  private
    { Private declarations }
    ini: TIniFile;
    number: Integer;
    config: String;
    mustHalt: Boolean;

    TrayIconData: TNotifyIconData;
  public
    { Public declarations }
    function StyleToStr(Style: TFontStyles): String;
    function StrToStyle(Str: String): TFontStyles;
    function FontToString(Font: TFont) : string;
    procedure StringToFont(Font: String);
    procedure UpdateShadowLabels;
    function TColorToShadow(Color : TColor) : TColor;
    function TColorToHex(Color : TColor) : string;
    function HexToTColor(sColor : string) : TColor;
    procedure Init(ini: TIniFile; i: Integer);
    procedure ResizeForm();
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
    procedure TransparentStyle(var Msg: TMessage); message WM_APP;
  end;

var
  FrmSplashText: TFrmSplashText;

implementation

{$R *.dfm}

function TFrmSplashText.StyleToStr(Style: TFontStyles): String;
begin
  SetLength(Result, 4);
  {T = true, S = false 83 is ordinal value of S, if true then S + 1 (84) = T}
  Result[1] := Char(Integer(fsBold In Style) + 83);
  Result[2] := Char(Integer(fsItalic In Style) + 83);
  Result[3] := Char(Integer(fsUnderline In Style) + 83);
  Result[4] := Char(Integer(fsStrikeOut In Style) + 83);
  {replace all S to F's if you like}
  Result := StringReplace(Result, 'S', 'F', [rfReplaceAll]);
end;

function TFrmSplashText.StrToStyle(Str: String): TFontStyles;
begin
  Result := [];
  {T = true, S = false}
  if Str[1] = 'T' then
    Include(Result, fsBold);
  if Str[2] = 'T' then
    Include(Result, fsItalic);
  if Str[3] = 'T' then
    Include(Result, fsUnderLine);
  if Str[4] = 'T' then
    Include(Result, fsStrikeOut);
end;

function TFrmSplashText.FontToString(Font: TFont) : string;
begin
  result := Font.Name + ','
    + IntToStr(Font.Charset) + ','
    + TColorToHex(Font.Color) + ','
    + IntToStr(Font.Size) + ','
    + StyleToStr(Font.Style);
end;

procedure TFrmSplashText.StringToFont(Font: String);
var
  List: TStrings;
  Name : String;
  Charset, Color, Size, Style: Integer;
begin
  List := TStringList.Create;

  ExtractStrings([','], [], PChar(Font), List);
  lbl.Font.Name := List.Strings[0];
  lbl.Font.Charset := StrToInt(List.Strings[1]);
  lbl.Font.Color := HexToTColor(List.Strings[2]);
  lbl.Font.Size := StrToInt(List.Strings[3]);
  lbl.Font.Style := StrToStyle(List.Strings[4]);

  List.Free;
end;

procedure TFrmSplashText.UpdateShadowLabels;
begin
  lblShadow.Font := lbl.Font;
  lblShadow.Left := lbl.Left + 1;
  lblShadow.Top := lbl.Top + 1;
  lblShadow.Font.Color := TColorToShadow(lbl.Font.Color);
  lblShadow.Caption := lbl.Caption;

  lblClose.Font.Color := lblShadow.Font.Color;
(*
  lblShadow2.Font := lbl.Font;
  lblShadow2.Left := lbl.Left - 1;
  lblShadow2.Top := lbl.Top + 1;
  lblShadow2.Font.Color := TColorToShadow(lbl.Font.Color);
  lblShadow2.Caption := lbl.Caption;

  lblShadow3.Font := lbl.Font;
  lblShadow3.Left := lbl.Left + 1;
  lblShadow3.Top := lbl.Top - 1;
  lblShadow3.Font.Color := TColorToShadow(lbl.Font.Color);
  lblShadow3.Caption := lbl.Caption;

  lblShadow4.Font := lbl.Font;
  lblShadow4.Left := lbl.Left - 1;
  lblShadow4.Top := lbl.Top - 1;
  lblShadow4.Font.Color := TColorToShadow(lbl.Font.Color);
  lblShadow4.Caption := lbl.Caption;
*)
end;

function TFrmSplashText.TColorToShadow(Color : TColor) : TColor;
begin
  Result := RGB(
      Round(GetRValue(Color) + 256/2) mod 256,
      Round(GetGValue(Color) + 256/2) mod 256,
      Round(GetBValue(Color) + 256/2) mod 256
    );
end;

function TFrmSplashText.TColorToHex(Color : TColor) : string;
begin
  Result :=
    IntToHex(GetRValue(Color), 2) +
    IntToHex(GetGValue(Color), 2) +
    IntToHex(GetBValue(Color), 2) ;
end;

function TFrmSplashText.HexToTColor(sColor : string) : TColor;
 begin
    Result :=
      RGB(
        StrToInt('$'+Copy(sColor, 1, 2)),
        StrToInt('$'+Copy(sColor, 3, 2)),
        StrToInt('$'+Copy(sColor, 5, 2))
      );
 end;

procedure TFrmSplashText.Init(ini: TIniFile; i: Integer);
var
  Text: String;
  Font: String;
begin
  Text := ini.ReadString('Data' + IntToStr(i), 'text' , '-');
  lbl.Caption := StringReplace(Text, '\n', #13#10, [rfReplaceAll]);

  Left := ini.ReadInteger('Data' + IntToStr(i), 'x', 500);
  Top := ini.ReadInteger('Data' + IntToStr(i), 'y', 500);

  Font := ini.ReadString('Data' + IntToStr(i), 'font', DEFAULT_FONT);
  StringToFont(Font);

  lblMove.Color := lbl.Font.Color;
  UpdateShadowLabels;

  Application.ProcessMessages;

  ResizeForm;

  if ini.ReadBool('Data' + IntToStr(i), 'enable' , True) then begin
    Show();
  end else begin
    mustHalt := True;
  end;
end;

procedure TFrmSplashText.ResizeForm();
begin
  lblMove.Width := Max(lbl.Width, 100);
  FrmSplashText.Width := lblMove.Width + lblMove.Left * 2;
  FrmSplashText.Height := lbl.Height + lbl.Top + lblMove.Left;
end;

procedure TFrmSplashText.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle and not WS_EX_APPWINDOW;
  Params.WndParent := Application.Handle;
end;

procedure TFrmSplashText.TrayMessage(var Msg: TMessage);
begin
  case Msg.lParam of
    WM_LBUTTONDOWN:
    begin
      //
    end;
    WM_RBUTTONDOWN:
    begin
      SetForegroundWindow(Handle);
      pm.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
    end;
  end;
end;

procedure TFrmSplashText.TransparentStyle(var Msg: TMessage);
var
  transparent: Boolean;
  ExStyle: LongInt;
begin
  transparent := Msg.WParam = 1;

  if transparent then begin
    ExStyle := GetWindowLong(Handle, GWL_EXSTYLE);
    ExStyle := ExStyle or WS_EX_LAYERED or WS_EX_TRANSPARENT;

    SetWindowLong(Handle, GWL_EXSTYLE, ExStyle);
  end else begin
    ExStyle := GetWindowLong(Handle, GWL_EXSTYLE);
    ExStyle := ExStyle and (not WS_EX_LAYERED) and (not WS_EX_TRANSPARENT);

    SetWindowLong(Handle, GWL_EXSTYLE, ExStyle);
    TransparentColor := False;
    TransparentColor := True;
  end;

  lblMove.Visible := not transparent;
  lblClose.Visible := not transparent;
  miClickThrough.Checked := transparent;
end;

procedure TFrmSplashText.FormCreate(Sender: TObject);
var
  i, count: Integer;
  msg: TMessage;
begin
  number := -1;
  mustHalt := False;

  if ParamCount > 0 then begin
    number := StrToInt(ParamStr(1));
  end;

  config := ExtractFilePath(ParamStr(0)) + 'config.ini';

  ini := TIniFile.Create(config);
  try
    if(ini.ReadBool('Options', 'transparent', False)) then begin
      msg.wParam := Ord(ini.ReadBool('Options', 'transparent', False));
      TransparentStyle(msg);
    end;

    if number = -1 then begin
      count := ini.ReadInteger('Options', 'count', 0);

      for i:= 0 to count - 1 do begin
        if ini.ReadBool('Data' + IntToStr(i), 'enable' , True) then begin
          ShellExecute(Handle, 'open', PChar(ParamStr(0)), PChar(IntToStr(i)), nil, SW_SHOWNORMAL);
        end;
      end;
    end else begin
      Init(ini, number);
    end;
  finally
    ini.Free;
  end;

  if number = -1 then begin
    with TrayIconData do
      begin
        cbSize :=  TNotifyIconData.SizeOf; // SizeOf(TrayIconData);
        Wnd := Handle;
        uID := 0;
        uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
        uCallbackMessage := WM_ICONTRAY;
        hIcon := Application.Icon.Handle;
        StrPCopy(szTip, Application.Title);
      end;

    Shell_NotifyIcon(NIM_ADD, @TrayIconData);

    miEditText.Visible := False;
    miChangeFont.Visible := False;
    miSeparator1.Visible := False;
  end;
end;

procedure TFrmSplashText.FormActivate(Sender: TObject);
begin
  UpdateShadowLabels;

  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TFrmSplashText.FormDestroy(Sender: TObject);
begin
  if number = -1 then begin
    Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
    Exit;
  end;

  ini := TIniFile.Create(config);
  try
    ini.WriteInteger('Data' + IntToStr(number), 'x', Left);
    ini.WriteInteger('Data' + IntToStr(number), 'y', Top);
  finally
    ini.Free;
  end;
end;

procedure TFrmSplashText.lblCloseClick(Sender: TObject);
begin
  Close();

  ini := TIniFile.Create(config);
  try
    ini.WriteBool('Data' + IntToStr(number), 'enable', False);
  finally
    ini.Free;
  end;

end;

procedure TFrmSplashText.lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    ReleaseCapture;
    SendMessage(Handle, WM_SYSCOMMAND, 61458, 0) ;
  end;
end;

procedure TFrmSplashText.tmrTimer(Sender: TObject);
begin
  if mustHalt then Close();
end;

procedure TFrmSplashText.miAddClick(Sender: TObject);
var
  text: String;
  count: Integer;
begin
  FrmText.ShowModal('');
  if not FrmText.Save then Exit;

  text := StringReplace(FrmText.mmo.Text, #13#10, '\n', [rfReplaceAll]);

  ini := TIniFile.Create(config);
  try
    count := ini.ReadInteger('Options', 'count', 0);
    ini.WriteInteger('Options', 'count', count + 1);
    ini.WriteString('Data' + IntToStr(count), 'text', text);
  finally
    ini.Free;
  end;

  ShellExecute(Handle, 'open', PChar(ParamStr(0)), PChar(IntToStr(count)), nil, SW_SHOWNORMAL);
end;

procedure TFrmSplashText.miEditTextClick(Sender: TObject);
var
  text: string;
begin
  FrmText.ShowModal(lbl.Caption);
  if not FrmText.Save then Exit;

  lbl.Caption := FrmText.mmo.Text;
  UpdateShadowLabels;
  Application.ProcessMessages;

  ResizeForm;

  ini := TIniFile.Create(config);
  try
    text := StringReplace(FrmText.mmo.Text, #13#10, '\n', [rfReplaceAll]);
    ini.WriteString('Data' + IntToStr(number), 'text', text);
  finally
    ini.Free;
  end;
end;

procedure TFrmSplashText.miChangeFontClick(Sender: TObject);
begin
  FontDialog.Font := lbl.Font;
  if not FontDialog.Execute() then Exit;
  lbl.Font := FontDialog.Font;
  lblMove.Color := FontDialog.Font.Color;

  ResizeForm;
  UpdateShadowLabels;

  ini := TIniFile.Create(config);
  try
    ini.WriteString('Data' + IntToStr(number), 'font', FontToString(FontDialog.Font));
  finally
    ini.Free;
  end;
end;

procedure TFrmSplashText.miShowAllClick(Sender: TObject);
var
  i, count: Integer;
begin
  ini := TIniFile.Create(config);
  try
    count := ini.ReadInteger('Options', 'count', 0);

    for i:= 0 to count - 1 do begin
      if not ini.ReadBool('Data' + IntToStr(i), 'enable' , True) then begin
        ini.WriteBool('Data' + IntToStr(i), 'enable' , True);
        ini.UpdateFile;
        
        ShellExecute(Handle, 'open', PChar(ParamStr(0)), PChar(IntToStr(i)), nil, SW_SHOWNORMAL);
      end;

    end;
  finally
    ini.Free;
  end;
end;

procedure TFrmSplashText.miClickThroughClick(Sender: TObject);
var
  NextHandle: HWND;
  NextClass: array[0..260] of Char;
  transparent: Integer;
begin
  transparent := Ord(not miClickThrough.Checked);

  ini := TIniFile.Create(config);
  try
    ini.WriteBool('Options', 'transparent', transparent = 1);
  finally
    ini.Free;
  end;


  NextHandle := GetWindow(Application.Handle, GW_HWNDFIRST);
  while NextHandle > 0 do
  begin
    GetClassName(NextHandle, NextClass, 255);

    if String(NextClass) = FrmSplashText.ClassName then begin
      SendMessage(NextHandle, WM_APP, transparent, 0);
    end;

    NextHandle := GetWindow(NextHandle, GW_HWNDNEXT);
  end;
end;

procedure TFrmSplashText.miOpenConfigClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(config), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmSplashText.miQuitClick(Sender: TObject);
var
  NextHandle: HWND;
  NextClass: array[0..260] of Char;
begin
  NextHandle := GetWindow(Application.Handle, GW_HWNDFIRST);
  while NextHandle > 0 do
  begin
    GetClassName(NextHandle, NextClass, 255);

    if String(NextClass) = FrmSplashText.ClassName then begin
      SendMessage(NextHandle, WM_CLOSE, 0, 0);
    end;

    NextHandle := GetWindow(NextHandle, GW_HWNDNEXT);
  end;
end;

end.

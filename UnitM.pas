unit UnitM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, Menus, ShellApi;

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
    miSetText: TMenuItem;
    miSetColor: TMenuItem;
    miSeparator1: TMenuItem;
    miSeparator2: TMenuItem;
    miSeparator3: TMenuItem;
    dlgColor: TColorDialog;

    procedure CreateParams(var Params: TCreateParams); override;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure lblCloseClick(Sender: TObject);
    procedure lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrTimer(Sender: TObject);

    procedure miAddClick(Sender: TObject);
    procedure miSetTextClick(Sender: TObject);
    procedure miSetColorClick(Sender: TObject);
    procedure miShowAllClick(Sender: TObject);
    procedure miOpenConfigClick(Sender: TObject);
    procedure miQuitClick(Sender: TObject);
  private
    { Private declarations }
    ini: TIniFile;
    number: Integer;
    config: String;
    mustHalt: Boolean;
  public
    { Public declarations }
    procedure Init(ini: TIniFile; i: Integer);
    function TColorToHex(Color : TColor) : string;
    function HexToTColor(sColor : string) : TColor;
    procedure ResizeForm();
  end;

var
  FrmSplashText: TFrmSplashText;

implementation

{$R *.dfm}

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
begin
  Text := ini.ReadString('Data' + IntToStr(i), 'text' , '-');
  lbl.Caption := StringReplace(Text, '\n', #13, [rfReplaceAll]);

  Left := ini.ReadInteger('Data' + IntToStr(i), 'x', 500);
  Top := ini.ReadInteger('Data' + IntToStr(i), 'y', 500);
  lbl.Font.Color := HexToTColor(ini.ReadString('Data' + IntToStr(i), 'color' , 'FFFFFF'));

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
  lblMove.Width := lbl.Width;
  FrmSplashText.Width := lblMove.Width + lblMove.Left * 2;
  FrmSplashText.Height := lbl.Height + lbl.Top * 2;
end;

procedure TFrmSplashText.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle and not WS_EX_APPWINDOW;
  Params.WndParent := Application.Handle;
end;

procedure TFrmSplashText.FormCreate(Sender: TObject);
var
  i, count: Integer;
begin
  number := -1;
  mustHalt := False;

  if ParamCount > 0 then begin
    number := StrToInt(ParamStr(1));
  end;

  config := ExtractFilePath(ParamStr(0)) + 'config.ini';

  ini := TIniFile.Create(config);
  try
    if number = -1 then begin
      count := ini.ReadInteger('Options', 'count', 0);

      for i:= 0 to count - 1 do begin
        ShellExecute(Handle, 'open', PChar(ParamStr(0)), PChar(IntToStr(i)), nil, SW_SHOWNORMAL);
      end;
    end else begin
      Init(ini, number);
    end;
  finally
    ini.Free;
  end;
end;

procedure TFrmSplashText.FormActivate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TFrmSplashText.FormDestroy(Sender: TObject);
begin
  if number = -1 then Exit;

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
  text := InputBox('SplashText', 'Text', '');

  if text = '' then Exit;

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

procedure TFrmSplashText.miSetTextClick(Sender: TObject);
var
  text: string;
begin
  text := StringReplace(lbl.Caption, #13, '\n', [rfReplaceAll]);
  text := InputBox('SplashText', 'Text', text);

  if text = '' then Exit;

  lbl.Caption := StringReplace(text, '\n', #13, [rfReplaceAll]);
  Application.ProcessMessages;

  ResizeForm;

  ini := TIniFile.Create(config);
  try
    ini.WriteString('Data' + IntToStr(number), 'text', text);
  finally
    ini.Free;
  end;
end;

procedure TFrmSplashText.miSetColorClick(Sender: TObject);
var
  color: string;
begin
  if not dlgColor.Execute then Exit;

  lbl.Font.Color := dlgColor.Color;

  color := TColorToHex(dlgColor.Color);

  ini := TIniFile.Create(config);
  try
    ini.WriteString('Data' + IntToStr(number), 'color', color);
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

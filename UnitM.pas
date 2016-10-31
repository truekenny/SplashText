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
    procedure CreateParams(var Params: TCreateParams); override;

    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure miOpenConfigClick(Sender: TObject);
    procedure lblCloseClick(Sender: TObject);
  private
    { Private declarations }
    number: Integer;
    config: String;
  public
    { Public declarations }
    procedure Init(ini: TIniFile; i: Integer);
  end;

var
  FrmSplashText: TFrmSplashText;

implementation

{$R *.dfm}

procedure TFrmSplashText.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle and not WS_EX_APPWINDOW;
  Params.WndParent := Application.Handle;
end;

procedure TFrmSplashText.FormCreate(Sender: TObject);
var
  i, count: Integer;
  ini: TIniFile;
begin
  number := 0;

  if ParamCount > 0 then begin
    number := StrToInt(ParamStr(1));
  end;

  config := ExtractFilePath(ParamStr(0)) + 'config.ini';

  ini := TIniFile.Create(config);
  try
    if number = 0 then begin
      count := ini.ReadInteger('Options', 'count', 0);

      for i:= 0 to count - 1 do begin
        if i = 0 then begin
          Init(ini, i);
        end else begin
          ShellExecute(Handle, 'open', PChar(ParamStr(0)), PChar(IntToStr(i)), nil, SW_SHOWNORMAL);
        end;
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
var
  ini: TIniFile;
begin
  if number = -1 then Exit;

  ini := TIniFile.Create(config);
  try
    ini.WriteInteger('Data', 'x' + IntToStr(number), Left);
    ini.WriteInteger('Data', 'y' + IntToStr(number), Top);
  finally
    ini.Free;
  end;
end;

procedure TFrmSplashText.lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, 61458, 0) ;
end;

procedure TFrmSplashText.miOpenConfigClick(Sender: TObject);
var
  config: String;
begin
  config := ExtractFilePath(ParamStr(0)) + 'config.ini';

  ShellExecute(Handle, 'open', PChar(config), nil, nil, SW_SHOWNORMAL);
end;

procedure TFrmSplashText.lblCloseClick(Sender: TObject);
var
  NextHandle: HWND;
  NextClass: array[0..260] of Char;
begin
  Close();

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

procedure TFrmSplashText.Init(ini: TIniFile; i: Integer);
var
  Text: String;
begin
  Text := ini.ReadString('Data', 'text' + IntToStr(i), '-');
  lbl.Caption := StringReplace(Text, '\n', #13, [rfReplaceAll]);
  Left := ini.ReadInteger('Data', 'x' + IntToStr(i), 0);
  Top := ini.ReadInteger('Data', 'y' + IntToStr(i), 0);

  Application.ProcessMessages;

  lblMove.Width := lbl.Width;
end;

end.

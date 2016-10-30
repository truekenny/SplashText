unit UnitM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IniFiles, Menus, ShellApi;

type
  TFrm = class(TForm)
    lbl: TLabel;
    lblMove: TLabel;
    tmr: TTimer;
    lblClose: TLabel;
    pm: TPopupMenu;
    miOpenConfig: TMenuItem;
    procedure lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrTimer(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormActivate(Sender: TObject);
    procedure lblCloseDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miOpenConfigClick(Sender: TObject);
  private
    { Private declarations }
    number: Integer;
  public
    { Public declarations }
    procedure Init(_number, x, y: Integer; Text: String);
  end;

implementation

{$R *.dfm}

procedure TFrm.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle and not WS_EX_APPWINDOW;
  Params.WndParent := Application.Handle;
end;

procedure TFrm.lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_SYSCOMMAND, 61458, 0) ;
end;

procedure TFrm.tmrTimer(Sender: TObject);
var
  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(Now, Hour, Min, Sec, MSec);

  if(Min mod 2 = 0) then
    Left := Left + 10
  else
    Left := Left - 10;
end;

procedure TFrm.Init(_number, x, y: Integer; Text: String);
begin
  number := _number;

  lbl.Caption := Text;
  Left := x;
  Top := y;

  Application.ProcessMessages;

  lblMove.Width := lbl.Width;

  if Text <> '' then begin
    Show();
  end;
end;


procedure TFrm.FormActivate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TFrm.lblCloseDblClick(Sender: TObject);
begin
  Halt;
end;

procedure TFrm.FormCreate(Sender: TObject);
begin
  number := -1;
end;

procedure TFrm.FormDestroy(Sender: TObject);
var
  ini: TIniFile;
  config: String;
  saveLabel: String;
begin
  if number = -1 then Exit;

  config := ExtractFilePath(ParamStr(0)) + 'config.ini';

  ini := TIniFile.Create(config);
  try
    saveLabel := StringReplace(lbl.Caption, #13, '\n', [rfReplaceAll]);

    ini.WriteString('Data', 'text' + IntToStr(number), saveLabel);
    ini.WriteInteger('Data', 'x' + IntToStr(number), Left);
    ini.WriteInteger('Data', 'y' + IntToStr(number), Top);
  finally
    ini.Free;
  end;
end;

procedure TFrm.miOpenConfigClick(Sender: TObject);
var
  config: String;
begin
  config := ExtractFilePath(ParamStr(0)) + 'config.ini';

  ShellExecute(Handle, 'open', PChar(config), nil, nil, SW_SHOWNORMAL);
end;

end.

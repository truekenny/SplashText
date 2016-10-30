unit UnitM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFrm = class(TForm)
    lbl: TLabel;
    lblMove: TLabel;
    tmr: TTimer;
    lblClose: TLabel;
    procedure lblMoveMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tmrTimer(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;
    procedure FormActivate(Sender: TObject);
    procedure lblCloseDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetText(Text: String);
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

procedure TFrm.SetText(Text: String);
begin
  lbl.Caption := Text;
  Application.ProcessMessages;
  lblMove.Width := lbl.Width;

  if Text <> '' then Show();
end;


procedure TFrm.FormActivate(Sender: TObject);
begin
  ShowWindow(Application.Handle, SW_HIDE);
end;

procedure TFrm.lblCloseDblClick(Sender: TObject);
begin
  Halt;
end;

end.

unit UnitText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmText = class(TForm)
    mmo: TMemo;
    btnOk: TButton;
    btnCancel: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Save: Boolean;

    function ShowModal(text: String): Integer; //overload;

  end;

var
  FrmText: TFrmText;

implementation

{$R *.dfm}

function TFrmText.ShowModal(text: String): Integer;
begin
  mmo.Text := text;

  Result := inherited ShowModal;
end;


procedure TFrmText.FormShow(Sender: TObject);
begin
  Save := False;
end;

procedure TFrmText.btnOkClick(Sender: TObject);
begin
  Save := True;
  Close();
end;

procedure TFrmText.btnCancelClick(Sender: TObject);
begin
  Close();
end;

end.

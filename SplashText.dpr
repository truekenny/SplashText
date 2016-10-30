program SplashText;

uses
  Forms,
  UnitM in 'UnitM.pas' {Frm};

var
  Frm: TFrm;
  Frms: array of TFrm;
  i, count: Integer;

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.CreateForm(TFrm, Frm);

  count := 2;
  SetLength(Frms, count);

  for i:= 0 to count - 1 do begin
    Application.CreateForm(TFrm, Frms[i]);
    Frms[i].SetText('Hello\n222 222');
  end;


  Application.Run;
end.

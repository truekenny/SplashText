program SplashText;

uses
  Forms,
  UnitM in 'UnitM.pas' {FrmSplashText};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmSplashText, FrmSplashText);
  Application.Run;
end.

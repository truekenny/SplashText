program SplashText;

uses
  Forms,
  IniFiles,
  SysUtils,
  UnitM in 'UnitM.pas' {Frm};

var
  Frm: TFrm;
  Frms: array of TFrm;
  i, count: Integer;
  ini: TIniFile;
  config: String;

  Text: String;
  x,y: Integer;

{$R *.res}

begin
  Application.Initialize;
  Application.ShowMainForm := False;
  Application.CreateForm(TFrm, Frm);

  config := ExtractFilePath(ParamStr(0)) + 'config.ini';

  ini := TIniFile.Create(config);
  try
    count := ini.ReadInteger('Options', 'count', 0);
    SetLength(Frms, count);

    for i:= 0 to count - 1 do begin
      Application.CreateForm(TFrm, Frms[i]);

      Text := ini.ReadString('Data', 'text' + IntToStr(i), '-');
      Text := StringReplace(Text, '\n', #13, [rfReplaceAll]);
      x := ini.ReadInteger('Data', 'x' + IntToStr(i), 0);
      y := ini.ReadInteger('Data', 'y' + IntToStr(i), 0);

      Frms[i].Init(i, x, y, Text);
    end;
  finally
    ini.Free;
  end;


  Application.Run;
end.

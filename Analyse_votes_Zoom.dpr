program Analyse_votes_Zoom;

uses
  Forms,
  Analyse_votes_Zoom_ in 'Analyse_votes_Zoom_.pas' {Form1},
  Auxiliaire in 'Auxiliaire.pas',
  informations in 'infos\informations.pas' {Finformation};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFinformation, Finformation);
  Application.Run;
end.


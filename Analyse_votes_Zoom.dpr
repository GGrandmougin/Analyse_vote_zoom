program Analyse_votes_Zoom;

uses
  Forms,
  Analyse_votes_Zoom_ in 'Analyse_votes_Zoom_.pas' {Form1},
  Auxiliaire in 'Auxiliaire.pas',
  informations in 'infos\informations.pas' {Finformation},
  pouvoirs_in in 'pouvoirs_in.pas' {Fpouv_in};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFinformation, Finformation);
  Application.CreateForm(TFpouv_in, Fpouv_in);
  Application.Run;
end.


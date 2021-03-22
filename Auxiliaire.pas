unit Auxiliaire;

interface

uses
   ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdFTP, IdHTTP, OleCtrls, SHDocVw, SysUtils ;

type
  tparticipant = class
    nom, prenom, region : string;
    numero : integer;
    pouvoirs : Byte	;
    constructor create;
    destructor destroy;  override;
  end;
  tmessage = class
    particpant : tparticipant;
    choix : string ;
    nombre : Byte	;
    en_erreur : boolean;
    constructor create;
    destructor destroy;  override;
  end;
  taux = class
    messages : tstringlist;
    function getversion: String;
    function get_fichier_msg(rep : string) : string;
    procedure charge_fic_msg(fic : string);
    constructor create;
    destructor destroy;  override;
  private

  public

  end;

 procedure log_infos(mess : string; typ : integer = 0);
var
  Aux1 : taux;
  dir_exe : string;
  dir_trv : string;
  rep_msg_def: string;
  memo_tests : tstrings;
  debug : boolean;
implementation

var
   ficlog : string;


procedure log_infos(mess : string; typ : integer = 0);
var
   tf : textfile;
begin
   try
      assignfile(tf,ficlog);
      if fileexists(ficlog) then
         append(tf)
      else
         rewrite(tf);
      writeln(tf,datetostr(date)+' '+timetostr(time)+' '+ mess);
      { Insérer ici un code nécessitant un Flush avant de fermer le fichier }
      //Flush(tf);
      closefile(tf);
   except
      //pour ne pas ajouter l'erreur à l'erreur
   end;
end;

procedure taux.charge_fic_msg(fic: string);
begin
  //
end;

constructor taux.create;
begin
   dir_exe := extractfilepath(paramstr(0));
   dir_trv := dir_exe + 'docs_votes';
   forcedirectories(dir_trv);
   ficlog := dir_trv + 'infos.log';
   rep_msg_def := GetEnvironmentVariable('USERPROFILE') + '\documents\zoom\';
end;

destructor taux.destroy;
begin
  //
  inherited;
end;

function Taux.getversion: String;
Var
  fic : string;
  taille    : DWord;
  buffer    : PChar;
  datas : PChar;
  len  : DWord;
Begin
  result:='';
  buffer := nil;
  fic := Application.ExeName;
  taille := GetFileVersionInfoSize(PChar(fic), taille);
  If Taille > 0 then begin
     try
       buffer := AllocMem(taille);
       GetFileVersionInfo(PChar(fic), 0, taille, buffer);
       If VerQueryValue(buffer, PChar('\StringFileInfo\040C04E4\FileVersion'), Pointer(datas), len) then
          result:=datas;
     finally
       if buffer <> nil then
          FreeMem(buffer, taille);
     end;
   end;
end;

function taux.get_fichier_msg(rep : string): string;
var
  sr: TSearchRec ;
  dt_rep : integer;
begin
   if debug then begin memo_tests.Add(''); memo_tests.Add(rep) end;
   dt_rep := 0;
   if FindFirst(rep + '*.*', faDirectory, sr) = 0 then begin
      repeat
         if Length(sr.Name)>= 20 then begin
            if debug then memo_tests.Add(sr.name + ' ' + datetimetostr(FileDateToDateTime(sr.Time))) ;
            if sr.Time > dt_rep then begin
               result := sr.Name;
               dt_rep := sr.time;
            end;
         end;
      until FindNext(sr) <> 0;
      FindClose(sr);
      if result <> '' then result := rep + result + '\meeting_saved_chat.txt' ;
      if debug then memo_tests.Add('-> ' + result);
   end;
end;



{ tparticipant }

constructor tparticipant.create;
begin
//
end;

destructor tparticipant.destroy;
begin
//
  inherited;
end;

{ tmessage }

constructor tmessage.create;
begin
//
end;

destructor tmessage.destroy;
begin
//
  inherited;
end;

end.

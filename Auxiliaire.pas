unit Auxiliaire;

interface

uses
   SysUtils, ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
   IdFTP, IdHTTP, OleCtrls, SHDocVw;

type
  taux = class
    function getversion: String;
    function get_fichier_msg : string;
    //procedure initialise;
    constructor create;
    destructor destroy;  override;
  private

  end;

 procedure log_infos(mess : string; typ : integer = 0);
var
  Aux1 : taux;
  dir_exe : string;
  dir_trv : string;

implementation

var
   ficlog : string;
   
{procedure taux.initialise;
begin
   dir_exe := extractfilepath(paramstr(0));
   dir_trv := dir_exe + 'docs_votes';
   forcedirectories(dir_trv);
   ficlog := dir_trv + 'infos.log';
end;}



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

constructor taux.create;
begin
   dir_exe := extractfilepath(paramstr(0));
   dir_trv := dir_exe + 'docs_votes';
   forcedirectories(dir_trv);
   ficlog := dir_trv + 'infos.log';
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

{function taux.get_fichier_msg: string;
var
  sr: TSearchRec ;
  ok : boolean;
begin
   ok := false;
   if FindFirst(rep + '*.txt', 0, sr) = 0 then begin
      repeat
         ok := true;
         traite_fichier(rep + sr.Name, sr.Time, sr.Size);
      until FindNext(sr) <> 0;
      FindClose(sr);
   end;

end; }

 //GetEnvironmentVariable('USERPROFILE')
function taux.get_fichier_msg: string;
begin
//
end;



end.

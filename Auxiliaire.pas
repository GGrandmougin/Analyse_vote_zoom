unit Auxiliaire;

interface

uses
   SysUtils, ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms;

type
  taux = class
    function getversion: String;
    function get_fichier_msg : string;
    constructor create;
    destructor destroy;  override;
  private

  end;

var
  Aux1 : taux;
implementation

constructor taux.create;
begin
  //
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

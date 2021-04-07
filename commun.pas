unit commun;



interface

Uses
   ExtCtrls, types, StdCtrls, Classes, Math, Dialogs,
   Windows, graphics, strutils, Forms, SysUtils;

const
    remplAcc  : array[0..63 ] of byte = (
                           97,97,97,97,97,97,198,99,101,101,101,101,105,105,105,105,
                           208,110,111,111,111,111,111,215,216,117,117,117,117,221,222,223,
                           97,97,97,227,97,229,230,99,101,101,101,101,105,105,105,105,
                           240,110,111,111,111,245,111,247,248,117,117,117,117,117,254,255);
    IDMandataire = 0;
    NomMandataire = 1;
    PrenomMandataire = 2;
    MailMandataire = 3;
    RegionMandataire = 4;
    IDMandant = 5;
    NomMandant =6;
    PrenomMandant = 7;
    MailMandant = 8;
    RegionMandant = 9;
    DateEnvoisPouvoir = 10;
    DateReceptionPouvoir = 11;
type
    timport = procedure(strl: Tstringlist; fichier : string) of object;

procedure log_infos(mess : string; typ : integer = 0; memo : tmemo = nil);
procedure setCbPouvoirschecked(ok : boolean = true) ;
var
   debug : boolean;
   ficlog : string;
   dir_exe : string;
   dir_trv : string;
   procedure_test : TNotifyEvent;
   //p_traite_pouvoirs : TNotifyEvent;
   p_traite_pouvoirs : timport;
   cb_pouv_val : TCheckBox;
   cbpouvoirs_Checked : boolean = false;
implementation

procedure setCbPouvoirschecked(ok : boolean = true) ;
begin
   if not cbpouvoirs_Checked then begin
      cb_pouv_val.Tag := 1;
      cbpouvoirs_Checked := ok;
      cb_pouv_val.Checked := ok;
      cb_pouv_val.Tag := 0;
   end;
end;

procedure log_infos(mess : string; typ : integer = 0 ; memo : tmemo = nil);
var
   tf : textfile;
begin
   try
      if debug and (memo <> nil) then memo.lines.Add(mess);
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

end.

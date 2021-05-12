unit informations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, commun;



type
  TFinformation = class(TForm)
    RichEdit1: TRichEdit;
    P_debug: TPanel;
    Bstructure: TButton;
    Istructure: TImage;
    Lcreateur: TLabel;
    Lprnm: TLabel;
    Lnom: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BstructureClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    //strl : tstringlist;
  end;

var
  Finformation: TFinformation;
  fi_debug : boolean;
implementation

{$R *.dfm}

procedure TFinformation.FormCreate(Sender: TObject);
begin
   P_debug.Top := 0;
   P_debug.Width := ClientWidth - P_debug.Left;
   P_debug.Height := ClientHeight;
   P_debug.Visible := fi_debug ;
   richedit_self_5car( RichEdit1);
end;

procedure TFinformation.FormDestroy(Sender: TObject);
begin
   //strl.Free;
end;
{
il faut prevoir  l'augmentation du fichier messages (st-ce qu'on a l'intégralté des message mêm si on vient en cours de oute à la réunion Zoom?
que se passe passe-t-il si on quitte et on revient à la rénion ?
il faudrait que le boutons de pdebug fassent appel aux mêmes procédures que le programme habituel
}

{ EVERNOTE
- Interdiction de vote par personnes ayant donné leur pouvoir (0 pouvoir indiqué dans ce cas)
- No de blocage pour rejets xxx (ne plus augmenter les colonnes) (0 pouvoirs si déja donné 
- Hint sur image1 (avec détection position de la souris changeant le contenu)  pour details sur les causes possible de rejet 
- Messages multilignes-> remplacer les retour ligne par des espaces
- 2 traitements pour toutes les lignes: le précédent et recherche texte "configuration votes"-> liste des no de ligne
- Autres traitements uniquement les lignes dans la plage horaire (constitution d'une stringlist dédiée) 
- Remplacement par "tlm" ou "secret" 
- Radiobuttons secret et uniquement secret
- Icone pour l'application (32*32 par defaut pour Windows) icon-icons.com
- Question message d'origine dans tvote ? (pour être retrouvé dans l messages qui a pu être mise à jour) 
- Personne citées dans tableau des pouvoirs-> ajout participant dans lparticpant (texte vide) 
- Liste noms-values pour crrespondance no membre- inex dans lparticpant NON MIEUX : liste ordonnée simple avec tparticipant comme objet
- Pour CSV pouvoirs tstringlist load fromfile et pour chaque ligne remplacement point-virgule par retour ligne-> dans un autre tstringlist et accès au différents champs par un index
- Tscrutin contient une tstringlist LS de telement_scrutin qui contiennent chacun un tmessage et une tstringlist( de tmessages) . L'un ou l'autre du tmessage ou de la tsringlist est à nil. (le plus souvent c'est la tstsringlist) . Parcours de LS    -> 1) une passe remise a zero des erreur pouvoirs, du flag tansmission  et du nb voix accepté  2) une autre passe positionnement d'un booleen dans les tmessages concernés indiquant si  le nombre de voix doit être transmis ou pas + positionment de err_pouvoirs + nb de voix accepté. Avant création lvote une passe sur  lparticipant met à nil une variable telement_scrutin NON juste 3 tmessage dans dans telement_scrutin dernier_message_pour, dernier_meswage_abs, dernier_message_contre. Chaque message contient son precedant_dans_le_choix, participant contient reference au telement_scrutin une première passe met à nil tous les precedents des tmesages et les telement_scrutin des participant.
     Lorsqu'on rappel un scutin, on remet on refait la première passe et on reindique les telement_scrutin aux tparticipants et le droit d'indique le nombre de vote, le nombre le nombre de non-exprimés aux derniers message dans le choix(les precedents n'ont plus d'importance- peut-être jamais) 

- On mouse up sur composants à gauche du tstringgrid-> declenche affichage (en mode debug: checkbox pour autoriser) 
- une liste_message par fichier_message ?  si oui -> 1 liste de liste_message ou bien on ne change plus de liste_message lors d'une session de 'analyse_vote (plusieurs peuvent être lacées en //

]

{informaion aux développeurs:


}

procedure TFinformation.BstructureClick(Sender: TObject);
var
   fic :string;
begin
   if Istructure.Visible then begin
      RichEdit1.Visible := true;
      Istructure.Visible := false;
   end else begin
      RichEdit1.Visible := false;
      try
         if Istructure.Picture.Bitmap.Height < 10 then begin
            fic := extractfilepath(paramstr(0)) + 'structure_analyse_votes_4b.bmp';
            Istructure.Picture.LoadFromFile(fic);
         end;
      except
         showmessage('problème d''accès au fichier: ' + fic );
      end;
      Istructure.Visible := true;
   end;
end;

end.

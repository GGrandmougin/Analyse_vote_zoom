unit informations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

const
protocole  = '	protocole' + #13#10
+'   le membre doit indiquer comme nom dans ZOOM un texte comportant au moins son pr�nom, son nom, son N� de membre'
+'et les 3 lettres de sa r�gion. L''ordre , la casse et l''accentuation sont indiff�rents' + #13#10
+'   Un message est pris en compte uniquement s�il comporte:' + #13#10
+'�	un et un seul groupe de lettres contigu�s formant un des 4 mots "pour" , "contre" , "abs" ou "abstention" peu'
+'importe la casse' + #13#10
+'�	 un groupe au maximum de chiffres contigus (indiquant le nombre de voix)( si le groupe de chiffres est absent,'
+'cela vaut pour 1)  ("0" , "00"  sont admis indiquant 0 voix pour ce choix, utile pour une correction)' + #13#10
+'�	l''ordre est de ces groupes est indiff�rent' + #13#10
+'�	la pr�sence de caract�res autres que des lettres ou chiffres est admise et ces caract�res sont ignor�s  (exemples'
+'valides "Pour: 10." , "10 POUR" , "5 -> contre")' + #13#10
+'   Le membre peut envoyer un nombre quelconque de messages valides, seul comptera  le dernier message pour un choix'
+'donn� (pour, contre ou abstention)' + #13#10
+'   Dans le cas ou un membre envoie plus de voix que le nombre de pouvoirs qu''il poss�de:' + #13#10
+'�	s''il n''exprime qu''un seul choix , le nombre de voix est limit� au nombre de pouvoirs qu''il poss�de'  + #13#10
+'�	s''il exprime plusieurs choix, le vote est d�clar� nul (non exprim�)'+ #13#10 ;


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
    { D�clarations priv�es }
  public
    { D�clarations publiques }
    //strl : tstringlist;
  end;

var
  Finformation: TFinformation;
  fi_debug : boolean;
implementation

{$R *.dfm}

procedure TFinformation.FormCreate(Sender: TObject);
var
   fic : string;
begin
   //strl := tstringlist.Create;
   fic := extractfilepath (paramstr(0)) + 'protocole.rtf' ;
   if FileExists(fic) then begin
       try
          RichEdit1.Lines.LoadFromFile( fic);
       except
       end;
   end;
   if RichEdit1.Lines.Count < 3 then begin
      richedit1.Lines.Append(protocole);
   end;
   P_debug.Top := 0;
   P_debug.Width := ClientWidth - P_debug.Left;
   P_debug.Height := ClientHeight;
   P_debug.Visible := fi_debug ;
   //strl.Assign(RichEdit1.Lines);
   //strl.SaveToFile('E:\GitHub\Analyse_vote_zoom\infos\protocole_richedit.rtf');
end;

procedure TFinformation.FormDestroy(Sender: TObject);
begin
   //strl.Free;
end;
{
il faut prevoir  l'augmentation du fichier messages (st-ce qu'on a l'int�gralt� des message m�m si on vient en cours de oute � la r�union Zoom?
que se passe passe-t-il si on quitte et on revient � la r�nion ?
il faudrait que le boutons de pdebug fassent appel aux m�mes proc�dures que le programme habituel
}

{ EVERNOTE
- Interdiction de vote par personnes ayant donn� leur pouvoir (0 pouvoir indiqu� dans ce cas)
- No de blocage pour rejets xxx (ne plus augmenter les colonnes) (0 pouvoirs si d�ja donn�
- Hint sur image1 (avec d�tection position�de la souris�changeant le contenu)� pour details sur les causes possible de rejet�
- Messages multilignes-> remplacer les retour ligne par des espaces
- 2 traitements pour toutes les lignes: le pr�c�dent et recherche texte "configuration votes"-> liste des no de ligne
- Autres traitements uniquement les�lignes dans la plage horaire (constitution d'une stringlist d�di�e)�
- Remplacement par "tlm" ou "secret"�
- Radiobuttons secret et uniquement secret
- Icone pour l'application (32*32 par defaut pour Windows) icon-icons.com
- Question message d'origine dans tvote ? (pour �tre retrouv� dans l messages qui a pu �tre mise � jour)�
- Personne cit�es dans tableau des pouvoirs-> ajout participant dans lparticpant (texte vide)�
- Liste noms-values pour crrespondance no membre- inex dans lparticpant NON�MIEUX : liste ordonn�e�simple avec tparticipant comme objet
- Pour CSV pouvoirs tstringlist load fromfile et pour chaque ligne remplacement point-virgule par�retour ligne-> dans un autre tstringlist et acc�s au diff�rents champs par un index
- Tscrutin contient une tstringlist LS�de telement_scrutin qui contiennent chacun un tmessage et une tstringlist( de tmessages) . L'un ou l'autre du tmessage ou de la tsringlist est � nil. (le plus souvent c'est la tstsringlist) . Parcours de LS�� �-> 1) une passe remise a zero des erreur pouvoirs, du flag tansmission� et�du�nb voix accept� 2) une autre passe�positionnement d'un booleen dans les tmessages concern�s indiquant si� le nombre de voix doit �tre transmis ou pas + positionment de err_pouvoirs + nb de voix accept�. Avant cr�ation lvote une passe sur� lparticipant met � nil une variable telement_scrutin NON juste 3 tmessage dans dans telement_scrutin dernier_message_pour, dernier_meswage_abs, dernier_message_contre. Chaque message contient son precedant_dans_le_choix, participant contient reference au telement_scrutin�une premi�re passe met � nil tous les precedents des tmesages et les telement_scrutin des participant.
     Lorsqu'on rappel un scutin, on remet on refait la premi�re passe et on reindique les telement_scrutin aux tparticipants et le droit d'indique le nombre de vote, le nombre le nombre de non-exprim�s aux derniers message dans le choix(les precedents n'ont plus d'importance- peut-�tre jamais)�

- On mouse up sur composants � gauche du tstringgrid-> declenche affichage (en mode debug: checkbox pour autoriser)�
- une liste_message par fichier_message ?� si oui -> 1 liste de liste_message ou bien on ne change plus de liste_message lors d'une session de 'analyse_vote (plusieurs peuvent �tre lac�es en //

]

{informaion aux d�veloppeurs:


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
         showmessage('probl�me d''acc�s au fichier: ' + fic );
      end;
      Istructure.Visible := true;
   end;
end;

end.

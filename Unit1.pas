unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);


  private

  function generate_captcha :string ;

    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
procedure TForm1.Button1Click(Sender: TObject);
begin
  if Edit1.Text=Label1.Caption  then
     ShowMessage('captcha corecte !')
    else
       begin
           ShowMessage('captcha incorecte ! please try again !') ;
           Label1.Caption:=generate_captcha ;
           Edit1.Text:= '';
       end;

end;



procedure TForm1.FormCreate(Sender: TObject);
begin
   randomize ;
   Label1.Caption:= generate_captcha ;
   Edit1.Text:= '' ;
end;

function TForm1.generate_captcha;
var
captcha:string ;
i:integer ;

begin
    captcha:= '' ;
    i:=8 + random(7) ;
    for i := 1 to 4 do
      captcha:= captcha + chr(33+random(93));
      result:=captcha ;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
   Label1.Caption:= generate_captcha ;
   Edit1.Text:= '' ;
end;



end.

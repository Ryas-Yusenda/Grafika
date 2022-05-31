unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, Spin, Math;

type
  Elemen=record
  x,y, y0, y1: Integer;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    buttonbelahketupat: TSpeedButton;
    buttonhapus1: TSpeedButton;
    buttonlayang2: TSpeedButton;
    buttonpensil1: TSpeedButton;
    buttonwarna1: TSpeedButton;
    GroupBox9: TGroupBox;
    ImageList1: TImageList;
    Label4: TLabel;
    Label5: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    buttonkiri: TSpeedButton;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpinEdit1: TSpinEdit;
    vertikalbutton: TButton;
    ColorDialog1: TColorDialog;
    cbpen: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    GroupBox8: TGroupBox;
    Label3: TLabel;
    horizontalbutton: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    labelmidpoint: TLabel;
    Rotate: TGroupBox;
    buttonpersegi: TSpeedButton;
    buttonsegitiga: TSpeedButton;
    buttonjajargenjang: TSpeedButton;
    buttonatas: TSpeedButton;
    buttonkananatas: TSpeedButton;
    buttonkanan: TSpeedButton;
    buttonkiribawah: TSpeedButton;
    buttonbawah: TSpeedButton;
    buttonkananbawah: TSpeedButton;
    midpointkiri: TSpeedButton;
    midpointkanan: TSpeedButton;
    centerpointkiri: TSpeedButton;
    centerpointkanan: TSpeedButton;
    mirror1: TSpeedButton;
    mirror2: TSpeedButton;
    newpage: TSpeedButton;
    openproject: TSpeedButton;
    saveproject: TSpeedButton;
    tekswidth: TSpinEdit;
    zoominbutton: TSpeedButton;
    zoomoutbutton: TSpeedButton;
    tekscenterpoint: TSpinEdit;
    teksmidpoint: TSpinEdit;
    teksgeser: TSpinEdit;
    trapesiumbutton: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure GroupBox9Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1Resize(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure newpageClick(Sender: TObject);
    procedure openprojectClick(Sender: TObject);
    procedure saveprojectClick(Sender: TObject);
    procedure Shape1ChangeBounds(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure tekswidthChange(Sender: TObject);
    procedure ToggleBox1Change(Sender: TObject);
    procedure vertikalbuttonClick(Sender: TObject);
    procedure buttonatasClick(Sender: TObject);
    procedure buttonbawahClick(Sender: TObject);
    procedure buttonbelahketupatClick(Sender: TObject);
    procedure buttonhapusClick(Sender: TObject);
    procedure buttonkananatasClick(Sender: TObject);
    procedure buttonkananbawahClick(Sender: TObject);
    procedure buttonkananClick(Sender: TObject);
    procedure buttonkiriatasClick(Sender: TObject);
    procedure buttonkiribawahClick(Sender: TObject);
    procedure buttonkiriClick(Sender: TObject);
    procedure buttonlayang2Click(Sender: TObject);
    procedure buttonpensilClick(Sender: TObject);
    procedure buttonpersegiClick(Sender: TObject);
    procedure buttonsegitigaClick(Sender: TObject);
    procedure buttonjajargenjangClick(Sender: TObject);
    procedure cbpenChange(Sender: TObject);
    procedure centerpointkananClick(Sender: TObject);
    procedure centerpointkiriClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ClearCanvas();
    procedure hapusobjek();
    procedure horizontalbuttonClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure midpointkananClick(Sender: TObject);
    procedure midpointkiriClick(Sender: TObject);
    procedure mirror2Click(Sender: TObject);
    procedure movecolor(Sender: TObject);
    procedure penstyle();
    procedure gambar();
    procedure mid();
    procedure FloodFill(x,y,fill,current:integer);
    procedure buttonwarnaClick(Sender: TObject);
    procedure mirror1Click(Sender: TObject);
    procedure resetClick(Sender: TObject);
    procedure trapesiumbuttonClick(Sender: TObject);
    procedure zoominbuttonClick(Sender: TObject);
    procedure zoomoutbuttonClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  objek: array[1..6] of elemen;
  klik,warna: boolean;
  tool,style: string;
  TempObjek: array[1..6] of elemen;
  mc: elemen;
  UkuranObject,scale,i,j,a,b,x0,y0: integer;
  warnai: TColor;
  x01,y01:Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormActivate(Sender: TObject);
begin
  warnai:=clWhite;
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(0,0,Image1.Width,Image1.Height);
end;

procedure TForm1.cbpenChange(Sender: TObject);
begin
  case cbpen.ItemIndex of
  0: style:='solid';
  1: style:='dot';
  2: style:='dash';
  3: style:='dashdot';
  4: style:='dashdotdot';
  end;
end;

procedure TForm1.centerpointkananClick(Sender: TObject);
var
   TempObjek: array[1..6] of elemen;
   n,m: integer;
   Sdt: real;
   q: real;
begin
   q:=StrToFloat(tekscenterpoint.Text);
   for i:=1 to 4 do
   begin
      n:=Objek[3].x;
      m:=Objek[3].y;
      Objek[i].x:=Objek[i].x-n;
      objek[i].y:=objek[i].y-m;
      sdt:=q*pi/180;
      TempObjek[i].x:=round(objek[i].x*cos(sdt)-objek[i].y*sin(sdt));
      TempObjek[i].y:=round(objek[i].x*sin(sdt)+objek[i].y*cos(sdt));
      objek[i]:=TempObjek[i];
      objek[i].x:=objek[i].x+n;
      objek[i].y:=objek[i].y+m;
   end;
   movecolor(Sender);
   hapusobjek();
   gambar();
   if warna=true then
      FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.centerpointkiriClick(Sender: TObject);
var
   TempObjek: array[1..6] of elemen;
   n,m: integer;
   Sdt: real;
   q: real;
begin
   q:=StrToFloat(tekscenterpoint.Text);
    for i:=1 to 4 do
    begin
       n:=Objek[3].x;
       m:=Objek[3].y;
       Objek[i].x:=Objek[i].x-n;
       objek[i].y:=objek[i].y-m;
       sdt:=q*pi/180;
       TempObjek[i].y:=round(objek[i].y*cos(sdt)-objek[i].x*sin(sdt));
       TempObjek[i].x:=round(objek[i].y*sin(sdt)+objek[i].x*cos(sdt));
       objek[i]:=TempObjek[i];
       objek[i].x:=objek[i].x+n;
       objek[i].y:=objek[i].y+m;
    end;
    movecolor(Sender);
    hapusobjek();
    gambar();
    if warna=true then
       FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonpersegiClick(Sender: TObject);
begin
  tool:='kotak';
  warna:=false;
  klik:=false;
  UkuranObject:=4;
  movecolor(Sender);
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonlayang2Click(Sender: TObject);
begin
  tool:='layanglayang';
  warna:=false;
  klik:=false;
  UkuranObject:=4;
  movecolor(Sender);
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonsegitigaClick(Sender: TObject);
begin
  tool:='segitiga';
  warna:=false;
  klik:=false;
  UkuranObject:=3;
  movecolor(Sender);
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonjajargenjangClick(Sender: TObject);
begin
  tool:='jajargenjang';
  warna:=false;
  klik:=false;
  UkuranObject:=4;
  movecolor(Sender);
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonbelahketupatClick(Sender: TObject);
begin
  tool:='belahketupat';
  warna:=false;
  klik:=false;
  UkuranObject:=4;
  movecolor(Sender);
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.trapesiumbuttonClick(Sender: TObject);
begin
  tool:='trapesium';
  warna:=false;
  klik:=false;
  UkuranObject:=4;
  movecolor(Sender);
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonkiriClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x-teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);

end;

procedure TForm1.buttonkananatasClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x+teksgeser.Value;
      Objek[i].y := Objek[i].y-teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonkananbawahClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x+teksgeser.Value;
      Objek[i].y := Objek[i].y+teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonkananClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x+teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonatasClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].y := Objek[i].y-teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.horizontalbuttonClick(Sender: TObject);
begin
  j:=SpinEdit1.Value;
  if UkuranObject=3 then
  begin
       Objek[1].x := round(Objek[1].x-(0.5*Tan(j))*(Objek[3].y-Objek[1].y));
       Objek[2].x := round(Objek[2].x+(0.5*Tan(j))*(Objek[3].y-Objek[1].y));
       Objek[3].x := round(Objek[3].x-(0.5*Tan(j))*(Objek[3].y-Objek[1].y));
       FormActivate(Sender);
       movecolor(Sender);
       gambar();
       if warna=true then
          FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
  end;
  if UkuranObject=4 then
  begin
       Objek[1].x := round(Objek[1].x+ (0.5*Tan(j))*(Objek[3].y-Objek[2].y));
       Objek[2].x := round(Objek[2].x+ (0.5*Tan(j))*(Objek[3].y-Objek[2].y));
       Objek[3].x := round(Objek[3].x- (0.5*Tan(j))*(Objek[3].y-Objek[2].y));
       Objek[4].x := round(Objek[4].x- (0.5*Tan(j))*(Objek[3].y-Objek[2].y));
       FormActivate(Sender);
       movecolor(Sender);
       gambar();
       if warna=true then
          FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
  end;
end;

procedure TForm1.vertikalbuttonClick(Sender: TObject);
begin
  j:=SpinEdit1.Value;
  if UkuranObject=3 then
  begin
       Objek[1].y := Objek[1].y-10;
       Objek[2].y := Objek[2].y+10;
       Objek[3].y := Objek[3].y+10;
       FormActivate(Sender);
       movecolor(Sender);
       gambar();
       if warna=true then
          FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
  end;
  if UkuranObject=4 then
  begin
       Objek[2].y := round(Objek[2].y + Tan(j) * (Objek[1].x - Objek[2].x));
       Objek[3].y := round(Objek[3].y + Tan(j) * (Objek[1].x - Objek[2].x));
       FormActivate(Sender);
       movecolor(Sender);
       gambar();
       if warna=true then
          FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
  end;

end;

procedure TForm1.newpageClick(Sender: TObject);
begin
  FormActivate(Sender);
end;

procedure TForm1.openprojectClick(Sender: TObject);
begin
  if OpenDialog1.Execute then Image1.Picture.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.saveprojectClick(Sender: TObject);
begin
  if SaveDialog1.Execute then Image1.Picture.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.Shape1ChangeBounds(Sender: TObject);
begin

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x-teksgeser.Value;
      Objek[i].y := Objek[i].y-teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  tool:='garis';
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin

end;

procedure TForm1.tekswidthChange(Sender: TObject);
begin

end;

procedure TForm1.ToggleBox1Change(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x-teksgeser.Value;
      Objek[i].y := Objek[i].y-teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.buttonbawahClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].y := Objek[i].y+teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);

end;

procedure TForm1.buttonpensilClick(Sender: TObject);
begin
  tool:='pensil';
end;

procedure TForm1.buttonhapusClick(Sender: TObject);
begin
  tool:='penghapus';
end;

procedure TForm1.buttonkiribawahClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x-teksgeser.Value;
      Objek[i].y := Objek[i].y+teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
  end;


procedure TForm1.buttonkiriatasClick(Sender: TObject);
begin
  for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x+teksgeser.Value;
      Objek[i].y := Objek[i].y+teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.ClearCanvas();
begin
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.Fillrect(0,0,Image1.Width,Image1.Height);
end;

procedure TForm1.mid();
begin
  a:=0;
  b:=0;
  for j:=1 to UkuranObject do
   begin
      a:=a+objek[j].x;
      b:=b+objek[j].y;
   end;
   a:=a div UkuranObject;
   b:=b div UkuranObject;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  x0:=X;
  y0:=Y;
  Image1.Canvas.MoveTo(340,405);
  if (tool='pensil') or (tool='penghapus') then
  begin
      Image1.Canvas.MoveTo(X,Y);
      klik:=true;
  end;
  if (tool='garis') then
  begin
    x01:=X;
    y01:=Y;
  end;
  if tool='warnai' then
  begin
     Image1.Canvas.Brush.Color:=ColorDialog1.Color;
     Image1.Canvas.FloodFill(X,Y,Image1.Canvas.Pixels[X,Y],fsSurface);
     warnai:=ColorDialog1.Color;
  end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  xx, yy: String;
begin
  xx:=IntToStr(X);
  yy:=IntToStr(Y);
  Edit1.Text:=xx;
  Edit2.Text:=yy;

  if klik then
  begin
      if tool='pensil' then
      begin
          penstyle();
          Image1.Canvas.LineTo(X,Y);
      end;
      if tool='penghapus' then
      begin
          Image1.Canvas.Pen.Color:=clWhite;
          Image1.Canvas.Pen.Width:=tekswidth.Value;
          Image1.Canvas.LineTo(X,Y);
      end;
  end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  klik:=false;
  begin

  if (tool='garis') then
  begin
    penstyle();
    Image1.Canvas.MoveTo(x01,y01);
    Image1.Canvas.LineTo(X,Y);
  end;
  if tool='kotak' then
  begin
    objek[1].x:=x0;  objek[1].y:=y0;
    objek[2].x:=X;   objek[2].y:=y0;
    objek[3].x:=X;   objek[3].y:=Y;
    objek[4].x:=x0;  objek[4].y:=Y;
    objek[5].x:=x0;  objek[5].y:=y0;
    UkuranObject:=4;
    penstyle();
    gambar();
  end;
  if tool='segitiga' then
  begin
    objek[1].x:=x0;            objek[1].y:=Y;
    objek[2].x:=(X+x0)div 2;   objek[2].y:=y0;
    objek[3].x:=X;             objek[3].y:=Y;
    //objek[4].x:=x0;            objek[4].y:=Y;
    UkuranObject:=3;
    penstyle();
    gambar();
    klik:=false;
  end;
  if tool='trapesium' then
  begin
    Objek[1].x := x0+((X-x0) div 4);  Objek[1].y := y0;
    Objek[2].x := X-((X-x0) div 4);   Objek[2].y := y0;
    Objek[3].x := X;                  Objek[3].y := Y;
    Objek[4].x := x0;                 Objek[4].y := Y;
    //Objek[5].x := x0+((X-x0) div 4);  Objek[5].y := y0;
    UkuranObject:=4;
    penstyle();
    gambar();
  end;
  if tool='jajargenjang' then
  begin
    Objek[1].x := x0+((X-x0) div 4);  Objek[1].y := y0;
    Objek[2].x := X+((X-x0) div 4);   Objek[2].y := y0;
    Objek[3].x := X;                  Objek[3].y := Y;
    Objek[4].x := x0;                 Objek[4].y := Y;
    //Objek[5].x := x0+((X-x0) div 4);  Objek[5].y := y0;
    UkuranObject:=4;
    penstyle();
    gambar();
  end;
  if tool='belahketupat' then
  begin
    Objek[1].x := x0;                 Objek[1].y := y0;
    Objek[2].x := x0-(X-x0) div 2;    Objek[2].y := y0+(Y-y0) div 2;
    Objek[3].x := x0;                 Objek[3].y := y0+Y-y0;
    Objek[4].x := x0+(X-x0) div 2;    Objek[4].y := y0+(Y-y0) div 2;
    //Objek[5].x := x0;                 Objek[5].y := y0;
    UkuranObject:=4;
    penstyle();
    gambar();
  end;
  if tool='layanglayang' then
  begin
    Objek[1].x := x0;                 Objek[1].y := y0;
    Objek[2].x := x0-(X-x0) div 2;    Objek[2].y := y0+(Y-y0) div 2;
    Objek[3].x := x0;                 Objek[3].y := y0+Y;
    Objek[4].x := x0+(X-x0) div 2;    Objek[4].y := y0+(Y-y0) div 2;
    //Objek[5].x := x0;                 Objek[5].y := y0;
    UkuranObject:=4;
    penstyle();
    gambar();
  end;

  end;
end;

procedure TForm1.Image1Resize(Sender: TObject);
begin

end;

procedure TForm1.Label4Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox9Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
   for i:=1 to UkuranObject do
  begin
      Objek[i].x := Objek[i].x-teksgeser.Value;
      Objek[i].y := Objek[i].y-teksgeser.Value;
  end;
  movecolor(Sender);
  hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.midpointkananClick(Sender: TObject);
var
   TempObjek:array[1..6] of elemen;
   n,m: integer;
   Sdt: real;
   j: real;
begin
   j:=StrToFloat(teksmidpoint.Text);
   n:=(objek[1].x+Objek[3].x)div 2;
   m:=(objek[1].y+Objek[3].y)div 2;
   for i:=1 to 4 do
   begin
       Objek[i].x:=Objek[i].x-n;
       objek[i].y:=objek[i].y-m;
       sdt:=j*pi/180;
       TempObjek[i].x:=round(objek[i].x*cos(sdt)-objek[i].y*sin(sdt));
       TempObjek[i].y:=round(objek[i].x*sin(sdt)+objek[i].y*cos(sdt));
       objek[i]:=TempObjek[i];
       objek[i].x:=objek[i].x+n;
       objek[i].y:=objek[i].y+m;
   end;
   movecolor(Sender);
   hapusobjek();
   gambar();
   if warna=true then
      FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.midpointkiriClick(Sender: TObject);
var
   TempObjek:array[1..6] of elemen;
   n,m: integer;
   Sdt: real;
   j: real;
begin
   j:=StrToFloat(teksmidpoint.Text);
   n:=(objek[1].x+Objek[3].x)div 2;
   m:=(objek[1].y+Objek[3].y)div 2;
   for i:=1 to 4 do
   begin
       Objek[i].x:=Objek[i].x-n;
       objek[i].y:=objek[i].y-m;
       sdt:=j*pi/180;
       TempObjek[i].y:=round(objek[i].y*cos(sdt)-objek[i].x*sin(sdt));
       TempObjek[i].x:=round(objek[i].y*sin(sdt)+objek[i].x*cos(sdt));
       objek[i]:=TempObjek[i];
       objek[i].x:=objek[i].x+n;
       objek[i].y:=objek[i].y+m;
   end;
   movecolor(Sender);
   hapusobjek();
   gambar();
   if warna=true then
      FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

procedure TForm1.mirror2Click(Sender: TObject);
var
  m,n: integer;
begin
  m:=Image1.Width;
  n:=Image1.Height div 2;
  Image1.Canvas.MoveTo(0,n);
  Image1.Canvas.LineTo(m,n);
  for i:=1 to UkuranObject do
  begin
      objek[i].y:=(objek[i].y-(2*(objek[i].y-n)));
      objek[i].x:=objek[i].x;
  end;
  Image1.Canvas.MoveTo(objek[UkuranObject].x, objek[UkuranObject].y);
  for i:=1 to UkuranObject do
  begin
      Image1.Canvas.LineTo(objek[i].x,objek[i].y);
  end;
  movecolor(Sender);
  //hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);

end;

procedure TForm1.movecolor(Sender: TObject);
begin
   mc.x:=0;
   mc.y:=0;
   for i:=1 to UkuranObject do
   begin
       mc.x:=mc.x+objek[i].x;
       mc.y:=mc.y+objek[i].y;
   end;
   mc.x:=mc.x div UkuranObject;
   mc.y:=mc.y div UkuranObject;
end;

procedure TForm1.gambar();
var
  i: integer;
begin
    Image1.Canvas.MoveTo(objek[UkuranObject].x,objek[UkuranObject].y);
    for i:=1 to UkuranObject do
    begin
      Image1.Canvas.LineTo(objek[i].x,objek[i].y);
    end;
end;

procedure TForm1.FloodFill(x,y,fill,current:integer);
begin
  if Image1.Canvas.Pixels[x,y]=current then
  begin
    Image1.Canvas.Pixels[x,y]:=fill;
    floodFill(x+1,y,fill,current);
    floodFill(x-1,y,fill,current);
    floodFill(x,y+1,fill,current);
    floodFill(x,y-1,fill,current);
  end;
end;

procedure TForm1.resetClick(Sender: TObject);
begin
  ClearCanvas();
  FormActivate(Sender);
end;

procedure TForm1.zoomoutbuttonClick(Sender: TObject);
begin
  if UkuranObject=3 then
  begin
         objek[1].x:=objek[1].x+10;
         objek[1].y:=objek[1].y-10;
         objek[2].x:=objek[2].x;
         objek[2].y:=objek[2].y+10;
         objek[3].x:=objek[3].x-10;
         objek[3].y:=objek[3].y-10;
      FormActivate(Sender);
      movecolor(Sender);
      gambar();
      if warna=true then
         FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
  end;
  if UkuranObject=4 then
  begin
  scale :=(objek[1].x+objek[3].x) div 20;
      begin
           objek[1].x:=objek[1].x+scale;
           objek[1].y:=objek[1].y+scale;
           objek[2].x:=objek[2].x-scale;
           objek[2].y:=objek[2].y+scale;
           objek[3].x:=objek[3].x-scale;
           objek[3].y:=objek[3].y-scale;
           objek[4].x:=objek[4].x+scale;
           objek[4].y:=objek[4].y-scale;
      FormActivate(Sender);
      movecolor(Sender);
      gambar();
      if warna=true then
         FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
      end;
  end;
end;

procedure TForm1.zoominbuttonClick(Sender: TObject);
begin
  if UkuranObject=3 then
  begin
         objek[1].x:=objek[1].x-10;
         objek[1].y:=objek[1].y+10;
         objek[2].x:=objek[2].x;
         objek[2].y:=objek[2].y-10;
         objek[3].x:=objek[3].x+10;
         objek[3].y:=objek[3].y+10;
      FormActivate(Sender);
      movecolor(Sender);
      gambar();
      if warna=true then
         FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
  end;
  if UkuranObject=4 then
  begin
  scale :=(objek[1].x+objek[3].x) div 20;
      begin
           objek[1].x:=objek[1].x-scale;
           objek[1].y:=objek[1].y-scale;
           objek[2].x:=objek[2].x+scale;
           objek[2].y:=objek[2].y-scale;
           objek[3].x:=objek[3].x+scale;
           objek[3].y:=objek[3].y+scale;
           objek[4].x:=objek[4].x-scale;
           objek[4].y:=objek[4].y+scale;
      FormActivate(Sender);
      movecolor(Sender);
      gambar();
      if warna=true then
         FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);

      end;
  end;
end;

procedure TForm1.hapusobjek();
begin
  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(0,0,Image1.Width,Image1.Height);
  Image1.Canvas.Brush.Color:=warnai;
end;

procedure TForm1.penstyle();
begin
    Image1.Canvas.Pen.Color:=ColorDialog1.Color;
    case style of
    'solid':
        Image1.Canvas.Pen.Style:=psSolid;
    'dot':
        Image1.Canvas.Pen.Style:=psDot;
    'dash':
        Image1.Canvas.Pen.Style:=psDash;
    'dashdot':
        Image1.Canvas.Pen.Style:=psDashDot;
    'dashdotdot':
        Image1.Canvas.Pen.Style:=psDashDotDot;
    end;
    Image1.Canvas.Pen.Width:=tekswidth.Value;
end;

procedure TForm1.buttonwarnaClick(Sender: TObject);
begin
  tool:='warnai';
  warna:=true;
  ColorDialog1.Execute;
end;

procedure TForm1.mirror1Click(Sender: TObject);
var
  m,n: integer;
begin
  m:=Image1.Width div 2;
  n:=Image1.Height;
  Image1.Canvas.MoveTo(m,0);
  Image1.Canvas.LineTo(m,n);
  for i:=1 to UkuranObject do
  begin
      objek[i].x:=(objek[i].x-(2*(objek[i].x-m)));
      objek[i].y:=objek[i].y;
  end;
  Image1.Canvas.MoveTo(objek[UkuranObject].x, objek[UkuranObject].y);
  for i:=1 to UkuranObject do
  begin
      Image1.Canvas.LineTo(objek[i].x,objek[i].y);
  end;
  movecolor(Sender);
  //hapusobjek();
  gambar();
  if warna=true then
     FloodFill(mc.x,mc.y,ColorDialog1.Color,Image1.Canvas.Pixels[mc.x,mc.y]);
end;

end.


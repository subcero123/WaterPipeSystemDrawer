unit tarea111;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Menus,ShellApi;

type
  TForm1 = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Button13: TButton;
    Panel2: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    PopupMenu1: TPopupMenu;
    abrir1: TMenuItem;
    Guardar1: TMenuItem;
    Salir1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Panel3: TPanel;
    Button14: TButton;
    Button15: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure abrir1Click(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

type recta = Packed record
x1,y1,x2,y2 : Integer;
end;

type forma = packed record
x1,y1 : Integer;
ang : Real;
end;


var
  Form1: TForm1;
  x1,y1,x2,y2 : Integer;
  casa0,casa90,casa180,casa270,edificio0,edificio90,edificio180,edificio270,medidor,valvula,bomba,distribuidor : TBitMap;
  casas,edificios,medidores,valvulas,bombas,distribuidores : array[0..100] of forma;
  mangueras,tubos : array[0..100] of recta;
  ncasas,nedificios,nmedidor,nvalvula,nbomba,ndistribuidor,nmangueras,ntubos : Integer;
  ang : Real;

    Bitmap, Bitmap2: TBitmap;
    Rec: TRect;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  x,y,i : Integer;
begin

  ncasas:=0;
  nedificios:=0;
  nmedidor:=0;
  nvalvula:=0;
  nbomba:=0;
  ndistribuidor:=0;
  nmangueras:=0;
  ntubos:=0;
  casa0 := TBitMap.Create;   //     CASA
  casa0.LoadFromFile('casa.bmp');
  casa0.Transparent := TRUE;
  //casa0.TransparentColor:= clWhite;
  casa90:= TBitMap.Create;
  casa90.LoadFromFile('casa90.bmp');
  casa90.Transparent := TRUE;
  //casa90.TransparentColor := clWhite;
  casa180:= TBitMap.Create;
  casa180.LoadFromFile('casa180.bmp');
  casa180.Transparent := TRUE;
  //casa180.TransparentColor := clWhite;
  casa270:= TBitMap.Create;
  casa270.LoadFromFile('casa270.bmp');
  casa270.Transparent := TRUE;
  //casa270.TransparentColor := clWhite;
  edificio90 := TBitMap.Create;
  edificio90.LoadFromFile('edificio.bmp');
  edificio90.Transparent := TRUE;
  //edificio90.TransparentColor := clWhite;
  edificio0 := TBitMap.Create;
  edificio0.LoadFromFile('edificio0.bmp');
  edificio0.Transparent := TRUE;
  //edificio0.TransparentColor := clWhite;
  edificio180 := TBitMap.Create;
  edificio180.LoadFromFile('edificio180.bmp');
  edificio180.Transparent := TRUE;
  //edificio180.TransparentColor := clWhite;
  edificio270 := TBitMap.Create;
  edificio270.LoadFromFile('edificio270.bmp');
  edificio270.Transparent := TRUE;
 // edificio270.TransparentColor := clWhite;
  medidor := TbitMap.Create;
  medidor.LoadFromFile('medidor.bmp');
  medidor.Transparent := TRUE;
  medidor.TransparentColor := clWhite;
  valvula := TBitMap.Create;
  valvula.LoadFromFile('valvula.bmp');
  valvula.Transparent := TRUE;
  valvula.TransparentColor := clWhite;
  bomba := TBitMap.Create;
  bomba.LoadFromFile('bomba.bmp');
  bomba.Transparent := TRUE;
  //bomba.TransparentColor := clWhite;
  distribuidor := TBitMap.Create;
  distribuidor.LoadFromFile('distribuidor.bmp');
  distribuidor.Transparent := TRUE;
  distribuidor.TransparentColor := clWhite;

  //Pantalla completa

  Form1.Position := poDefaultPosOnly;
  Form1.BorderStyle := bsToolWindow  ;
  Form1.Left := 0;
  Form1.Top := 0;
  Form1.Width := Screen.Width;
  Form1.Height := Screen.Height;

  x :=0;
  y := 0;
 for i := 0 to 200 do
 begin
      Image1.Canvas.Pen.Color := clGray;
     Image1.Canvas.MoveTo(x,0);
     Image1.Canvas.LineTo(x,2000);
     x := x+10;
     Image1.Canvas.MoveTo(0,Y);
     Image1.Canvas.LineTo(2000,Y);
     y := y+10;
  end;
end;

procedure restaurar(x1,y1 :Integer;Image1: Timage;obj :forma);
var x,y,i: Integer;
begin;
Image1.Canvas.Pen.Color := clWhite;
Image1.Canvas.Pen.Width := 1;
Image1.Canvas.Rectangle(obj.x1,obj.y1,obj.x1+80,obj.y1+80);  //borrar y restaurar malla
  x :=obj.x1;
  y := obj.y1;
Image1.Canvas.Pen.Color := clGray;
 for i := 0 to 8 do
 begin
     Image1.Canvas.MoveTo(obj.x1,y);
     Image1.Canvas.LineTo(obj.x1+80,y);
     Image1.Canvas.MoveTo(x,obj.y1);
     Image1.Canvas.LineTo(x,obj.y1+80);
     y := y+10;
     x := x+10;
  end;
end;

procedure rest(ob:recta;Image1: Timage);
var di,i,yg,xg,xp,yp,x,y : Integer;
begin;
  if (ob.y1<ob.y2)then
    begin;
      yg := ob.y2;
      yp := ob.y1;
    end
  else
    begin;
      yg := ob.y1;
      yp := ob.y2;
    end;
  if (ob.x1<ob.x2)then
    begin
      xg := ob.x2;
      xp := ob.x1;
    end
  else
    begin;
      xg := ob.x1;
      xp := ob.x2;
    end;
di :=round((xg-xp)/10);
Image1.Canvas.Pen.Color := clGray;
Image1.Canvas.Pen.Width := 1;
x := xp;
y := yp;
 for i := 0 to di do
 begin
     Image1.Canvas.MoveTo(x,yp);
     Image1.Canvas.LineTo(x,yg);
     x := x+10;
  end;
  di := round((yg-yp)/10);
   for i := 0 to di do
 begin
     Image1.Canvas.MoveTo(xp,y);
     Image1.Canvas.LineTo(xg,y);
     y:= y+10;
  end;
end;

procedure eliminarArr(var arr : Array of forma;actual,n : Integer);
var i : Integer;
begin
i := actual;
while(i<n-1) do
begin
    arr[i] := arr[i+1];
    i := i+1;
end;
    arr[i].x1 := 0;
    arr[i].y1 := 0;
    arr[i].ang:= 0;
end;

procedure elim(arr :Array of recta;actual,n: Integer);
var i : Integer;
begin;
i := actual;
while(i<n-1) do
  begin
    arr[i] := arr[i+1];
    i := i+1;
  end;
  arr[i].x1 := 0;
  arr[i].y1 := 0;
  arr[i].x2 := 0;
  arr[i].y2 := 0;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

begin
x1 := round(X/10)*10;
y1 := round(Y/10)*10;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
x2 := round(X/10)*10;
y2 := round(Y/10)*10;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if(x1=x2) and(y1=y2)then
exit;
Image1.Canvas.Pen.Color := clBlack;
Image1.Canvas.Pen.Width := 6;
image1.Canvas.MoveTo(x1,y1);
image1.Canvas.LineTo(x2,y2);
mangueras[nmangueras].x1 := x1;
mangueras[nmangueras].x2 := x2;
mangueras[nmangueras].y1 := y1;
mangueras[nmangueras].y2 := y2;
nmangueras := nmangueras +1;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if(x1=x2) and(y1=y2)then
exit;
Image1.Canvas.Pen.Color := rgb(184,115,51) ;
Image1.Canvas.Pen.Width := 4;
image1.Canvas.MoveTo(x1,y1);
image1.Canvas.LineTo(x2,y2);
Image1.Canvas.Pen.Color := clBlack;

tubos[ntubos].x1 := x1;
tubos[ntubos].x2 := x2;
tubos[ntubos].y1 := y1;
tubos[ntubos].y2 := y2;
ntubos := ntubos +1;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
if (ang = 90) then
Image1.Canvas.Draw(x1,y1,casa90)
else if (ang =180) then
Image1.Canvas.Draw(x1,y1,casa180)
else if (ang =270) then
Image1.Canvas.Draw(x1,y1,casa270)
else
Image1.Canvas.Draw(x1,y1,casa0);
casas[ncasas].x1 := x1;
casas[ncasas].y1 := y1;
casas[ncasas].ang := ang;
ncasas := ncasas +1;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
if (ang = 90) then
Image1.Canvas.Draw(x1,y1,edificio90)
else if (ang = 180) then
Image1.Canvas.Draw(x1,y1,edificio180)
else if (ang = 270) then
Image1.Canvas.Draw(x1,y1,edificio270)
else
Image1.Canvas.Draw(x1,y1,edificio0);
edificios[nedificios].x1 := x1;
edificios[nedificios].y1 := y1;
edificios[nedificios].ang := ang;
nedificios := nedificios +1;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
medidores[nmedidor].y1 := y1;
medidores[nmedidor].x1 := x1;
Image1.Canvas.Draw(x1,y1,medidor);
medidores[nmedidor].ang := ang;
nmedidor := nmedidor +1;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
valvulas[nvalvula].y1 := y1;
valvulas[nvalvula].x1 := x1;
Image1.Canvas.Draw(x1,y1,valvula);
nvalvula := nvalvula +1;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin

bombas[nbomba].y1 := y1;
bombas[nbomba].x1 := x1;
Image1.Canvas.Draw(x1,y1,bomba);
nbomba := nbomba +1;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin

distribuidores[ndistribuidor].y1 := y1;
distribuidores[ndistribuidor].x1 := x1;
Image1.Canvas.Draw(x1,y1,distribuidor);
ndistribuidor := ndistribuidor +1;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
ang := 0;
edit1.Text := InttoStr(Round(ang));
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
ang := 90;
edit1.Text := InttoStr(Round(ang));
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
ang  := 180;
edit1.Text := InttoStr(Round(ang));
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
ang := 270;
edit1.Text := InttoStr(Round(ang));
end;

procedure TForm1.Button13Click(Sender: TObject);
var
p : TPoint;
begin
  p := Button13.ClientToScreen(Point(0,button13.Height));
  PopupMenu1.Popup(p.X,p.Y);
  
end;

procedure TForm1.Salir1Click(Sender: TObject);
begin
   close();
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   edit2.Text := inttoStr(X);
   edit3.Text := inttoStr(Y);
end;

procedure TForm1.Button14Click(Sender: TObject);
var x,y,i : Integer;
begin
Image1.Canvas.Pen.Color := clwhite;
Image1.Canvas.Pen.Width := 1;
Image1.Canvas.Rectangle(0,0,2000,2000);


  x :=0;
  y := 0;
 for i := 0 to 200 do
 begin
 Image1.Canvas.Pen.Color := clGray;
     Image1.Canvas.MoveTo(x,0);
     Image1.Canvas.LineTo(x,2000);
     x := x+10;
     Image1.Canvas.MoveTo(0,y);
     Image1.Canvas.LineTo(2000,y);
     y := y+10;
  end;

  for i:= 1 to 100 do
  begin
  casas[i].x1 := 0; //
  casas[i].y1 := 0;
  casas[i].ang := 0;
  edificios[i].x1 := 0;
  edificios[i].y1 := 0;
  edificios[i].ang := 0;
  medidores[i].x1 := 0;
  medidores[i].y1 := 0;
  medidores[i].ang := 0;
  valvulas[i].x1 := 0;
  valvulas[i].y1 := 0;
  valvulas[i].ang := 0;
  bombas[i].x1 := 0;
  bombas[i].y1 := 0;
  bombas[i].ang := 0;
  distribuidores[i].x1 := 0;
  distribuidores[i].y1 := 0;
  distribuidores[i].ang := 0;

  mangueras[i].x1 := 0;
  mangueras[i].y1 := 0;
  mangueras[i].x2 := 0;
  mangueras[i].y2 := 0;

  tubos[i].x1 := 0;
  tubos[i].y1 := 0;
  tubos[i].x2 := 0;
  tubos[i].y2 := 0;
  end;
  ncasas:=0;
  nedificios:=0;
  nmedidor:=0;
  nvalvula:=0;
  nbomba:=0;
  ndistribuidor:=0;
  nmangueras:=0;
  ntubos:=0;


end;

procedure TForm1.Button15Click(Sender: TObject);
var casa,edi,med,val,bom,dis,man,tub,i,x,y,b,aa,ab,ac,ad : Integer;
begin
casa := ncasas;
edi := nedificios;
med := nmedidor;
val := nvalvula;
bom := nbomba;
dis := ndistribuidor;
man := nmangueras;
tub := ntubos;
i := 0;
b :=0;

if(x1=x2) and (y1=y2) then
begin
  while(i<=casa) and (b=0) and (casa<>0) do
    begin
      if(x1>=casas[i].x1) and (x1<=casas[i].x1+80) and (y1>=casas[i].y1) and (y1<=casas[i].y1+80)then
        begin
          // algoritmo borrar
          restaurar(x1,y1,Image1,casas[i]);
          //eliminarArr
          while(i<ncasas-1) do
            begin
              casas[i] := casas[i+1];
              i := i+1;
            end;
          casas[i].x1 := 0;
          casas[i].y1 := 0;
          casas[i].ang:= 0;
          //
          ncasas:= ncasas-1;
          b := 1
        end
      else
      i:= i+1;
  end;
 i := 0;
  //Borrar edificio
  while(i<=edi) and (b=0) and (edi<>0) do
    begin
      if(x1>=edificios[i].x1)and (x1<=edificios[i].x1+80) and (y1>=edificios[i].y1) and (y1<=edificios[i].y1+80)then
        begin
          // algoritmo borrar
          restaurar(x1,y1,Image1,edificios[i]);
          //eliminarArr
           while(i<nedificios-1) do
            begin
              edificios[i] := edificios[i+1];
              i := i+1;
            end;
          edificios[i].x1 := 0;
          edificios[i].y1 := 0;
          edificios[i].ang:= 0;
          //
          nedificios:= nedificios-1;
          b := 1
        end
      else
        i:= i+1;
      end;
//Borrar medidor
i:= 0;
  while(i<=med) and (b=0) and (med<>0) do
    begin
      if(x1>=medidores[i].x1) and (x1<=medidores[i].x1+80) and (y1>=medidores[i].y1) and (y1<=medidores[i].y1+80)then
        begin
          // algoritmo borrar
          restaurar(x1,y1,Image1,medidores[i]);
          //eliminarArr
           while(i<nmedidor-1) do
            begin
              medidores[i] := medidores[i+1];
              i := i+1;
            end;
          medidores[i].x1 := 0;
          medidores[i].y1 := 0;
          medidores[i].ang:= 0;
          //
          nmedidor:= nmedidor-1;
          b := 1
        end
      else
        i:= i+1;
  end;
//borrar valv
i:= 0;
  while(i<=val) and (b=0) and (val<>0) do
    begin
      if(x1>=valvulas[i].x1) and (x1<=valvulas[i].x1+80) and (y1>=valvulas[i].y1) and (y1<=valvulas[i].y1+80)then
        begin
          // algoritmo borrar
          restaurar(x1,y1,Image1,valvulas[i]);
          //eliminarArr
           while(i<nvalvula-1) do
            begin
              valvulas[i] := valvulas[i+1];
              i := i+1;
            end;
          valvulas[i].x1 := 0;
          valvulas[i].y1 := 0;
          valvulas[i].ang:= 0;
          //
          nvalvula:= nvalvula-1;
          b := 1
        end
      else
        i:= i+1;
  end;
//borrar bomba
i:= 0;
  while(i<=bom) and (b=0) and (bom<>0) do
    begin
      if(x1>=bombas[i].x1) and (x1<=bombas[i].x1+80) and (y1>=bombas[i].y1) and (y1<=bombas[i].y1+80)then
        begin
          // algoritmo borrar
          restaurar(x1,y1,Image1,bombas[i]);
          //eliminarArr
           while(i<nbomba-1) do
            begin
              bombas[i] := bombas[i+1];
              i := i+1;
            end;
          bombas[i].x1 := 0;
          bombas[i].y1 := 0;
          bombas[i].ang:= 0;
          //
          nbomba:= nbomba-1;
          b := 1
        end
      else
        i:= i+1;
  end;
//borrar distribuidor
i:= 0;
  while(i<=dis) and (b=0) and (dis<>0) do
    begin
      if(x1>=distribuidores[i].x1) and (x1<=distribuidores[i].x1+80) and (y1>=distribuidores[i].y1) and (y1<=distribuidores[i].y1+80)then
        begin
          // algoritmo borrar
          restaurar(x1,y1,Image1,distribuidores[i]);
          //Borrar Arr
           while(i<ndistribuidor-1) do
            begin
              distribuidores[i] := distribuidores[i+1];
              i := i+1;
            end;
          distribuidores[i].x1 := 0;
          distribuidores[i].y1 := 0;
          distribuidores[i].ang:= 0;
          //
          ndistribuidor:= ndistribuidor-1;
          b := 1
        end
      else
        i:= i+1;
  end;

end
else
i:= 0;
  while(i<=man) and (b=0) and (man<>0) do
    begin
      if(x1=mangueras[i].x1) and (y1=mangueras[i].y1) and (x2=mangueras[i].x2) and (y2=mangueras[i].y2)then
        begin
          // algoritmo borrar
          Image1.Canvas.Pen.Color := clWhite;
          Image1.Canvas.Pen.Width := 6;
          image1.Canvas.MoveTo(x1,y1);
          image1.Canvas.LineTo(x2,y2);
          rest(mangueras[i],Image1);
          //Borrar arreglo
           while(i<nmangueras-1) do
            begin
              mangueras[i] := mangueras[i+1];
              i := i+1;
            end;
          mangueras[i].x1 := 0;
          mangueras[i].y1 := 0;
          mangueras[i].x2 := 0;
          mangueras[i].y2 := 0;
          //
          nmangueras:= nmangueras-1;
          b := 1
        end
      else
        i:= i+1;
    end;
  i:= 0;
  while(i<=tub) and (b=0) and (tub<>0) do
    begin
      if(x1=tubos[i].x1) and (y1=tubos[i].y1) and (x2=tubos[i].x2) and (y2=tubos[i].y2)then
        begin
          // algoritmo borrar
          Image1.Canvas.Pen.Color := clWhite;
          Image1.Canvas.Pen.Width := 4;
          image1.Canvas.MoveTo(x1,y1);
          image1.Canvas.LineTo(x2,y2);
          rest(tubos[i],Image1);
          //Borrar arreglo
           while(i<ntubos-1) do
            begin
              tubos[i] := tubos[i+1];
              i := i+1;
            end;
          tubos[i].x1 := 0;
          tubos[i].y1 := 0;
          tubos[i].x2 := 0;
          tubos[i].y2 := 0;
          //
          ntubos:= ntubos-1;
          b := 1
        end
      else
        i:= i+1;
  end;

  end;
//abrir
procedure TForm1.abrir1Click(Sender: TObject);
var F: TextFile;
    i,x,y: Integer;
begin

  OpenDialog1.Filter := 'Text file|*.txt';
  OpenDialog1.FileName := ExtractFilePath('Project1.dpr');
  OpenDialog1.InitialDir := OpenDialog1.FileName;
  SetCurrentDirectory(PChar(OpenDialog1.FileName));
  OpenDialog1.Execute;
  if(OpenDialog1.FileName='')then
  begin
  ShowMessage('Archivo no cargado');
  Exit;
  end;
  //Limpiar pantalla
  Image1.Canvas.Pen.Color := clwhite;
  Image1.Canvas.Pen.Width := 1;
  Image1.Canvas.Rectangle(0,0,2000,2000);


  x :=0;
  y := 0;
  for i := 0 to 200 do
    begin
      Image1.Canvas.Pen.Color := clGray;
      Image1.Canvas.MoveTo(x,0);
      Image1.Canvas.LineTo(x,2000);
      x := x+10;
      Image1.Canvas.MoveTo(0,y);
      Image1.Canvas.LineTo(2000,y);
      y := y+10;
    end;
  //
  AssignFile( F,OpenDialog1.FileName);
  Reset( F );
  while not Eof( F ) do
  begin
    Readln(F,ncasas);
    Readln(F,nedificios);
    Readln(F,nmedidor);
    Readln(F,nvalvula);
    Readln(F,nbomba);
    Readln(F,ndistribuidor);
    Readln(F,nmangueras);
    Readln(F,ntubos);
    i:=0;
    while(i<ncasas)do
    begin
    Readln(F,casas[i].x1,casas[i].y1,casas[i].ang);
    if(casas[i].ang=0)then
    Image1.Canvas.Draw(casas[i].x1,casas[i].y1,casa0);
    if(casas[i].ang=90)then
    Image1.Canvas.Draw(casas[i].x1,casas[i].y1,casa90);
    if(casas[i].ang=180)then
    Image1.Canvas.Draw(casas[i].x1,casas[i].y1,casa180);
    if(casas[i].ang=270)then
    Image1.Canvas.Draw(casas[i].x1,casas[i].y1,casa270);
    i:=i+1;
    end;
    i:=0;
   while(i<nedificios)do
    begin
    Readln(F,edificios[i].x1,edificios[i].y1,edificios[i].ang);
    if(edificios[i].ang=0)then
    Image1.Canvas.Draw(edificios[i].x1,edificios[i].y1,edificio0);
    if(edificios[i].ang=90)then
    Image1.Canvas.Draw(edificios[i].x1,edificios[i].y1,edificio90);
    if(edificios[i].ang=180)then
    Image1.Canvas.Draw(edificios[i].x1,edificios[i].y1,edificio180);
    if(edificios[i].ang=270)then
    Image1.Canvas.Draw(edificios[i].x1,edificios[i].y1,edificio270);
    i:=i+1;
    end;

    while(i<nmedidor) do
    begin
    Readln(F,medidores[i].x1,medidores[i].y1,medidores[i].ang);
    Image1.Canvas.Draw(medidores[i].x1,medidores[i].y1,medidor);
    i:=i+1;
    end;
    i:=0;
    while(i<nvalvula)do
    begin
    Readln(F,valvulas[i].x1,valvulas[i].y1,valvulas[i].ang);
    Image1.Canvas.Draw(valvulas[i].x1,valvulas[i].y1,valvula);
    i:=i+1;
    end;
    i:=0;
    while(i<nbomba)do
    begin
    Readln(F,bombas[i].x1,bombas[i].y1,bombas[i].ang);
    Image1.Canvas.Draw(bombas[i].x1,bombas[i].y1,bomba);
    i:=i+1;
    end;
    i:=0;
    while(i<ndistribuidor) do
    begin
    Readln(F,distribuidores[i].x1,distribuidores[i].y1,distribuidores[i].ang);
    Image1.Canvas.Draw(distribuidores[i].x1,distribuidores[i].y1,distribuidor);
    i:=i+1;
    end;
    i:=0;
    while(i<nmangueras) do
    begin
    Readln(F,mangueras[i].x1,mangueras[i].y1,mangueras[i].x2,mangueras[i].y2);
    Image1.Canvas.Pen.Color := clBlack;
    Image1.Canvas.Pen.Width := 6;
    image1.Canvas.MoveTo(mangueras[i].x1,mangueras[i].y1);
    image1.Canvas.LineTo(mangueras[i].x2,mangueras[i].y2);
    i:=i+1;
    end;
    i:=0;
    while(i<ntubos) do
    begin
    Readln(F,tubos[i].x1,tubos[i].y1,tubos[i].x2,tubos[i].y2);
    Image1.Canvas.Pen.Color := rgb(184,115,51);
    Image1.Canvas.Pen.Width := 4;
    image1.Canvas.MoveTo(tubos[i].x1,tubos[i].y1);
    image1.Canvas.LineTo(tubos[i].x2,tubos[i].y2);
    i:=i+1;
    end

  end;
  CloseFile( F );
end;
 //guardar
procedure TForm1.Guardar1Click(Sender: TObject);
var
  F: TextFile;
  i: Integer;
begin
  saveDialog1.DefaultExt := 'txt';
  saveDialog1.Filter := 'Text file|*.txt';
  SaveDialog1.FileName := ExtractFilePath('Project1.dpr');
  SaveDialog1.InitialDir := SaveDialog1.FileName;
  SetCurrentDirectory(PChar(SaveDialog1.FileName));
  SaveDialog1.Execute;
  if(SaveDialog1.FileName='')then
  begin
  ShowMessage('Archivo no guardado');
  Exit;
  end;
  i:=0;
  AssignFile( F, SaveDialog1.FileName);
  Rewrite( F );
  Writeln(F,ncasas);
  Writeln(F,nedificios);
  Writeln(F,nmedidor);
  Writeln(F,nvalvula);
  Writeln(F,nbomba);
  Writeln(F,ndistribuidor);
  Writeln(F,nmangueras);
  Writeln(F,ntubos);
  while(i<ncasas)do
  begin
  Writeln(F);
  Write(F,casas[i].x1);
  Write(F,' ');
  Write(F,casas[i].y1);
  Write(F,' ');
  Write(F,casas[i].ang);
  i:= i+1;
  end;
//edificios
i:=0;
  while(i<nedificios)do
  begin
  Writeln(F);
  Write(F,edificios[i].x1);
  Write(F,' ');
  Write(F,edificios[i].y1);
  Write(F,' ');
  Write(F,edificios[i].ang);
  i:= i+1;
  end;

//medidores
  i:=0;
  while(i<nmedidor)do
  begin
  Writeln(F);
  Write(F,medidores[i].x1);
  Write(F,' ');
  Write(F,medidores[i].y1);
  Write(F,' ');
  Write(F,medidores[i].ang);
  i:= i+1;
  end;
//valvulas
  i:=0;
  while(i<nvalvula)do
  begin
  Writeln(F);
  Write(F,valvulas[i].x1);
  Write(F,' ');
  Write(F,valvulas[i].y1);
  Write(F,' ');
  Write(F,valvulas[i].ang);
  i:= i+1;
  end;
//Bombas
  i:=0;
  while(i<nbomba)do
  begin
  Writeln(F);
  Write(F,bombas[i].x1);
  Write(F,' ');
  Write(F,bombas[i].y1);
  Write(F,' ');
  Write(F,bombas[i].ang);
  i:= i+1;
  end;
//distribuidor
  i:=0;
  while(i<ndistribuidor)do
  begin
  Writeln(F);
  Write(F,distribuidores[i].x1);
  Write(F,' ');
  Write(F,distribuidores[i].y1);
  Write(F,' ');
  Write(F,distribuidores[i].ang);
  i:= i+1;
  end;
//Manguera
  i:=0;
  while(i<nmangueras)do
  begin
  Writeln(F);
  Write(F,mangueras[i].x1);
  Write(F,' ');
  Write(F,mangueras[i].y1);
  Write(F,' ');
  Write(F,mangueras[i].x2);
  Write(F,' ');
  Write(F,mangueras[i].y2);
  i:= i+1;
  end;
//TUbos
  i:=0;
  while(i<ntubos)do
  begin
  Writeln(F);
  Write(F,tubos[i].x1);
  Write(F,' ');
  Write(F,tubos[i].y1);
  Write(F,' ');
  Write(F,tubos[i].x2);
  Write(F,' ');
  Write(F,tubos[i].y2);
  i:= i+1;
  end;

  CloseFile( F );

end;

end.

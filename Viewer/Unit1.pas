unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Panel2: TPanel;
    Button9: TButton;
    Button10: TButton;
    Image1: TImage;
    Panel3: TPanel;
    Button11: TButton;
    OpenDialog1: TOpenDialog;
    Button7: TButton;
    Button12: TButton;
    Button8: TButton;
    Image2: TImage;
    Image3: TImage;
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);

    //procedure Button12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type recta = Packed record
x1,y1,x2,y2,z1,z2 : Integer;
end;

type forma = packed record
x1,y1 : Integer;
ang : Real;
end;

type TPoint3D = packed record
  x,y,z: Real;
end;
  puntos = array[1..10] of Tpoint3D;
type TD = packed record
   punto : puntos;//10 puntos de los cubos
end;

var
  Form1: TForm1;
  x1,y1,x2,y2 : Integer;
  Cubo : Puntos;
  casas,edificios,medidores,valvulas,bombas,distribuidores : array[0..100] of Forma;
  casa,edificio,medidor,valvula,bomba,distribuidor : array[0..100] of TD;
  mangueras,tubos : array[0..100] of recta;
  ncasas,nedificios,nmedidor,nvalvula,nbomba,ndistribuidor,nmangueras,ntubos,b1 : Integer;
  OjoAObjeto,D : Real;
  P,Q : TPoint;
  xAux,yAux,xAux2,yAux2,zAux,ZAux2,alfa : Real;

implementation

{$R *.dfm}

procedure TForm1.Button10Click(Sender: TObject);
begin
close();
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
Dialogs.ShowMessage('Hector Yoav Ugarte Ramírez');
end;

procedure Medio(var x1,x2,y1,y2:Integer;casas:Forma);
begin
if(x1>casas.x1)then
x1:=casas.x1;
if(x2<casas.x1+80)then
x2:=casas.x1+80;
if(y1>casas.y1)then
y1:=casas.y1;
if(y2<casas.y1+80)then
y2:=casas.y1+80;
end;


procedure Centrar();
var i,x1,x2,y1,y2,xm,ym,xr,yr:Integer;
begin
i:=0;
x1:=4000;
y1:=4000;
x2:=0;
y2:=0;
while(i<ncasas)do
    begin
    Medio(x1,x2,y1,y2,casas[i]);
    i:=i+1;
    end;
    i:=0;
   while(i<nedificios)do
    begin
    Medio(x1,x2,y1,y2,edificios[i]);
    i:=i+1;
    end;
    i:=0;
    while(i<nmedidor) do
    begin
    Medio(x1,x2,y1,y2,medidores[i]);
    i:=i+1;
    end;
    i:=0;
    while(i<nvalvula)do
    begin
    Medio(x1,x2,y1,y2,valvulas[i]);
    i:=i+1;
    end;
    i:=0;
    while(i<nbomba)do
    begin
    Medio(x1,x2,y1,y2,bombas[i]);
    i:=i+1;
    end;
    i:=0;
    while(i<ndistribuidor) do
    begin
    Medio(x1,x2,y1,y2,distribuidores[i]);
    i:=i+1;
    end;
    i:=0;
    while(i<nmangueras) do
    begin
    if(x1>mangueras[i].x1)then
    x1:=mangueras[i].x1;
    if(x2<mangueras[i].x1)then
    x2:=mangueras[i].x1;
    if(y1>mangueras[i].y1)then
    y1:=mangueras[i].y1;
    if(y2<mangueras[i].y1)then
    y2:=mangueras[i].y1;
    if(x1>mangueras[i].x2)then
    x1:=mangueras[i].x1;
    if(x2<mangueras[i].x2)then
    x2:=mangueras[i].x2;
    if(y1>mangueras[i].y1)then
    y1:=mangueras[i].y2;
    if(y2<mangueras[i].y2)then
    y2:=mangueras[i].y2;
    i:=i+1;
    end;
    i:=0;
    while(i<ntubos) do
    begin
    if(x1>tubos[i].x1)then
    x1:=tubos[i].x1;
    if(x2<tubos[i].x1)then
    x2:=tubos[i].x1;
    if(y1>tubos[i].y1)then
    y1:=tubos[i].y1;
    if(y2<tubos[i].y1)then
    y2:=tubos[i].y1;
    if(x1>tubos[i].x2)then
    x1:=tubos[i].x1;
    if(x2<tubos[i].x2)then
    x2:=tubos[i].x2;
    if(y1>tubos[i].y1)then
    y1:=tubos[i].y2;
    if(y2<tubos[i].y2)then
    y2:=tubos[i].y2;
    i:=i+1;
    end;
    xm:=round((x2+x1)/2);
    ym:=round((y1+y2)/2);
    xr:=-80-xm;
    yr:=-80-ym;
    i:=0;
    while(i<ncasas)do
    begin
    casas[i].x1:=casas[i].x1+xr;
    casas[i].y1:=casas[i].y1+yr;
    i:=i+1;
    end;
    i:=0;
   while(i<nedificios)do
    begin
    edificios[i].x1:=edificios[i].x1+xr;
    edificios[i].y1:=edificios[i].y1+yr;
    i:=i+1;
    end;
    i:=0;
    while(i<nmedidor) do
    begin
    medidores[i].x1:=medidores[i].x1+xr;
    medidores[i].y1:=medidores[i].y1+yr;
    i:=i+1;
    end;
    i:=0;
    while(i<nvalvula)do
    begin
    valvulas[i].x1:=valvulas[i].x1+xr;
    valvulas[i].y1:=valvulas[i].y1+yr;
    i:=i+1;
    end;
    i:=0;
    while(i<nbomba)do
    begin
    bombas[i].x1:=bombas[i].x1+xr;
    bombas[i].y1:=bombas[i].y1+yr;
    i:=i+1;
    end;
    i:=0;
    while(i<ndistribuidor) do
    begin
    distribuidores[i].x1:=distribuidores[i].x1+xr;
    distribuidores[i].y1:=distribuidores[i].y1+yr;
    i:=i+1;
    end;
    i:=0;
    while(i<nmangueras) do
    begin
    mangueras[i].x1:=mangueras[i].x1+xr;
    mangueras[i].y1:=mangueras[i].y1+yr;
    mangueras[i].x2:=mangueras[i].x2+xr;
    mangueras[i].y2:=mangueras[i].y2+yr;
    i:=i+1;
    end;
    i:=0;
    while(i<ntubos) do
    begin
    tubos[i].x1:=tubos[i].x1+xr;
    tubos[i].y1:=tubos[i].y1+yr;
    tubos[i].x2:=tubos[i].x2+xr;
    tubos[i].y2:=tubos[i].y2+yr;
    i:=i+1;
    end;
end;

procedure TForm1.Button11Click(Sender: TObject);
var F: TextFile;
    i,j: Integer;
begin
  Image1.Canvas.Pen.Color:=clBlack;
  Image1.Canvas.Pen.Width:=1;
  Image1.Canvas.Rectangle(0,0,600,600);
  OpenDialog1.Filter := 'Text file|*.txt';
  for i:= 0 to 100 do
  begin
  tubos[i].x1:=0;
  tubos[i].y1:=0;
  tubos[i].x2:=0;
  tubos[i].y2:=0;
  tubos[i].z1:=0;
  tubos[i].z2:=0;
  end;
  for i:= 0 to 100 do
  begin
  mangueras[i].x1:=0;
  mangueras[i].y1:=0;
  mangueras[i].x2:=0;
  mangueras[i].y2:=0;
  mangueras[i].z1:=0;
  mangueras[i].z2:=0;
  end;
  OpenDialog1.FileName := ExtractFilePath('Project1.dpr');
  OpenDialog1.InitialDir := OpenDialog1.FileName;
  SetCurrentDirectory(PChar(OpenDialog1.FileName));
  OpenDialog1.Execute;
  if(OpenDialog1.FileName='')then
  begin
  ShowMessage('Archivo no cargado');
  Exit;
  end;
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
    Readln(F,casas[i].x1,casas[i].y1);
    casa[i].punto:=Cubo;
    i:=i+1;
    end;
    i:=0;
   while(i<nedificios)do
    begin
    Readln(F,edificios[i].x1,edificios[i].y1);
    edificio[i].punto:=Cubo;
    i:=i+1;
    end;
    i:=0;
    while(i<nmedidor) do
    begin
    Readln(F,medidores[i].x1,medidores[i].y1);
    medidor[i].punto:=Cubo;
    i:=i+1;
    end;
    i:=0;
    while(i<nvalvula)do
    begin
    Readln(F,valvulas[i].x1,valvulas[i].y1);
    valvula[i].punto:=Cubo;
    i:=i+1;
    end;
    i:=0;
    while(i<nbomba)do
    begin
    Readln(F,bombas[i].x1,bombas[i].y1);
    bomba[i].punto:=Cubo;
    i:=i+1;
    end;
    i:=0;
    while(i<ndistribuidor) do
    begin
    Readln(F,distribuidores[i].x1,distribuidores[i].y1);
    distribuidor[i].punto:=Cubo;
    i:=i+1;
    end;
    i:=0;
    while(i<nmangueras) do
    begin
    Readln(F,mangueras[i].x1,mangueras[i].y1,mangueras[i].x2,mangueras[i].y2);
    i:=i+1;
    end;
    i:=0;
    while(i<ntubos) do
    begin
    Readln(F,tubos[i].x1,tubos[i].y1,tubos[i].x2,tubos[i].y2);
    i:=i+1;
    end
  end;
  CloseFile( F );
  Centrar();
  //Translacion a el centro de la malla y agregar altura correspondiente.
    i:=0;
    while(i<ncasas)do
    begin
    for j := 1 to 10 do
      begin
      casa[i].punto[j].x := casa[i].punto[j].x + casas[i].x1;
      casa[i].punto[j].y := casa[i].punto[j].y + casas[i].y1;
    end;
    for j := 6 to 10 do
    begin
      casa[i].punto[j].z := casa[i].punto[j].z + 20;
    end;
    i:=i+1;
    end;
    i:=0;
    while(i<nedificios)do
    begin
    for j := 1 to 10 do
      begin
      edificio[i].punto[j].x := edificio[i].punto[j].x + edificios[i].x1;
      edificio[i].punto[j].y := edificio[i].punto[j].y + edificios[i].y1;
    end;
    for j := 6 to 10 do
      begin
      edificio[i].punto[j].z := edificio[i].punto[j].z + 160;
    end;
    i:=i+1;
    end;
    i:=0;
    while(i<nmedidor) do
    begin
    for j := 1 to 10 do
      begin
      medidor[i].punto[j].x := medidor[i].punto[j].x + medidores[i].x1;
      medidor[i].punto[j].y := medidor[i].punto[j].y + medidores[i].y1;
    end;
    for j := 6 to 10 do
      begin
      medidor[i].punto[j].z := medidor[i].punto[j].z + 20;
    end;
    i:=i+1;
    end;
    i:=0;
    while(i<nvalvula)do
    begin
    for j := 1 to 10 do
      begin
      valvula[i].punto[j].x := valvula[i].punto[j].x + valvulas[i].x1;
      valvula[i].punto[j].y := valvula[i].punto[j].y + valvulas[i].y1;
    end;
    for j := 6 to 10 do
      begin
      valvula[i].punto[j].z := valvula[i].punto[j].z + 10;
    end;
    i:=i+1;
    end;
    i:=0;
    while(i<nbomba)do
    begin
    for j := 1 to 10 do
      begin
      bomba[i].punto[j].x := bomba[i].punto[j].x + bombas[i].x1;
      bomba[i].punto[j].y := bomba[i].punto[j].y + bombas[i].y1;
    end;
    for j := 6 to 10 do
      begin
      bomba[i].punto[j].z := bomba[i].punto[j].z + 40;
    end;
    i:=i+1;
    end;
    i:=0;
    while(i<ndistribuidor) do
    begin
    for j := 1 to 10 do
      begin
      distribuidor[i].punto[j].x := distribuidor[i].punto[j].x + distribuidores[i].x1;
      distribuidor[i].punto[j].y := distribuidor[i].punto[j].y + distribuidores[i].y1;
    end;
    for j := 6 to 10 do
      begin
      distribuidor[i].punto[j].z := distribuidor[i].punto[j].z + 20;
    end;
    i:=i+1;
    end;
end;
const TamFig = 2;
procedure TForm1.FormCreate(Sender: TObject);
var i:Integer;
begin
OjoAObjeto := 20*4;
D := 20 * 3;
alfa := (15*Pi) / 180; // 5 grados pasados a radianes
Image1.Canvas.Rectangle(0,0,600,600);
Cubo[1].x := +TamFig; Cubo[1].y := +TamFig; Cubo[1].z := 0;
Cubo[2].x := 0; Cubo[2].y := TamFig; Cubo[2].z := 0;
Cubo[3].x := 0; Cubo[3].y := 0; Cubo[3].z := 0;
Cubo[4].x := TamFig; Cubo[4].y := 0; Cubo[4].z := 0;
Cubo[5].x := +TamFig; Cubo[5].y := +TamFig; Cubo[5].z := 0;
Cubo[6].x:=+TamFig; Cubo[6].y:=+TamFig; Cubo[6].z:=0;
Cubo[7].x:=0; Cubo[7].y:=TamFig; Cubo[7].z:=0;
Cubo[8].x:=0; Cubo[8].y:=0; Cubo[8].z:=0;
Cubo[9].x:=TamFig; Cubo[9].y:=0; Cubo[9].z:=0;
Cubo[10].x:=+TamFig; Cubo[10].y:=+TamFig; Cubo[10].z:=0;

      for i:= 1 to 10 do
      begin
      Cubo[i].x := Cubo[i].x * 40;
      Cubo[i].y := Cubo[i].y * 40;
      Cubo[i].z := Cubo[i].z * 40;
      end;
//Cubo escalado, listo para agregar Z correspondiente y transladar.
end;

procedure TForm1.Button8Click(Sender: TObject);
  procedure Perspectiva( x, y, z: Real; var xP, yP : Integer);
  var  xAux, yAux, zAux : Real;
  begin
    zAux := z + OjoAObjeto;
    if(zAux > 0)then  //Evitar division entre 0
    begin
      xAux := Round((x*D)/zAux);
      xP := round(xAux + 300);
      yAux := Round((y*D)/zAux);
      yP := Round(yAux + 300);
    end;
  end;
var i,j : Integer;
begin
Image1.Canvas.Pen.Color := clBlack;
Image1.Canvas.Rectangle(0,0,600,600);
i:=0;
  Image1.Canvas.Pen.Color := clRed;
while(i<ncasas)do
  begin
  //Pintar suelo
  for j := 1 to 4 do
  begin
    Perspectiva(casa[i].punto[j].x, casa[i].punto[j].y, casa[i].punto[j].z, P.x, P.y);
    Perspectiva(casa[i].punto[j+1].x, casa[i].punto[j+1].y, casa[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar techo
  for j := 6 to 9 do
  begin
    Perspectiva(casa[i].punto[j].x, casa[i].punto[j].y, casa[i].punto[j].z, P.x, P.y);
    Perspectiva(casa[i].punto[j+1].x, casa[i].punto[j+1].y, casa[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar paredes
  for j := 1 to 4 do
  begin
    Perspectiva(casa[i].punto[j].x, casa[i].punto[j].y, casa[i].punto[j].z, P.x, P.y);
    Perspectiva(casa[i].punto[j+5].x, casa[i].punto[j+5].y, casa[i].punto[j+5].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
i:=i+1;
end;
i:=0;
Image1.Canvas.Pen.Color := clGreen;
while(i<nedificios)do
  begin
  //Pintar suelo
  for j := 1 to 4 do
  begin
    Perspectiva(edificio[i].punto[j].x, edificio[i].punto[j].y, edificio[i].punto[j].z, P.x, P.y);
    Perspectiva(edificio[i].punto[j+1].x, edificio[i].punto[j+1].y, edificio[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar techo
  for j := 6 to 9 do
  begin
    Perspectiva(edificio[i].punto[j].x, edificio[i].punto[j].y, edificio[i].punto[j].z, P.x, P.y);
    Perspectiva(edificio[i].punto[j+1].x, edificio[i].punto[j+1].y, edificio[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar paredes
  for j := 1 to 4 do
  begin
    Perspectiva(edificio[i].punto[j].x, edificio[i].punto[j].y, edificio[i].punto[j].z, P.x, P.y);
    Perspectiva(edificio[i].punto[j+5].x, edificio[i].punto[j+5].y, edificio[i].punto[j+5].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
i:=i+1;
end;
i:=0;
Image1.Canvas.Pen.Color := clRed;
while(i<nmedidor)do
  begin
  //Pintar suelo
  for j := 1 to 4 do
  begin
    Perspectiva(medidor[i].punto[j].x, medidor[i].punto[j].y, medidor[i].punto[j].z, P.x, P.y);
    Perspectiva(medidor[i].punto[j+1].x, medidor[i].punto[j+1].y, medidor[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar techo
  for j := 6 to 9 do
  begin
    Perspectiva(medidor[i].punto[j].x, medidor[i].punto[j].y, medidor[i].punto[j].z, P.x, P.y);
    Perspectiva(medidor[i].punto[j+1].x, medidor[i].punto[j+1].y, medidor[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar paredes
  for j := 1 to 4 do
  begin
    Perspectiva(medidor[i].punto[j].x, medidor[i].punto[j].y, medidor[i].punto[j].z, P.x, P.y);
    Perspectiva(medidor[i].punto[j+5].x, medidor[i].punto[j+5].y, medidor[i].punto[j+5].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
i:=i+1;
end;
i:=0;
Image1.Canvas.Pen.Color := clGray;
while(i<nvalvula)do
  begin
  //Pintar suelo

  for j := 1 to 4 do
  begin
    Perspectiva(valvula[i].punto[j].x, valvula[i].punto[j].y, valvula[i].punto[j].z, P.x, P.y);
    Perspectiva(valvula[i].punto[j+1].x, valvula[i].punto[j+1].y, valvula[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar techo
  for j := 6 to 9 do
  begin
    Perspectiva(valvula[i].punto[j].x, valvula[i].punto[j].y, valvula[i].punto[j].z, P.x, P.y);
    Perspectiva(valvula[i].punto[j+1].x, valvula[i].punto[j+1].y, valvula[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar paredes
  for j := 1 to 4 do
  begin
    Perspectiva(valvula[i].punto[j].x, valvula[i].punto[j].y, valvula[i].punto[j].z, P.x, P.y);
    Perspectiva(valvula[i].punto[j+5].x, valvula[i].punto[j+5].y, valvula[i].punto[j+5].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
i:=i+1;
end;
i:=0;
Image1.Canvas.Pen.Color := clBlue;
while(i<nbomba)do
  begin
  //Pintar suelo

  for j := 1 to 4 do
  begin
    Perspectiva(bomba[i].punto[j].x, bomba[i].punto[j].y, bomba[i].punto[j].z, P.x, P.y);
    Perspectiva(bomba[i].punto[j+1].x, bomba[i].punto[j+1].y, bomba[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar techo
  for j := 6 to 9 do
  begin
    Perspectiva(bomba[i].punto[j].x, bomba[i].punto[j].y, bomba[i].punto[j].z, P.x, P.y);
    Perspectiva(bomba[i].punto[j+1].x, bomba[i].punto[j+1].y, bomba[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar paredes
  for j := 1 to 4 do
  begin
    Perspectiva(bomba[i].punto[j].x, bomba[i].punto[j].y, bomba[i].punto[j].z, P.x, P.y);
    Perspectiva(bomba[i].punto[j+5].x, bomba[i].punto[j+5].y, bomba[i].punto[j+5].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
i:=i+1;
end;
i:=0;
Image1.Canvas.Pen.Color := rgb(128,0,0);
while(i<ndistribuidor)do
  begin
  //Pintar suelo

  for j := 1 to 4 do
  begin
    Perspectiva(distribuidor[i].punto[j].x, distribuidor[i].punto[j].y, distribuidor[i].punto[j].z, P.x, P.y);
    Perspectiva(distribuidor[i].punto[j+1].x, distribuidor[i].punto[j+1].y, distribuidor[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar techo
  for j := 6 to 9 do
  begin
    Perspectiva(distribuidor[i].punto[j].x, distribuidor[i].punto[j].y, distribuidor[i].punto[j].z, P.x, P.y);
    Perspectiva(distribuidor[i].punto[j+1].x, distribuidor[i].punto[j+1].y, distribuidor[i].punto[j+1].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
  //Pintar paredes
  for j := 1 to 4 do
  begin
    Perspectiva(distribuidor[i].punto[j].x, distribuidor[i].punto[j].y, distribuidor[i].punto[j].z, P.x, P.y);
    Perspectiva(distribuidor[i].punto[j+5].x, distribuidor[i].punto[j+5].y, distribuidor[i].punto[j+5].z, Q.x, Q.y);
    Image1.Canvas.MoveTo(P.X, P.y);
    Image1.Canvas.LineTo(Q.X, Q.Y);
  end;
i:=i+1;
end;
i:=0;
Image1.Canvas.Pen.Color := clBlack;
while(i<nmangueras)do
begin

   Perspectiva(mangueras[i].x1, mangueras[i].y1, mangueras[i].z1, P.x, P.y);
   Perspectiva(mangueras[i].x2, mangueras[i].y2, mangueras[i].z2, Q.x, Q.y);
   Image1.Canvas.MoveTo(P.X, P.y);
   Image1.Canvas.LineTo(Q.X, Q.Y);
   i:=i+1;
end;
i:=0;
Image1.Canvas.Pen.Color :=rgb(255,127,80);
while(i<ntubos)do
begin
   Perspectiva(tubos[i].x1, tubos[i].y1, tubos[i].z1, P.x, P.y);
   Perspectiva(tubos[i].x2, tubos[i].y2, tubos[i].z2, Q.x, Q.y);
   Image1.Canvas.MoveTo(P.X, P.y);
   Image1.Canvas.LineTo(Q.X, Q.Y);
   i:=i+1;
end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j : Integer;
begin
i:=0;
while(i<ncasas)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((Casa[i].punto[j].y * COS(-alfa)) + (Casa[i].punto[j].z * SIN(-alfa)));
  zAux := Round(-(Casa[i].punto[j].y * SIN(-alfa)) + (Casa[i].punto[j].z * COS(-alfa)));
  Casa[i].punto[j].y := yAux;
  Casa[i].punto[j].z := zAux;
 end;
 i:=i+1;
end;
i:=0;
while(i<nedificios)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((edificio[i].punto[j].y * COS(-alfa)) + (edificio[i].punto[j].z * SIN(-alfa)));
  zAux := Round(-(edificio[i].punto[j].y * SIN(-alfa)) + (edificio[i].punto[j].z * COS(-alfa)));
  edificio[i].punto[j].y := yAux;
  edificio[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmedidor)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((medidor[i].punto[j].y * COS(-alfa)) + (medidor[i].punto[j].z * SIN(-alfa)));
  zAux := Round(-(medidor[i].punto[j].y * SIN(-alfa)) + (medidor[i].punto[j].z * COS(-alfa)));
  medidor[i].punto[j].y := yAux;
  medidor[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nvalvula)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((valvula[i].punto[j].y * COS(-alfa)) + (valvula[i].punto[j].z * SIN(-alfa)));
  zAux := Round(-(valvula[i].punto[j].y * SIN(-alfa)) + (valvula[i].punto[j].z * COS(-alfa)));
  valvula[i].punto[j].y := yAux;
  valvula[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nbomba)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((bomba[i].punto[j].y * COS(-alfa)) + (bomba[i].punto[j].z * SIN(-alfa)));
  zAux := Round(-(bomba[i].punto[j].y * SIN(-alfa)) + (bomba[i].punto[j].z * COS(-alfa)));
  bomba[i].punto[j].y := yAux;
  bomba[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<ndistribuidor)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((distribuidor[i].punto[j].y * COS(-alfa)) + (distribuidor[i].punto[j].z * SIN(-alfa)));
  zAux := Round(-(distribuidor[i].punto[j].y * SIN(-alfa)) + (distribuidor[i].punto[j].z * COS(-alfa)));
  distribuidor[i].punto[j].y := yAux;
  distribuidor[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmangueras)do
begin
 yAux := Round((mangueras[i].y1 * COS(-alfa)) + (mangueras[i].z1 * SIN(-alfa)));
 yAux2 := Round((mangueras[i].y2 * COS(-alfa)) + (mangueras[i].z2 * SIN(-alfa)));
 zAux := Round(-(mangueras[i].y1 * SIN(-alfa)) + (mangueras[i].z1 * COS(-alfa)));
 zAux2 := Round(-(mangueras[i].y2 * SIN(-alfa)) + (mangueras[i].z2 * COS(-alfa)));
 mangueras[i].y1 := round(yAux);
 mangueras[i].y2 := round(yAux2);
 mangueras[i].z1 := round(zAux);
 mangueras[i].z2 := round(zAux2);
 i:=i+1;
end;
i:=0;
while(i<ntubos)do
begin
 yAux := Round((tubos[i].y1 * COS(-alfa)) + (tubos[i].z1 * SIN(-alfa)));
 yAux2 := Round((tubos[i].y2 * COS(-alfa)) + (tubos[i].z2 * SIN(-alfa)));
 zAux := Round(-(tubos[i].y1 * SIN(-alfa)) + (tubos[i].z1 * COS(-alfa)));
 zAux2 := Round(-(tubos[i].y2 * SIN(-alfa)) + (tubos[i].z2 * COS(-alfa)));
 tubos[i].y1 := round(yAux);
 tubos[i].y2 := round(yAux2);
 tubos[i].z1 := round(zAux);
 tubos[i].z2 := round(zAux2);
 i:=i+1;
end;
Form1.Button8Click(Sender);
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j : Integer;
begin
i:=0;
while(i<ncasas)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((Casa[i].punto[j].y * COS(alfa)) + (Casa[i].punto[j].z * SIN(alfa)));
  zAux := Round(-(Casa[i].punto[j].y * SIN(alfa)) + (Casa[i].punto[j].z * COS(alfa)));
  Casa[i].punto[j].y := yAux;
  Casa[i].punto[j].z := zAux;
 end;
 i:=i+1;
end;
i:=0;                           
while(i<nedificios)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((edificio[i].punto[j].y * COS(alfa)) + (edificio[i].punto[j].z * SIN(alfa)));
  zAux := Round(-(edificio[i].punto[j].y * SIN(alfa)) + (edificio[i].punto[j].z * COS(alfa)));
  edificio[i].punto[j].y := yAux;
  edificio[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmedidor)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((medidor[i].punto[j].y * COS(alfa)) + (medidor[i].punto[j].z * SIN(alfa)));
  zAux := Round(-(medidor[i].punto[j].y * SIN(alfa)) + (medidor[i].punto[j].z * COS(alfa)));
  medidor[i].punto[j].y := yAux;
  medidor[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nvalvula)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((valvula[i].punto[j].y * COS(alfa)) + (valvula[i].punto[j].z * SIN(alfa)));
  zAux := Round(-(valvula[i].punto[j].y * SIN(alfa)) + (valvula[i].punto[j].z * COS(alfa)));
  valvula[i].punto[j].y := yAux;
  valvula[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nbomba)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((bomba[i].punto[j].y * COS(alfa)) + (bomba[i].punto[j].z * SIN(alfa)));
  zAux := Round(-(bomba[i].punto[j].y * SIN(alfa)) + (bomba[i].punto[j].z * COS(alfa)));
  bomba[i].punto[j].y := yAux;
  bomba[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<ndistribuidor)do
begin
 for j := 1 to 10 do
 begin
  yAux := Round((distribuidor[i].punto[j].y * COS(alfa)) + (distribuidor[i].punto[j].z * SIN(alfa)));
  zAux := Round(-(distribuidor[i].punto[j].y * SIN(alfa)) + (distribuidor[i].punto[j].z * COS(alfa)));
  distribuidor[i].punto[j].y := yAux;
  distribuidor[i].punto[j].z := zAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmangueras)do
begin
 yAux := Round((mangueras[i].y1 * COS(alfa)) + (mangueras[i].z1 * SIN(alfa)));
 yAux2 := Round((mangueras[i].y2 * COS(alfa)) + (mangueras[i].z2 * SIN(alfa)));
 zAux := Round(-(mangueras[i].y1 * SIN(alfa)) + (mangueras[i].z1 * COS(alfa)));
 zAux2 := Round(-(mangueras[i].y2 * SIN(alfa)) + (mangueras[i].z2 * COS(alfa)));
 mangueras[i].y1 := round(yAux);
 mangueras[i].y2 := round(yAux2);
 mangueras[i].z1 := round(zAux);
 mangueras[i].z2 := round(zAux2);
 i:=i+1;
end;
i:=0;
while(i<ntubos)do
begin
 yAux := Round((tubos[i].y1 * COS(alfa)) + (tubos[i].z1 * SIN(alfa)));
 yAux2 := Round((tubos[i].y2 * COS(alfa)) + (tubos[i].z2 * SIN(alfa)));
 zAux := Round(-(tubos[i].y1 * SIN(alfa)) + (tubos[i].z1 * COS(alfa)));
 zAux2 := Round(-(tubos[i].y2 * SIN(alfa)) + (tubos[i].z2 * COS(alfa)));
 tubos[i].y1 := round(yAux);
 tubos[i].y2 := round(yAux2);
 tubos[i].z1 := round(zAux);
 tubos[i].z2 := round(zAux2);
 i:=i+1;
end;
Form1.Button8Click(Sender);
end;


procedure TForm1.Button3Click(Sender: TObject);
var i,j : Integer;
begin
i:=0;
while(i<ncasas)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((Casa[i].punto[j].z * COS(-alfa)) + (Casa[i].punto[j].x * SIN(-alfa)));
  xAux := Round(-(Casa[i].punto[j].z * SIN(-alfa)) + (Casa[i].punto[j].x * COS(-alfa)));
  Casa[i].punto[j].z := zAux;
  Casa[i].punto[j].x := xAux;
 end;
 i:=i+1;
end;
i:=0;
while(i<nedificios)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((edificio[i].punto[j].z * COS(-alfa)) + (edificio[i].punto[j].x * SIN(-alfa)));
  xAux := Round(-(edificio[i].punto[j].z * SIN(-alfa)) + (edificio[i].punto[j].x * COS(-alfa)));
  edificio[i].punto[j].z := zAux;
  edificio[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmedidor)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((medidor[i].punto[j].z * COS(-alfa)) + (medidor[i].punto[j].x * SIN(-alfa)));
  xAux := Round(-(medidor[i].punto[j].z * SIN(-alfa)) + (medidor[i].punto[j].x * COS(-alfa)));
  medidor[i].punto[j].z := zAux;
  medidor[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nvalvula)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((valvula[i].punto[j].z * COS(-alfa)) + (valvula[i].punto[j].x * SIN(-alfa)));
  xAux := Round(-(valvula[i].punto[j].z * SIN(-alfa)) + (valvula[i].punto[j].x * COS(-alfa)));
  valvula[i].punto[j].z := zAux;
  valvula[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nbomba)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((bomba[i].punto[j].z * COS(-alfa)) + (bomba[i].punto[j].x * SIN(-alfa)));
  xAux := Round(-(bomba[i].punto[j].z * SIN(-alfa)) + (bomba[i].punto[j].x * COS(-alfa)));
  bomba[i].punto[j].z := zAux;
  bomba[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<ndistribuidor)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((distribuidor[i].punto[j].z * COS(-alfa)) + (distribuidor[i].punto[j].x * SIN(-alfa)));
  xAux := Round(-(distribuidor[i].punto[j].z * SIN(-alfa)) + (distribuidor[i].punto[j].x * COS(-alfa)));
  distribuidor[i].punto[j].z := zAux;
  distribuidor[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmangueras)do
begin
 zAux := Round((mangueras[i].z1 * COS(-alfa)) + (mangueras[i].x1 * SIN(-alfa)));
 zAux2 := Round((mangueras[i].z2 * COS(-alfa)) + (mangueras[i].x2 * SIN(-alfa)));
 xAux := Round(-(mangueras[i].z1 * SIN(-alfa)) + (mangueras[i].x1 * COS(-alfa)));
 xAux2 := Round(-(mangueras[i].z2 * SIN(-alfa)) + (mangueras[i].x2 * COS(-alfa)));
 mangueras[i].z1 := round(zAux);
 mangueras[i].z2 := round(zAux2);
 mangueras[i].x1 := round(xAux);
 mangueras[i].x2 := round(xAux2);
 i:=i+1;
end;
i:=0;
while(i<ntubos)do
begin
 zAux := Round((tubos[i].z1 * COS(-alfa)) + (tubos[i].x1 * SIN(-alfa)));
 zAux2 := Round((tubos[i].z2 * COS(-alfa)) + (tubos[i].x2 * SIN(-alfa)));
 xAux := Round(-(tubos[i].z1 * SIN(-alfa)) + (tubos[i].x1 * COS(-alfa)));
 xAux2 := Round(-(tubos[i].z2 * SIN(-alfa)) + (tubos[i].x2 * COS(-alfa)));
 tubos[i].z1 := round(zAux);
 tubos[i].z2 := round(zAux2);
 tubos[i].x1 := round(xAux);
 tubos[i].x2 := round(xAux2);
 i:=i+1;
end;
Form1.Button8Click(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
var i,j : Integer;
begin
i:=0;
while(i<ncasas)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((Casa[i].punto[j].z * COS(alfa)) + (Casa[i].punto[j].x * SIN(alfa)));
  xAux := Round(-(Casa[i].punto[j].z * SIN(alfa)) + (Casa[i].punto[j].x * COS(alfa)));
  Casa[i].punto[j].z := zAux;
  Casa[i].punto[j].x := xAux;
 end;
 i:=i+1;
end;
i:=0;
while(i<nedificios)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((edificio[i].punto[j].z * COS(alfa)) + (edificio[i].punto[j].x * SIN(alfa)));
  xAux := Round(-(edificio[i].punto[j].z * SIN(alfa)) + (edificio[i].punto[j].x * COS(alfa)));
  edificio[i].punto[j].z := zAux;
  edificio[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmedidor)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((medidor[i].punto[j].z * COS(alfa)) + (medidor[i].punto[j].x * SIN(alfa)));
  xAux := Round(-(medidor[i].punto[j].z * SIN(alfa)) + (medidor[i].punto[j].x * COS(alfa)));
  medidor[i].punto[j].z := zAux;
  medidor[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nvalvula)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((valvula[i].punto[j].z * COS(alfa)) + (valvula[i].punto[j].x * SIN(alfa)));
  xAux := Round(-(valvula[i].punto[j].z * SIN(alfa)) + (valvula[i].punto[j].x * COS(alfa)));
  valvula[i].punto[j].z := zAux;
  valvula[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nbomba)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((bomba[i].punto[j].z * COS(alfa)) + (bomba[i].punto[j].x * SIN(alfa)));
  xAux := Round(-(bomba[i].punto[j].z * SIN(alfa)) + (bomba[i].punto[j].x * COS(alfa)));
  bomba[i].punto[j].z := zAux;
  bomba[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<ndistribuidor)do
begin
 for j := 1 to 10 do
 begin
  zAux := Round((distribuidor[i].punto[j].z * COS(alfa)) + (distribuidor[i].punto[j].x * SIN(alfa)));
  xAux := Round(-(distribuidor[i].punto[j].z * SIN(alfa)) + (distribuidor[i].punto[j].x * COS(alfa)));
  distribuidor[i].punto[j].z := zAux;
  distribuidor[i].punto[j].x := xAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmangueras)do
begin
 zAux := Round((mangueras[i].z1 * COS(alfa)) + (mangueras[i].x1 * SIN(alfa)));
 zAux2 := Round((mangueras[i].z2 * COS(alfa)) + (mangueras[i].x2 * SIN(alfa)));
 xAux := Round(-(mangueras[i].z1 * SIN(alfa)) + (mangueras[i].x1 * COS(alfa)));
 xAux2 := Round(-(mangueras[i].z2 * SIN(alfa)) + (mangueras[i].x2 * COS(alfa)));
 mangueras[i].z1 := round(zAux);
 mangueras[i].z2 := round(zAux2);
 mangueras[i].x1 := round(xAux);
 mangueras[i].x2 := round(xAux2);
 i:=i+1;
end;
i:=0;
while(i<ntubos)do
begin
 zAux := Round((tubos[i].z1 * COS(alfa)) + (tubos[i].x1 * SIN(alfa)));
 zAux2 := Round((tubos[i].z2 * COS(alfa)) + (tubos[i].x2 * SIN(alfa)));
 xAux := Round(-(tubos[i].z1 * SIN(alfa)) + (tubos[i].x1 * COS(alfa)));
 xAux2 := Round(-(tubos[i].z2 * SIN(alfa)) + (tubos[i].x2 * COS(alfa)));
 tubos[i].z1 := round(zAux);
 tubos[i].z2 := round(zAux2);
 tubos[i].x1 := round(xAux);
 tubos[i].x2 := round(xAux2);
 i:=i+1;
end;
Form1.Button8Click(Sender);
end;

procedure TForm1.Button6Click(Sender: TObject);
var i,j : Integer;
begin
i:=0;
while(i<ncasas)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((Casa[i].punto[j].x * COS(-alfa)) + (Casa[i].punto[j].y * SIN(-alfa)));
  yAux := Round(-(Casa[i].punto[j].x * SIN(-alfa)) + (Casa[i].punto[j].y * COS(-alfa)));
  Casa[i].punto[j].x := xAux;
  Casa[i].punto[j].y := yAux;
 end;
 i:=i+1;
end;
i:=0;
while(i<nedificios)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((edificio[i].punto[j].x * COS(-alfa)) + (edificio[i].punto[j].y * SIN(-alfa)));
  yAux := Round(-(edificio[i].punto[j].x * SIN(-alfa)) + (edificio[i].punto[j].y * COS(-alfa)));
  edificio[i].punto[j].x := xAux;
  edificio[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmedidor)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((medidor[i].punto[j].x * COS(-alfa)) + (medidor[i].punto[j].y * SIN(-alfa)));
  yAux := Round(-(medidor[i].punto[j].x * SIN(-alfa)) + (medidor[i].punto[j].y * COS(-alfa)));
  medidor[i].punto[j].x := xAux;
  medidor[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nvalvula)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((valvula[i].punto[j].x * COS(-alfa)) + (valvula[i].punto[j].y * SIN(-alfa)));
  yAux := Round(-(valvula[i].punto[j].x * SIN(-alfa)) + (valvula[i].punto[j].y * COS(-alfa)));
  valvula[i].punto[j].x := xAux;
  valvula[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nbomba)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((bomba[i].punto[j].x * COS(-alfa)) + (bomba[i].punto[j].y * SIN(-alfa)));
  yAux := Round(-(bomba[i].punto[j].x * SIN(-alfa)) + (bomba[i].punto[j].y * COS(-alfa)));
  bomba[i].punto[j].x := xAux;
  bomba[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<ndistribuidor)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((distribuidor[i].punto[j].x * COS(-alfa)) + (distribuidor[i].punto[j].y * SIN(-alfa)));
  yAux := Round(-(distribuidor[i].punto[j].x * SIN(-alfa)) + (distribuidor[i].punto[j].y * COS(-alfa)));
  distribuidor[i].punto[j].x := xAux;
  distribuidor[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmangueras)do
begin
 xAux := Round((mangueras[i].x1 * COS(-alfa)) + (mangueras[i].y1 * SIN(-alfa)));
 xAux2 := Round((mangueras[i].x2 * COS(-alfa)) + (mangueras[i].y2 * SIN(-alfa)));
 yAux := Round(-(mangueras[i].x1 * SIN(-alfa)) + (mangueras[i].y1 * COS(-alfa)));
 yAux2 := Round(-(mangueras[i].x2 * SIN(-alfa)) + (mangueras[i].y2 * COS(-alfa)));
 mangueras[i].x1 := round(xAux);
 mangueras[i].x2 := round(xAux2);
 mangueras[i].y1 := round(yAux);
 mangueras[i].y2 := round(yAux2);
 i:=i+1;
end;
i:=0;
while(i<ntubos)do
begin
 xAux := Round((tubos[i].x1 * COS(-alfa)) + (tubos[i].y1 * SIN(-alfa)));
 xAux2 := Round((tubos[i].x2 * COS(-alfa)) + (tubos[i].y2 * SIN(-alfa)));
 yAux := Round(-(tubos[i].x1 * SIN(-alfa)) + (tubos[i].y1 * COS(-alfa)));
 yAux2 := Round(-(tubos[i].x2 * SIN(-alfa)) + (tubos[i].y2 * COS(-alfa)));
 tubos[i].x1 := round(xAux);
 tubos[i].x2 := round(xAux2);
 tubos[i].y1 := round(yAux);
 tubos[i].y2 := round(yAux2);
 i:=i+1;
end;
Form1.Button8Click(Sender);
end;


procedure TForm1.Button5Click(Sender: TObject);
var i,j : Integer;
begin
i:=0;
while(i<ncasas)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((Casa[i].punto[j].x * COS(alfa)) + (Casa[i].punto[j].y * SIN(alfa)));
  yAux := Round(-(Casa[i].punto[j].x * SIN(alfa)) + (Casa[i].punto[j].y * COS(alfa)));
  Casa[i].punto[j].x := xAux;
  Casa[i].punto[j].y := yAux;
 end;
 i:=i+1;
end;
i:=0;
while(i<nedificios)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((edificio[i].punto[j].x * COS(alfa)) + (edificio[i].punto[j].y * SIN(alfa)));
  yAux := Round(-(edificio[i].punto[j].x * SIN(alfa)) + (edificio[i].punto[j].y * COS(alfa)));
  edificio[i].punto[j].x := xAux;
  edificio[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmedidor)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((medidor[i].punto[j].x * COS(alfa)) + (medidor[i].punto[j].y * SIN(alfa)));
  yAux := Round(-(medidor[i].punto[j].x * SIN(alfa)) + (medidor[i].punto[j].y * COS(alfa)));
  medidor[i].punto[j].x := xAux;
  medidor[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nvalvula)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((valvula[i].punto[j].x * COS(alfa)) + (valvula[i].punto[j].y * SIN(alfa)));
  yAux := Round(-(valvula[i].punto[j].x * SIN(alfa)) + (valvula[i].punto[j].y * COS(alfa)));
  valvula[i].punto[j].x := xAux;
  valvula[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nbomba)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((bomba[i].punto[j].x * COS(alfa)) + (bomba[i].punto[j].y * SIN(alfa)));
  yAux := Round(-(bomba[i].punto[j].x * SIN(alfa)) + (bomba[i].punto[j].y * COS(alfa)));
  bomba[i].punto[j].x := xAux;
  bomba[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<ndistribuidor)do
begin
 for j := 1 to 10 do
 begin
  xAux := Round((distribuidor[i].punto[j].x * COS(alfa)) + (distribuidor[i].punto[j].y * SIN(alfa)));
  yAux := Round(-(distribuidor[i].punto[j].x * SIN(alfa)) + (distribuidor[i].punto[j].y * COS(alfa)));
  distribuidor[i].punto[j].x := xAux;
  distribuidor[i].punto[j].y := yAux;
 end;
  i:=i+1;
end;
i:=0;
while(i<nmangueras)do
begin
 xAux := Round((mangueras[i].x1 * COS(alfa)) + (mangueras[i].y1 * SIN(alfa)));
 xAux2 := Round((mangueras[i].x2 * COS(alfa)) + (mangueras[i].y2 * SIN(alfa)));
 yAux := Round(-(mangueras[i].x1 * SIN(alfa)) + (mangueras[i].y1 * COS(alfa)));
 yAux2 := Round(-(mangueras[i].x2 * SIN(alfa)) + (mangueras[i].y2 * COS(alfa)));
 mangueras[i].x1 := round(xAux);
 mangueras[i].x2 := round(xAux2);
 mangueras[i].y1 := round(yAux);
 mangueras[i].y2 := round(yAux2);
 i:=i+1;
end;
i:=0;
while(i<ntubos)do
begin
 xAux := Round((tubos[i].x1 * COS(alfa)) + (tubos[i].y1 * SIN(alfa)));
 xAux2 := Round((tubos[i].x2 * COS(alfa)) + (tubos[i].y2 * SIN(alfa)));
 yAux := Round(-(tubos[i].x1 * SIN(alfa)) + (tubos[i].y1 * COS(alfa)));
 yAux2 := Round(-(tubos[i].x2 * SIN(alfa)) + (tubos[i].y2 * COS(alfa)));
 tubos[i].x1 := round(xAux);
 tubos[i].x2 := round(xAux2);
 tubos[i].y1 := round(yAux);
 tubos[i].y2 := round(yAux2);
 i:=i+1;
end;
Form1.Button8Click(Sender);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
OjoAObjeto:=OjoAObjeto/1.10;
Form1.Button8Click(Sender);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
OjoAObjeto:=OjoAObjeto*1.10;
Form1.Button8Click(Sender);
end;

end.                                            


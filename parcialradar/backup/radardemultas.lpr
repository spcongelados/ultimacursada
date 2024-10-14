Program radardemultas;
{
En una ruta argentina, se intenta determinar el correcto funcionamiento de un nuevo radar, que detecta la
velocidad a la que circulan los vehículos. En un archivo de texto RADAR.TXT se encuentra la información obtenida
por el radar en un determinado día. El archivo contiene:
    Tipo Vehículo (1-Moto, 2-Auto, 3-Camión)
    Velocidad (expresada en Km/h)
    Zona de la lectura (AN3), ya está validada
    Patente (Cadena de 7)
Se pide desarrollar un programa Pascal, claro y eficiente, que ingrese desde un archivo la información
almacenándola en las estructuras que corresponda, sólo si corresponde a una infracción.
Se entiende por infracción al exceso de velocidad, para Motos > 100 Km/h, para Autos > 110 Km/h y para
Camiones > 90 Km/h.
La multa a abonar por cada infracción es una tasa fija (Motos: $1000, Autos: $2000, Camiones: $5000)
multiplicada por un factor que depende de la zona en la que se produjo. Este factor se obtiene de otro archivo de
texto ZONAS.TXT:
    ● Zona (AN3)
    ● Coeficiente para multiplicar tasa fija

a) Cantidad de lecturas del radar que no corresponden a infracciones.
b) Patente de la multa de valor máximo cometida en cada zona (si se repite la multa máxima, tomar la
primera).
c) Cantidad de infracciones de una zona ingresada por teclado (puede no existir).
}
type
  tvr=array[1..100] of real;
  st3=string[3];
  tvst3=array[1..100] of st3;
  st7=string[7];
  tvst7=array[1..100] of st7;

const
  moto=1000;
  auto=2000;
  camiones=5000;
procedure cargarzonas(var zonas:tvst3;var coef:tvr;var n:byte);
var
  arch:text;
begin
  assign(arch,'ZONAS.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    readln(arch,zonas[n],coef[n]);
  end;
  close(arch);
end;
function infraccion(tipo:byte;vel:real):boolean;
begin
  case tipo of
  1:begin
      if vel>100 then
        infraccion:=true
      else
        infraccion:=false;
    end;
  2:begin
      if vel>110 then
        infraccion:=true
      else
        infraccion:=false;
    end;
  3:begin
      if vel>90 then
        infraccion:=true
      else
        infraccion:=false;
    end;
  else
      infraccion:=false;
  end;
end;
function buscarzona(zonas:tvst3;zonaaux:st3;m:byte):byte;
var
  i:byte;
begin
  i:=1;
  while (zonas[i]<>zonaaux) and (i<=m) do
  begin
    i:=i+1;
  end;
  if i<=m then
    buscarzona:=i
  else
    buscarzona:=0;
end;

function calcmulta(zonas:tvst3;coef:tvr;tipo:byte;zonaaux:st3;m:byte):real;
var
  i:byte;
  multa:real;
begin
  case tipo of
  1:
    multa:=moto;
  2:
    multa:=auto;
  3:
    multa:=camiones;
  end;
  i:=buscarzona(zonas,zonaaux,m);
  if i<>0 then
    calcmulta:=multa*coef[i]
  else
    calcmulta:=0;
end;

procedure cargarmultas(var zona:tvst3;var pat:tvst7;var multa:tvr;var n:byte;var noinf:byte;var zonas:tvst3;var m:byte);
var
  arch:text;
  coef:tvr;
  tipo:byte;
  vel:real;
  zonaaux:st3;
begin
  cargarzonas(zonas,coef,m);
  assign(arch,'RADAR.txt');
  reset(arch);
  n:=0;
  noinf:=0;
  while not eof(arch) do
  begin
    read(arch,tipo,vel,zonaaux);
    if infraccion(tipo,vel) then
    begin
      n:=n+1;
      zona[n]:=zonaaux;
      readln(arch,pat[n]);
      multa[n]:=calcmulta(zonas,coef,tipo,zonaaux,m);
    end
    else
    begin
      noinf:=noinf+1;
      readln(arch);
    end;
  end;

end;
procedure inicializar(var max:tvr;m:byte);
var
  i:byte;
begin
  for i:=1 to m do
    max[i]:=0;
end;

procedure patentesmax(zona:tvst3;pat:tvst7;multa:tvr;n:byte;zonas:tvst3;m:byte);
var
  i,j:byte;
  max:tvr;
  patmax:tvst7;
begin
  inicializar(max,m);
  for i:=1 to n do
  begin
    j:=buscarzona(zonas,zona[i],m);
    if j<>0 then
    begin
      if multa[i]>max[j] then
      begin
        max[j]:=multa[i];
        patmax[j]:=pat[i];
      end;
    end;

  end;

  for j:=1 to m do
  begin
    if max[j]<>0 then
      writeln('La patente con multa maxima en la zona ',zonas[j],' es ',patmax[j])
  end;
end;
function infxzona(zona:tvst3;n:byte;zonaing:st3):byte;
var
  i:byte;
  cont:byte;
begin
  cont:=0;
  for i:=1 to n do
  begin
    if zona[i]=zonaing then
      cont:=cont+1;
  end;
  infxzona:=cont;
end;
procedure infraccionesxzona(zona:tvst3;n:byte);
var
  zonaing:st3;
begin
  writeln('Ingrese zona para calcular las infracciones totales');
  readln(zonaing);
  writeln('Las infracciones cometidas en la zona ',zonaing,' son ',infxzona(zona,n,zonaing));
end;

var
  zona,zonas:tvst3;
  pat:tvst7;
  multa:tvr;
  n,noinf,m,i:byte;
begin
  cargarmultas(zona,pat,multa,n,noinf,zonas,m);
  for i:=1 to n do
  begin
    writeln('zona:',zona[i],' pat:',pat[i],' multa:',multa[i]:0:2)
  end;
  writeln;
  for i:=1 to m do
  begin
    writeln('zona:',zonas[i])
  end;
  writeln('La cantidad de lecturas de radar que no corresponden a infracciones son ',noinf);
  patentesmax(zona,pat,multa,n,zonas,m);
  infraccionesxzona(zona,n);
  readln;
end.

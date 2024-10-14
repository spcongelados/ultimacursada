program project1;

(*En un archivo de texto, CHECKIN.TXT se encuentran detallados los pasajeros que deben realizar el checkin de un determinado tren turístico.
En la primera línea del archivo aparecen la cantidad de asientos del tren turístico (N)
Luego, agrupados por reserva, se detalla en cada línea:

RESERVA [ANU4, puede repetirse, incluyendo más de un DNI]
DNI [ANU8]
Edad
Peso Equipaje de Mano [Númerico]
El tren tiene un asiento por fila y estos están numerados del 1 a N.

Con el fin de balancear el peso del tren, se debe ubicar a los pasajeros según el criterio:

El primero que llega, debe ocupar el primer asiento y mientras el código de reserva no cambie, se siguen ubicando consecutivamente detrás de dicho pasajero.
Al cambiar el código de reserva, se deben ubicar los pasajeros al fondo del tren, desde el último asiento hacia el centro.
 Se debe continuar con esta acción llenando el tren, desde los extremos hacia el centro.
Se pide, completar el checkin del tren para luego resolver mediante un subprograma por inciso:

a) Dado un DNI, encontrar entre los asientos ocupados cuál es el nro de asiento que se le asignó. Si no existe, informar “No realizó el checkin”.
b) Para un rango de pesos P1 y P2, informar el promedio de la edad de los pasajeros cuyo equipaje de mano tiene un peso que pertenece al rango dado.
c) Informar el DNI de los 3 pasajeros que llevan mayor peso de equipaje de mano*)
type
  st4=string[4];
  st8=string[8];
  tvst=array[1..100] of st8;
  tvb=array[1..100] of byte;
  tvr=array[1..100] of real;
  tvrm=array[1..3] of real;
  tvbm=array[1..3] of byte;

Procedure cargararrays(var dni:tvst;var edad:tvb;var peso:tvr;var n:byte;var i,j:byte);
var
  res,resant:st4;
  arch:text;
  c:char;
begin
  assign(arch,'CHECKIN.txt');
  reset(arch);
  readln(arch,n);
  i:=1;
  j:=n;
  readln(arch,res,c,dni[i],edad[i],peso[i]);
  i:=i+1;
  while not eof(arch) do
  begin
    resant:=res;
    read(arch,res,c);
    if res=resant then
    begin
      readln(arch,dni[i],edad[i],peso[i]);
      i:=i+1;
    end
    else
    begin
      readln(arch,dni[j],edad[j],peso[j]);
      j:=j-1;
    end;
  end;
end;

function buscarxdni(dni:tvst;n:byte;buscado:st8;i,j:byte):byte;
var
  k:byte;
begin
  k:=1;
  while (dni[k]<>buscado) and (k<=i) do
  begin
    k:=k+1;
  end;
  if k<=i then
    buscarxdni:=k
  else
    begin
      k:=n;
      while (dni[k]<>buscado) and (k>=j) do
       k:=k-1;
      if k>=j then
       buscarxdni:=k
      else
       buscarxdni:=0;
    end;
end;

procedure buscar(dni:tvst;n:byte;i,j:byte);
var
  buscado:st8;
begin
  writeln('Ingrese dni a buscar');
  readln(buscado);
  if buscarxdni(dni,n,buscado,i,j)<>0 then
    writeln('El dni ',buscado,' se encuentra en el asiento numero ',buscarxdni(dni,n,buscado,i,j))
  else
    writeln('El dni no se ha encontrado');
end;

function promedad(edad:tvb;peso:tvr;n:byte;p1,p2:real):real;
var
  i:byte;
  acum:real;
  cont:byte;
  pesomax,pesomin:real;
begin
  acum:=0;
  cont:=0;
  if p1>=p2 then
  begin
    pesomax:=p1;
    pesomin:=p2;
  end
  else
    pesomax:=p2;
    pesomin:=p1;
  for i:=1 to n do
  begin
    if (peso[i]<=pesomax) and (peso[i]>=pesomin) then
    begin
      acum:=acum+edad[i];
      cont:=cont+1;
    end;
  end;
  if cont<>0 then
    promedad:=acum/cont
  else
    promedad:=0;
end;

procedure mostrarpromedad(edad:tvb;peso:tvr;n:byte);
var
  p1,p2:real;
  aux:real;
begin
  Writeln('Ingresar valores P1 y P2');
  readln(p1);
  readln(p2);
  aux:=promedad(edad,peso,n,p1,p2);
  if aux <>0 then
    writeln('El promedio de edad entre los pesos p1 y p2 es: ',aux:2:2)
  else
    writeln('No se encontraron equipajes entre esos pesos');

end;

procedure mayorpeso(dni:tvst;peso:tvr;n:byte);
var
  i:byte;
  imax:tvbm;
  pmax:tvrm;
begin
  for i:=1 to 3 do
  begin
    imax[i]:=0;
    pmax[i]:=-1;
  end;
  for i:=1 to n do
  begin
    if peso[i]>pmax[1] then
    begin
      pmax[3]:=pmax[2];
      imax[3]:=imax[2];

      pmax[2]:=pmax[1];
      imax[2]:=imax[1];

      pmax[1]:=peso[i];
      imax[1]:=i;
    end
    else if peso[i]>pmax[2] then
    begin
      pmax[3]:=pmax[2];
      imax[3]:=imax[2];

      pmax[2]:=peso[i];
      imax[2]:=i;
    end
    else if peso[i]>pmax[3] then
    begin
      pmax[3]:=peso[i];
      imax[3]:=i;
    end;
  end;
  writeln('Los dni con el mayor peso de equipaje son ',dni[imax[1]],dni[imax[2]],dni[imax[3]]);
end;

var
  dni:tvst;
  edad:tvb;
  peso:tvr;
  n,i,j:byte;

begin
  cargararrays(dni,edad,peso,n,i,j);
  buscar(dni,n,i,j);
  mostrarpromedad(edad,peso,n);
  mayorpeso(dni,peso,n);
  readln;
end.


program project5_13;

const
  tarifas: array[1..5] of real=(300,150,300,470,390);

type
  tvtarifa=array[1..5] of real;
  tvbyte=array[1..100] of byte;
  tvreal=array[1..100] of real;
procedure inicializar(n:byte; var cantvehiculos:tvbyte;var recaudacion:tvreal);
var
  i:byte;
begin
  for i:=1 to n do
  begin
    cantvehiculos[i]:=0;
    recaudacion[i]:=0;
  end;
end;

function calcularmonto(tipo:byte;hora:byte;tarifas:tvtarifa):real;
var
  monto:real;
begin
  monto:=tarifas[tipo];
  if hora in [10..18] then
   monto:=monto*1.10;
  calcularmonto:=monto;
end;

procedure cargararrays(var n:byte;var cantvehiculos:tvbyte;var recaudacion:tvreal);
var
  arch:text;
  i,tipo,hora:byte;
  importe:real;
begin
  writeln('Cuantas cabinas hay?');
  readln(n);
  assign(arch,'5_13.txt');
  reset(arch);
  inicializar(n,cantvehiculos,recaudacion);
  while not eof(arch) do
   begin
     readln(arch,i,tipo,hora);
     cantvehiculos[i]:=cantvehiculos[i]+1;
     recaudacion[i]:=recaudacion[i]+calcularmonto(tipo,hora,tarifas);
   end;
  close(arch);
end;
function masrecaudo(n:byte;recaudacion:tvreal):byte;
var
  i,imax:byte;
  max:real;
begin
  max:=0;
  for i:=1 to n do
  begin
    if recaudacion[i]>max then
     begin
       max:=recaudacion[i];
       imax:=i;
     end;
  end;
  masrecaudo:=imax;
end

procedure cuantosvehiculos(n:byte;cantvehiculos:tvbyte);
var
  i:byte;
begin
  for i:=1 to n do
  begin
    if cantvehiculos[i]>0 then
     writeln('Hubo ',cantvehiculos[i],' vehiculos en la cabina ',i);
  end;
end;

var
  n:byte;
  cantvehiculos:tvbyte;
  recaudacion:tvreal;
begin;
  cargararrays(n,cantvehiculos,recaudacion);
  cuantosvehiculos(n,cantvehiculos);
  writeln('La cabina que mas recaudo fue la ',masrecaudo(n,recaudacion));
  readln;
end.


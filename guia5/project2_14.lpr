program project2_14;

procedure cargararrays(var n:byte;var patentes:tvst;var recaudado:tvreal);
var
  arch:text;
begin
  assign(arch,'5_14.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    readln(arch,patentes[n],recaudado[n]);
  end;
end;

function promedioporauto(n:byte;recaudado:tvreal):real;
var
  i:byte;
  suma:real;
begin
  suma:=0;
  for i:=1 to n do
  begin
    suma:=suma+recaudado[i];
  end;
  if n <> 0 then
    promedioporauto:=suma/n;
  else
    promedioporauto:=0;
end;

procedure superaronx(n:byte;patentes:tvst;recaudado:tvreal);
var
  i:byte;
  x:real;
begin
  writeln('Ingrese x');
  readln(x);
  for i:=1 to n do
  begin
    if recaudado[i]>x then
      writeln(patentes[i],' supero ',x);
  end;

end;

function recaudomenos(n:byte;patentes:tvst;recaudado:tvreal):st7;
var
  i:byte;
  min:real;
  minpat:st7;
begin
  minpat:=patentes[1];
  min:=recaudado[1];
  for i:=2 to n do
  begin
    if min>recaudado[i] then
      begin
        min:=recaudado[i];
        minpat:=patentes[i];
      end;
  end;
  recaudomenos:=minpat;
end;

begin
end.


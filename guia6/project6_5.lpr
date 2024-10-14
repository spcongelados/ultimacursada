program project6_5;
type
  tv=array[1..100] of integer;
  tmat=array[1..100,1..4] of real;

function busqueda(nrocli:tv;n:byte;cli:integer):byte;
var
  i:byte;
begin
  i:=1;
  while (nrocli[i]<>cli) and (i<=n) do
  begin
    i:=i+1;
  end;
  if i<=n then
    busqueda:=i;
  else
    busqueda:=0;
end;

procedure cargarestructuras(var nrocli:tv;var compras:tmat;var n:byte);
var
  arch:text;
  cli:integer;
  tipo,i,j:byte;
  monto:real;
begin
  assign(arch,'6_5.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    readln(arch,cli,tipo,monto);
    i:=busqueda(nrocli,n,cli);
    if i=0 then
    begin
      n:=n+1;
      nrocli[n]:=cli;
      for j:=1 to 4 do
      begin
        compras[n,j]:=0;
      end;
      compras[n,tipo]:=monto;
    end;
    else
    begin
      compras[i,tipo]:=compras[i,tipo]+monto;
    end;
  end;
  close(arch);
end;

procedure totalcompras(compras:tmat;n:byte);
var
  i,j:byte;
  acum:real;
begin
  for i:=1 to 4 do
  begin
    acum:=0;
    for j:=1 to n do
    begin
      acum:=acum+compras[j,i];
    end;
    writeln('El total de compras del rubro ',i,' es ',acum);
  end;
end;

procedure superoindumentaria(nrocli:tv;compras:tmat;n:byte);
var
  i:byte;
begin
  write('Clientes cuyo monto en supermercado supero a indumentaria: ');
  for i:=1 to n do
  begin
    if compras[i,1]>compras[i,3] then
      write(nrocli[i],' ');
  end;
  writeln;
end;

procedure promediocliente(compras:tmat;n:byte);
var
  i,j:byte;
  acum:real;
begin
  if n<>0 then
    begin
    acum:=0;
    for i:=1 to n do
    begin
      for j:=1 to 4 do
        acum:=acum+compras[i,j];
    end;
    writeln('El promedio de compra por cliente es de ',acum/n:5:2);
  end
  else
      writeln('No hay clientes');
end;


begin
end.


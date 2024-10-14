program project7_2;
type
  letras = (R, Q, A, T, C, P);
  tcasilla=record
    tipo:letras;
    color:byte;
  end;
  ttablero=array[1..8,1..8] of tcasilla;

procedure cargamat(var tablero:ttablero);
var
  arch:text;
  i,j:byte;
begin
  for i:=1 to 8 do
  begin
    for j:=1 to 8 do
      tablero[i,j].color:=0;
  end;
  assign(arch,'7_2.txt');
  Reset(arch);
  while not eof(arch) do
  begin
    read(arch,i,j);
    readln(arch,tablero[i,j].tipo,tablero[i,j].color);
  end;
end;

procedure columnafila(tablero:ttablero;ti,tj:byte);
var
  i,j:byte;
begin
  i:=ti;
  j:=tj;
  while (i<=8) and (tablero[i,j].color=0) do
  begin
    i:=i+1;
  end;
  if i<=8 then
  begin
    if tablero[i,j].color=2 then
      write('Defendiendo: ')
    else
      write('Amenazando: ');
    writeln(tablero[i,j].tipo,' fila:',i,' columna:',j);
  end;
  i:=ti;
  while (i>0) and (tablero[i,j].color=0) do
  begin
    i:=i-1;
  end;
  if i>0 then
  begin
    if tablero[i,j].color=2 then
      write('Defendiendo: ')
    else
      write('Amenazando: ');
    writeln(tablero[i,j].tipo,' fila:',i,' columna:',j);
  end;
  i:=ti;
  while (j<=8) and (tablero[i,j].color=0) do
  begin
    j:=j+1;
  end;
  if j<=8 then
  begin
    if tablero[i,j].color=2 then
      write('Defendiendo: ')
    else
      write('Amenazando: ');
    writeln(tablero[i,j].tipo,' fila:',i,' columna:',j);
  end;
  j:=tj;
  while (j>0) and (tablero[i,j].color=0) do
  begin
    j:=j-1;
  end;
  if j>0 then
  begin
    if tablero[i,j].color=2 then
      write('Defendiendo: ')
    else
      write('Amenazando: ');
    writeln(tablero[i,j].tipo,' fila:',i,' columna:',j);
  end;
end;

begin
end.


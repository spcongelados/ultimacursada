program project5_11;
type
  st15= string[15];
  tvreal= array [1..100] of real;
  tvst= array [1..100] of st15;

procedure cargararray(var nombres:tvst;var punt1,punt2:tvreal;var n:byte);
var
  arch:text;
begin
  n:=0;
  assign(arch,'5_11.txt');
  reset(arch);
  while not eof(arch) do
  begin
    n:=n+1;
    readln(arch,nombres[n]);
    readln(arch,punt1[n],punt2[n]);
  end;
  close(arch);
end;
function superaprimero(punt1,punt2:tvreal;n:byte):byte;
var
  i:byte;
  aux:byte;
begin
  aux:=0;
  for i:=1 to n do
  begin
    if punt2[i]>punt1[i] then
      aux:=aux+1;
  end;
  superaprimero:=superaprimero;
end;
function mejormarca(punt1,punt2:tvreal;nombres:tvst;n:byte):st15;
var
  max:real;
  maxnombre:st15;
  i:byte;
begin
  max:=0;
  maxnombre:='';
  writeln('n:',n);
  for i:=1 to n do
  begin
    if (punt1[i]>max) or (punt2[i]>max) then
    begin
      maxnombre:=nombres[i];
      if punt1[i]>punt2[i] then
        max:=punt1[i]
      else
        max:=punt2[i];
    end;
  end;
  mejormarca:=maxnombre;
end;
function busquedaindice(nombres:tvst;buscado:st15;n:byte):byte;
var
  i:byte;
begin
  i:=1;
  while (i<=n) and (nombres[i]<>buscado) do
  begin
    i:=i+1;
  end;
  if i<=n then
    busquedaindice:=i
  else
    busquedaindice:=0;
end;

procedure marcaxnombre(punt1,punt2:tvreal;nombres:tvst;n:byte);
var
  i:byte;
  buscado:st15;
begin
  writeln('Ingresar nombre del atleta: ');
  readln(buscado);
  i:=busquedaindice(nombres,buscado,n);
  writeln('Los puntajes que hizo son: ',punt1[i],' y ',punt2[i]);
end;

procedure semifinal(var semi:tvst;var j:byte;punt1,punt2:tvreal;nombres:tvst;n:byte);
var
  i:byte;
  x:real;
begin
  writeln('Ingrese x a superar para pasar a semifinal: ');
  readln(x);
  j:=0;
  for i:=1 to n do
  begin
    if (punt1[i]>x) or (punt2[i]>x) then
    begin
      j:=j+1;
      semi[j]:=nombres[i];
    end;
  end;
end;
procedure mostrararray(vector:tvst;n:byte);
var
  i:byte;
begin
  for i:=1 to n do
    write(vector[i],' ');
  writeln;
end;

var
  nombres,semi:tvst;
  punt1,punt2:tvreal;
  n,j:byte;
  atleta:st15;


begin
  cargararray(nombres,punt1,punt2,n);
  writeln('Los que superan el primer disparo con el segundo son: ',superaprimero(punt1,punt2,n));
  atleta:=mejormarca(punt1,punt2,nombres,n);
  writeln('El atleta con mejor marca es: ',atleta);
  marcaxnombre(punt1,punt2,nombres,n);
  semifinal(semi,j,punt1,punt2,nombres,n);
  mostrararray(nombres,n);
  mostrararray(semi,j);
  readln;
end.


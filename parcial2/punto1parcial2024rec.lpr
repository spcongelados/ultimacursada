program punto1parcial2024rec;

type
  st5=string[5];
  tr=record
    cod:st5;
    gen:byte;
  end;
  tv=array[1..100] of tr;
  tm=array[1..100,1..100] of word;
  tg=array[1..6] of byte;

procedure cargarestructuras(var artistas:tv;var canciones:tm;var m,n:byte);
var
  arch:text;
  i:byte;
  c:char;
begin
  Assign(arch,'RANKING.TXT');
  reset(arch);
  m:=0;
  ReadLn(arch,n);
  while not eof(arch) do
  begin
    m:=m+1;
    read(arch,artistas[m].cod,artistas[m].gen);
    for i:=1 to n do
      read(arch,canciones[m,i]);
    readln(arch,c);
    if c<>'S' then
      m:=m-1;
  end;
end;

function superant(canciones:tm;m,n:byte;t:word):byte;
var
  i,j:byte;
  aux:byte;
begin
  aux:=0;
  for i:=1 to m do
    begin
      j:=1;
      while (canciones[i,j]>t) and (j<=n) do
        j:=j+1;
      if j>n then
        aux:=aux+1;
    end;
  superant:=aux;
end;
procedure ingreset(canciones:tm;m,n:byte);
var
  t:word;
begin
  writeln('Ingrese T:');
  readln(t);
  writeln('La cantidad de artistas que superan t tiempo en todas sus canciones es: ',superant(canciones,m,n,t));
end;

function promedio(canciones:tm;m,n:byte):real;
var
  i,j:byte;
  suma:word;
begin
  suma:=0;
  for i:=1 to m do
    begin
    for j:=1 to m do
      suma:=suma+canciones[i,j];
    end;
  promedio:=suma/(m*n);
end;

procedure duramas(canciones:tm;artistas:tv;m,n:byte;var nuevovec:tv;var l:byte);
var
  prom:real;
  i,j:byte;
begin
  prom:=promedio(canciones,m,n);
  l:=0;
  for i:=1 to m do
    begin
      j:=1;
      while (canciones[i,j]<prom) and (j<=n) do
        j:=j+1;
      if j<=n then
        begin
          l:=l+1;
          nuevovec[l].cod:=artistas[i].cod;
          nuevovec[l].gen:=artistas[i].gen;
        end;
    end;
end;

procedure mostrarnuevovec(nuevovec:tv;l:byte);
var
  i:byte;
begin
  for i:=1 to l do
    begin
      writeln(nuevovec[i].cod,' ',nuevovec[i].gen)
    end;
end;

procedure inicializargeneros(var generos:tg);
var
  i:byte;
begin
  for i:=1 to 6 do
    generos[i]:=0
end;

procedure cancionesxgenero(artistas:tv;m,n:byte);
var
  i:byte;
  generos:tg;
begin
  inicializargeneros(generos);
  for i:=1 to m do
    begin
      generos[artistas[i].gen]:=generos[artistas[i].gen]+n;
    end;
  for i:=1 to 6 do
    writeln('Genero:',i,' Canciones':generos[i]);
end;
var
  artistas,nuevovec:tv;
  canciones:tm;
  m,n,l:byte;

begin
  cargarestructuras(artistas,canciones,m,n);
  ingreset(canciones,m,n);
  duramas(canciones,artistas,m,n,nuevovec,l);
  cancionesxgenero(artistas,m,n);
end.


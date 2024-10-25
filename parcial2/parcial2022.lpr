program parcial2022;

const
  m=10;
type
  st8=string[8];
  st2=string[2];
  st30=string[30];
  tm=array[1..100,1..m] of word;
  tr1=record
    cod:st2;
    nombre:st30;
  end;
  tvp=array[1..100] of tr1;
  tr=record
    nombre:st30;
    edad:byte;
  end;
  tvr=array[1..100] of tr;

procedure cargarvector(var prov:tvp;var n:byte);
var
  arch:text;
  c:char;
begin
  assign(arch,'PROVINCIAS.TXT');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    readln(arch,prov[n].cod,c,prov[n].nombre);
  end;
end;

procedure inicializarmat(var inscriptos:tm;n,m:byte);
var
  i,j:byte;
begin
  for i:=1 to n do
  begin
    for j:=1 to m do
      inscriptos[i,j]:=0;
  end;
end;

procedure cargarmatriz(var inscriptos:tm;prov:tvp;n,m:byte);
var
  arch:text;
  i,j:byte;
  edad:byte;
  aux:st8;
  cod:st2;
begin
  Assign(arch,'INSCRIPTOS.TXT');
  reset(arch);
  while not eof(arch) do
  begin
    readln(arch,aux,edad,cod);
    j:=(edad div 10)+1;
    i:=1;
    while (cod<>prov[i].cod) do
      i:=i+1;
    inscriptos[i,j]:=inscriptos[i,j]+1;
  end;
end;

function busquedarec(prov:tvp;n:byte;x:st2):byte;
begin
  if n=0 then
    busquedarec:=0
  else
    begin
      if x<>prov[n].cod then
        busquedarec:=busquedarec(prov,n-1,x)
      else
        busquedarec:=n;
    end;
end;

function sininscriptos(inscriptos:tm;i,m:byte):byte;
var
  j:byte;
  cont:byte;
begin
  cont:=0;
  for j:=1 to m do
  begin
    if inscriptos[i,j]=0 then
      cont:=cont+1;
  end;
  sininscriptos:=cont;
end;

procedure pidex(inscriptos:tm;prov:tvp;n,m:byte);
var
  x:st2;
  i:byte;
begin
  writeln('Ingrese X:');
  readln(x);
  i:=busquedarec(prov,n,x);
  writeln('La cantidad de rangos etarios sin inscriptos en la prov ',prov[i].nombre,' es ',sininscriptos(inscriptos,i,m));
end;

function sumarangos(inscriptos:tm;i,r,t:byte):byte;
var
  j:byte;
  sum:byte;
begin
  r:=r div 10+1;
  t:=t div 10+1;
  for j:=r to t do
    sum:=sum+inscriptos[i,j];
  sumarangos:=sum;
end;

function menorcant(prov:tvp;inscriptos:tm;n,r,t:byte):byte;
var
  i,j,mini:byte;
  min,aux:byte;
begin
  if n>0 then
    begin
      mini:=1;
      min:=sumarangos(inscriptos,1,r,t);
      for i:=2 to n do
      begin
        aux:=sumarangos(inscriptos,i,r,t);
        if min>aux then
          begin
            min:=aux;
            mini:=i;
          end;
      end;
      menorcant:=mini;
    end
  else
    menorcant:=0;
end;

procedure provmenorcant(prov:tvp;inscriptos:tm;n,m:byte);
var
  r,t:byte;
  i:byte;
begin
  writeln('Ingrese r y t:');
  repeat
  read(r);
  read(t);
  if (r>m) or (t>m) then
    writeln('Error. Vuelva a ingresas r y t');
  until (r<=m) and (t<=m);
  i:=menorcant(prov,inscriptos,n,r,t);
  writeln('La provincia con menor cantidad de inscriptos en el rango seleccionado es: ',prov[i].nombre);
end;

function totinscriptos(inscriptos:tm;n,m,maux:byte):word;
begin
  if n=0 then
    totinscriptos:=0
  else
    begin
      if m=0 then
        totinscriptos:=totinscriptos(inscriptos,n-1,maux,maux)
      else
        totinscriptos:=totinscriptos(inscriptos,n,m-1,maux)+inscriptos[n,m];
    end;
end;

procedure generararregloc(prov:tvp;inscriptos:tm;n,m:byte;var nuevovec:tvr;var l:byte);
var
  i,j:byte;
  valor:real;
begin
  l:=0;
  valor:=(totinscriptos(inscriptos,n,m,m))/10;
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      if inscriptos[i,j]>valor then
        begin
          l:=l+1;
          nuevovec[l].nombre:=prov[i].nombre;
          nuevovec[l].edad:=j*10;
        end;
    end;
  end;
end;

procedure mostrararreglo(nuevovec:tvr;l:byte);
var
  i:byte;
begin
  for i:=1 to l do
  begin
    writeln('Provincia: ',nuevovec[l].nombre);
    writeln('Rango Etario: ',nuevovec[l].edad);
  end;
end;

var
  prov:tvp;
  inscriptos:tm;
  nuevovec:tvr;
  n,l:byte;

begin
  cargarvector(prov,n);
  cargarmatriz(inscriptos,prov,n,m);
  pidex(inscriptos,prov,n,m);
  provmenorcant(prov,inscriptos,n,m);
  generararregloc(prov,inscriptos,n,m,nuevovec,l);
  mostrararreglo(nuevovec,l);
end.


program project6_2;

type
  st7=string[7];
  tvst=array[1..100] of st7;
  tmbyte=array[1..100,1..100] of byte;

procedure cargarestructuras(var nombres:tvst;var n:byte;var notas:tmbyte;var m:byte);
var
  arch:text;
  i:byte;
begin
  assign(arch,'6_2.txt');
  reset(arch);
  n:=0;
  writeln('Cuantos parciales son?:');
  readln(m);
  while not eof(arch) do
  begin
    n:=n+1;
    read(arch,nombres[n]);
    for i:=1 to m do
      read(arch,notas[n,i]);
    readln(arch);
  end;
  close(arch);
end;
function aprobo(notas:tmbyte;i,m:byte):boolean;
var
  j:byte;
begin
  j:=1;
  while (notas[i,j]>=5) and (j<m+1) do
  begin
    j:=j+1;
  end;
  if j<m+1 then
    aprobo:=false
  else
    aprobo:=true;
end;

procedure aprobaron(nombres:tvst;notas:tmbyte;n,m:byte);
var
  i:byte;

begin
  write('Los que aprobaron todos los parciales son: ');
  for i:=1 to n do
  begin
    if aprobo(notas,i,m) then
      write(nombres[i],' ');
    writeln;
  end;
end;

function situacion(notas:tmbyte;i,m:byte):byte;;
var
  j:byte;
  suma:real;
begin
  suma:=0;
  for j:=1 to m do
  begin
    suma:=suma+notas[i,j];
  end;
  suma:=suma/m;
  if suma>=7 then
    situacion:=1;
  else if (suma >=5) and (notas[i,m]>=5) then
    situacion:=2;
  else
  situacion:=3;

  {1=promociona
   2=habilita
   3=desaprueba
  }
end;

procedure muestrasituacion(nombres:tvst;notas:tmbyte;n,m:byte);
var
  i,situacionaux:byte;
begin
  for i:=1 to n do
  begin
    write(nombres[i],': ');
    situacionaux:=situacion(notas,i,m);
    case situacionaux of
    1: writeln('Promociona')
      ;
    2: writeln('Habilita')
      ;
    3: writeln('Desaprueba')
      ;
    end;
  end;
end;

procedure promocionan(nombres:tvst;notas:tmbyte;n,m:byte;var prom:tvst;var k:byte);
var
  i,situacionaux:byte;
begin
  k:=0;
  for i:=1 to n do
  begin
    situacionaux:=situacion(notas,i,m);
    if situacionaux=1 then
    begin
      k:=k+1;
      prom[k]:=nombres[i];
    end;
  end;
end;
begin
end.


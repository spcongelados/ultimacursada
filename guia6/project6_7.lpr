program project6_7;
type
  tm=array[1..100,1..100] of integer;

procedure cargarmat(var subieron,bajaron:tm;var n,m:byte);
var
  arch:text;
  i,j:byte;
  asc,desc:integer;
begin
  assign(arch,'6_7.txt');
  reset(arch);
  n:=0;
  m:=0;
  for i:=1 to 100 do
  begin
    for j:=1 to 100 do
    begin
      subieron[i,j]:=0;
      bajaron[i,j]:=0;
    end;
  end;
  while not eof(arch) do
  begin
    read(arch,i,j);
    readln(arch,asc,desc);
    subieron[i,j]:=subieron[i,j]+asc;
    bajaron[i,j]:=bajaron[i,j]+desc;
    if i>n then
      n:=i;
    if j>m then
      m:=j;
  end;
  close(arch);
end;

function paradamasbajaron(bajaron:tm;n,m:byte):byte;
var
  i,j:byte;
  max,acum:integer;
begin
  max:=0;
  for i:=1 to n do
  begin
    acum:=0;
    for j:=1 to m do
      acum:=acum+bajaron[i,j];
    if acum>max then
    begin
      max:=acum;
      paradamasbajaron:=i;
    end;
  end;
  if max=0 then
  paradamasbajaron:=0;

end;

function lineamenossubieron(subieron:tm;n,m:byte):byte;
var
  i,j:byte;
  min,acum:integer;
begin
  min:=99999;
  for j:=1 to m do
  begin
    acum:=0;
    for i:=1 to n do
      acum:=acum+subieron[i,j];
    if acum<min then
    begin
      min:=acum;
      lineamenossubieron:=j;
    end;
  end;
  if min=99999 then
  lineamenossubieron:=0;
end;

function cantidadparadas40(subieron,bajaron:tm;n,m:byte):byte;
var
  i,j,aux:byte;
  acumsub,acumbaj:integer;
begin
  aux:=0;
  for i:=1 to n do
  begin
    acumsub:=0;
    acumbaj:=0;
    for j:=1 to m do
    begin
      acumsub:=acumsub+subieron[i,j];
      acumbaj:=acumbaj+bajaron[i,j];
    end;
    if acumbaj>0 then
    begin
      if (acumsub/acumbaj*100)<40 then
      begin
        aux:=aux+1;
      end;
    end;
  end;
  cantidadparadas40:=aux;
end;

begin
end.


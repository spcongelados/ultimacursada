program project5_1;

type
  tv= array[1..100] of real;

procedure leervec(var vec:tv;var n:byte);
var
  arch:text;
begin
  assign(arch,'5_1.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    read(arch,vec[n]);
  end;
  close(arch);
end;
function sumaelem(vec:tv;n:byte):real;
var
  i:byte;
begin
  sumaelem:=0;
  for i:=1 to n do
   sumaelem:=sumaelem+vec[i];
end;
procedure mostrarpares(vec:tv;n:byte);
var
  i:byte;
begin
  for i:=1 to n do
  begin
    if i mod 2=0 then
    write(vec[i],' ');
  end;
end;
function max(vec:tv;n:byte):real;
var
  i:byte;
begin
  max:=vec[1];
  for i:=2 to n do
  begin
    if max<vec[i] then
      max:=vec[i];
  end;
end;
function min(vec:tv;n:byte):real;
var
  i:byte;
begin
  min:=vec[1];
  for i:=2 to n do
  begin
    if min>vec[i] then
      min:=vec[i];
  end;
end;
function permutado(vec:tv;n:byte):tv;
var
  i:byte;
begin
  for i:=1 to n do
  begin
    permutado[n-i+1]:=vec[i]
  end;
end;




begin
end.


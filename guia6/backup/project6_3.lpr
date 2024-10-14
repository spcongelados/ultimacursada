program project6_3;

type
  tm=array[1..100,1..100] of integer;
  tv= array[1..100] of integer;

procedure cargarmatriz(var mat:tm;var n,m:byte);
var
  arch:text;
  vec:tv;
  i,j:byte;
begin
  assign(arch,'6_3.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    m:=0;
    while not eoln(arch) do
    begin
      m:=m+1;
      read(arch,vec[m]);
    end;
    readln(arch);
    if vec[m] mod vec[1]=0 then
    begin
      n:=n+1;
      for i:=1 to m do
        mat[n,i]:=vec[i];
    end;
  end;
  close(arch);
  for i:=1 to n do
    begin
      for j:=1 to m do
        write(mat[i,j],' ');
    end;
  writeln;
end;

var
  mat:tm;
  n,m:byte;
begin
  cargarmatriz(mat,n,m);
  readln;
end.


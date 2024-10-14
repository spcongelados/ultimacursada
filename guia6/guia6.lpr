program guia6;
type
  tmint=array[1..100,1..100] of integer;
  tvint=array[1..100] of integer;

procedure cargarmat(var mat:tmint;var n,m:byte);
var
  arch:text;
  i,j:byte;
begin
  assign(arch,'6_1.txt');
  reset(arch);
  readln(arch,n,m);
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      read(arch,mat[i,j]);
    end;
    readln(arch);
  end;
  close(arch);
end;
function jmax(mat:tmint;i,m:byte):byte;
var
  j:byte;
  max:integer;
begin
  jmax:=1;
  max:=mat[i,1];
  for j:=2 to m do
  begin
    if max<mat[i,j] then
    begin
      max:=mat[i,j];
      jmax:=j;
    end;
  end;
end;
procedure generararreglo(mat:tmatint;n:byte;vmax:tvint)
begin
end;



begin
end.


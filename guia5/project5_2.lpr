program project5_2;

type
  tv=array[1..100] of integer;

procedure leervec(var vec:tv; var n:byte);
var
  arch:text;
begin
  assign(arch,'5_1.txt');
  reset(arch);
  n := 0;
  while not eof(arch) do
  begin
    n := n + 1;
    read(arch,vec[n]);
  end;
  close(arch);
end;
procedure pareseimpares(vec:tv;n:byte;var pares,impares:tv;var j,k:byte);
var
  i:byte;
begin
  k:=0;
  j:=0;
  for i:=1 to n do
  begin
    if vec[i] mod 2=0 then
    begin
      j:=j+1;
      pares[j]:=vec[i];
    end
    else
    begin
      k:=k+1;
      impares[k]:=vec[i];
    end;
  end;
end;
begin
end.


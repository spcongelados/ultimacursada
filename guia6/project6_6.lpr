program project6_6;

type
  tm=array[1..100,1..100] of integer;
procedure generarcuadradomagico(var mat:tm;var n:byte);
var
  i,j:byte;
  cont:integer;
begin
  i:=1;
  j:= (n div 2)+1;
  for k:=1 to n*n do
  begin
    mat[i,j]:=k;
    if k mod n=0 then
      i:=i+1;
    else
      begin
        if i=1 then
          i:=n
        else
          i:=i-1;
        if j=n then
          j:=1
        else
          j:=j+1;
      end;
  end;
end;

function checkcuadradomagico(mat:tm;n:byte):boolean;
var
  i,j:byte;
begin

end;

begin
end.


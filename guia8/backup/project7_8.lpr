program project7_8;

type
  tm=array[1..100,1..100] of integer;

function minimomatriz(mat:tm;n,m,maux:byte):integer;
var
  mintemp:integer;
begin
  if (n=1) and(m=1) then
    minimomatriz:=mat[n,m]
  else if m>0 then
    minimomatriz:=minimomatriz(mat,n,m-1,maux)
  else
    minimomatriz:=minimomatriz(mat,n-1,maux,maux)
end;


begin
end.


program project8_7;

type
  tm=array[1..100,1..100] of integer;

function minimomatriz(mat:tm;n,m,maux:byte):integer;
var
  mintemp:integer;
begin
  if (n=1) and (m=1) then
    minimomatriz:=mat[n,m]
  else
    begin
      if m=1 then
        mintemp:=minimomatriz(mat,n-1,maux,maux)
      else
        mintemp:=minimomatriz(mat,n,m-1,maux);
      if mat[n,m]<mintemp then
        minimomatriz:=mat[n,m]
      else
        minimomatriz:=mintemp;
    end;
end;


begin
end.


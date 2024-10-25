program project8_12;

type
  tm=array[1..100,1..100] of integer;


function sumafila(mat:tm;n,m:byte):integer;
begin
  if m=0 then
    sumafila:=0
  else
    begin
      if n<>m then
        sumafila:=mat[n,m]+sumafila(mat,n,m-1)
      else
        sumafila:=sumafila(mat,n,m-1);
    end;
end;

function checkfilas(mat:tm;n,m:byte):boolean;
begin
  if n=1 then
    checkfilas:= mat[n,n]>sumafila(mat,n,m)
  else
    begin
      if mat[n,n]>sumafila(mat,n,m)then
        checkfilas:=checkfilas(mat,n-1,m)
      else
        checkfilas:=false;
    end;
end;

begin
end.


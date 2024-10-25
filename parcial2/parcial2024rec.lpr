program parcial2024rec;

type
  tm=array[1..100,1..100] of integer;

procedure cargamatriz(var mat:tm;var n,m:byte);
var
  arch:text;
begin
//La consigna no me pide la implementacion de la funcion
end;

function promediosuperior(mat:tm;n,m,cont,maux:byte):real;
begin
  if n=0 then
    begin
      promediosuperior:=0;
      cont:=0;
    end
  else
    begin
      if n>m then
        promediosuperior:=promediosuperior(mat,n-1,maux,cont,maux)
      else
        begin
          cont:=cont+1;
          promediosuperior:=mat[n,m]/(cont)+promediosuperior(mat,n,m-1,cont,maux);
        end;
    end;
end;

function columnasmayor(mat:tm;n,m,naux:byte;prom:real):byte;
begin
  if m=0 then
    columnasmayor:=0
  else
    begin
      if n=0 then
        columnasmayor:=columnasmayor(mat,naux,m-1,naux,prom)
      else
        begin
          if mat[n,m]<prom then
            columnasmayor:=columnasmayor(mat,n-1,m,naux,prom)
          else
            begin
              columnasmayor:=columnasmayor(mat,naux,m-1,naux,prom);
              columnasmayor:=columnasmayor+1;
            end;
        end;
    end;
end;

var
  mat:tm;
  n,m:byte;
  prom:real;

begin
  cargamatriz(mat,n,m);
  prom:=promediosuperior(mat,n,m,0,m);
  columnasmayor(mat,n,m,n,prom);
end.


program project8_5;
type
  tv=array[1..100] of integer;

function suma(vec:tv;n:byte):integer;
begin
  if n=0 then
    suma:=0
  else
    suma:=vec[n]+suma(vec,n-1);
end;

procedure mostrar(vec:tv;n:byte);
begin
  if n>0 then
    begin
      mostrar(vec,n-1);
      writeln(vec[n]);
    end;
end;

procedure mostraralreves(vec:tv;n:byte);
begin
  if n>0 then
    begin
      writeln(vec[n]);
      mostraralreves(vec,n-1);
    end;
end;

function maximo(vec:tv;n:byte):integer;
var
  maxtemp:integer;
begin
  if n=1 then
    maximo:=vec[n]
  else
    begin
      maxtemp:=maximo(vec,n-1);
      if vec[n]>maxtemp then
        maximo:=vec[n]
      else
        maximo:=maxtemp;
    end;
end;

function promedio(vec:tv;n,i:byte):real;
begin
  if n>0 then
    promedio:=vec[n]/i+promedio(vec,n-1,i)
  else
    promedio:=0;
end;


begin
end.


program project8_6;
type
  tv=array[1..100] of real;
function busqueda(vec:tv;n:byte;x:real):byte;
begin
  if n=0 then
    busqueda:=n
  else
  begin
    if vec[n]=x then
      busqueda:=n
    else
      busqueda:=busqueda(vec,n-1,x);
  end;
end;



begin
end.


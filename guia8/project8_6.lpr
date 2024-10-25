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

function binaria(vec:tv;pri,ult:byte;x:real):byte;
var
  medio:byte;
begin
  medio:= (pri+ult) div 2;
  if pri>ult then
    binaria:=0
  else if x=vec[medio] then
    binaria:=medio
  else if x>vec[medio] then
    binaria:=binaria(vec,medio+1,ult,x)
  else if x<vec[medio] then
    binaria:=binaria(vec,pri,medio-1,x);
end;

begin

end.


program project4_1y2;

function esletra(c:char):boolean;
begin
  if (upcase(c) in ['A'..'Z'] ) then
  esletra:=true;
  else
  esletra:=false;
end;
function factorial(n:byte):integer;
var
  i:byte;
begin
 factorial:=1;
 for i:=n downto 1 do
 factorial:=factorial*i;
end;
begin
end.


program project4_7;

function impuesto(importe:real;responsable:boolean):real;
begin
  if responsable then
    impuesto:=importe*0.21
  else
    impuesto:=importe*0.31;
end;

begin
end.


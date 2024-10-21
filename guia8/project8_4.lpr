program project8_4;

type
  st10=string[10];

function alreves(cadena:st10):st10;
var
  longitudreal:byte;
begin
  longitudreal:=;
  if Length(cadena)=0 then
    alreves:=''
  else
    alreves:=cadena[Length(cadena)]+alreves(Copy(cadena,1,Length(cadena)-1));
end;

begin
end.


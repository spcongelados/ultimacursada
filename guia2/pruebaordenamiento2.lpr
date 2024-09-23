program pruebaordenamiento2;

var
  c1,c2,c3,aux:char;

begin
  write('Ingrese los 3 caracteres: ');readln(c1,aux,c2,aux,c3);
  if c1>c2 then
  begin
    aux:=c1;
    c1:=c2;
    c2:=aux;
  end;
  if c1>c3 then
  begin
    aux:=c1;
    c1:=c3;
    c3:=aux;
  end;
  if c2>c3 then
  begin
    aux:=c2;
    c2:=c3;
    c3:=aux;
  end;
  writeln(c1,' ',c2,' ',c3);
  readln;
end.


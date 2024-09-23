program pruebaordenamiento;

var
  c1,c2,c3:char;
begin
  write('Ingrese los 3 caracteres a ordenar: ');readln(c1,c2,c3);
  if c1>c3 then
  begin
    if c2>c3 then
    begin
      if c2<c1 then
        writeln(c3,c2,c1)
      else
        writeln(c3,c1,c2)
    end
    else
      writeln(c2,c3,c1);
    end
  else
    if c2>c3 then
      writeln(c1,c3,c2)
    else
      if c2<c1 then
        writeln(c2,c1,c3)
      else
        writeln(c1,c2,c3);

  readln;
end.


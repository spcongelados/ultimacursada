program Ejercicio10guia3;
var
  cont:word;
  arch:text;
  n1,n2:integer;

begin
  cont:=1;
  n1:=0;
  n2:=0;
  assign(arch,'nums.txt');
  reset(arch);
  readln(arch,n1);
  while not eof(arch) do
  begin
    readln(arch,n2);
    if n1=n2 then
       cont:=cont+1
    else
       begin
         writeln('Numero: ',n1);
         writeln('Frecuencia: ',cont);
         cont:=1;
       end;
    n1:=n2;


  end;
  writeln('Numero: ',n1);
  writeln('Frecuencia: ',cont);
  readln;
end.


program project1;
var
  arch:text;
  saldo,monto:real;
  tipo:char;
  cont:byte;

begin
  assign(arch,'datos.txt');
  saldo:=0;
  monto:=0;
  cont:=0;
  reset(arch);
  readln(arch,saldo);
  while not eof(arch) do
  begin
    readln(arch,tipo);
    tipo:=upcase(tipo);
    readln(arch,monto);
    if tipo='D' then
       saldo:=saldo+monto
    else
      if saldo<monto then
         cont:=cont+1
      else
        saldo:=saldo-monto;
  end;
  writeln('su saldo es ',saldo:0:2);
  writeln('la cantidad de veces que no pudo retirar dinero fueron ',cont);
  readln;
end.


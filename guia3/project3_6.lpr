program project3_6;
var
  saldo,monto:real;
  arch:text;
  c:char;
  error:byte;
begin
  write('Ingrese saldo inicial: ');readln(saldo);
  assign(arch,'3_6.txt');
  reset(arch);
  read(arch,c);
  error:=0;
  while c<>'F' do
    begin
      readln(arch,monto);
      case c of
        'D':
          begin
          saldo:=saldo+monto;

          end;
        'R':
          begin
          if saldo>monto then
          saldo:=saldo-monto
          else
            error:=error+1;
          end;
      end;
      read(arch,c);
    end;
  writeln('El saldo final es: ',saldo:6:2,' con ',error,' errores por falta de fondos') ;
  readln;
end.


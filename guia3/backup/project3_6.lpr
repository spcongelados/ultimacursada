program project3_6;
var
  saldo,monto:real;
  arch:text;
  c:char;
begin
  write('Ingrese saldo inicial: ');readln(saldo);
  assign(arch,'3_6.txt');
  reset(arch);
  read(arch,c);
  while c<>'F' do
    begin
      readln(arch,monto);
      case c of
        'D':
          begin
          writeln(saldo:6:2,'+',monto:6:2,'=',saldo+monto:6:2);
          saldo:=saldo+monto;

          end;
        'R':
          begin
          writeln(saldo:6:2,'-',monto:6:2,'=',saldo-monto:6:2);
          saldo:=saldo-monto;
          end;
      end;
      read(arch,c);
      writeln(monto:6:2,' ',c)
    end;
  writeln('El saldo final es: ',saldo:6:2) ;
  readln;
end.


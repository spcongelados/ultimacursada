program project3_2;
const
  cargas=0.89;
  seguro=500;
  basico=15000;
var
  nombre,nombremax:string[10];
  sueldo,sueldomax,sueldotot:real;
  arch:text;
  anos,porciento,i,n:byte;
begin
  assign(arch,'3_2.txt');
  reset(arch);
  sueldomax:=0;
  sueldotot:=0;
  readln(arch,n);
  for i:=1 to n do
  begin
    readln(arch,nombre);
    readln(arch,anos);
    case anos of
    0..5:
    porciento:=5;
    6..10:
    porciento:=8;
    11..15:
    porciento:=12;
    else
      begin
        porciento:=20;
      end;
    end;
    sueldo:=basico+basico*porciento/100;
    sueldo:=sueldo*cargas-seguro;
    writeln('Nombre: ',nombre,' Sueldo: ',sueldo:6:2);
    if sueldo>sueldomax then
    begin
      sueldomax:=sueldo;
      nombremax:=nombre;
    end;
    sueldotot:=sueldotot+sueldo;
  end;
  writeln('El empleado que mas cobra es: ',nombremax);
  writeln('El promedio de sueldo es: ',sueldotot/n);
  readln;
end.


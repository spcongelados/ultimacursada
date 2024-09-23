program project3_7;
var
  nombre:string[13];
  nota1,nota2,nota3,prom:real;
  alumnos,aprobados:byte;
  arch:text;
begin
  assign(arch,'3_7.txt');
  reset(arch);
  alumnos:=0;
  aprobados:=0;
  nombre:='' ;
  while nombre <> '***' do
  begin
    readln(arch,nombre);
    if nombre<>'***' then
    begin
      readln(arch,nota1,nota2,nota3);
      prom:=(nota1+nota2+nota3)/3;
      if prom>=4 then
          begin
           writeln(nombre,' esta aprobado con una nota promedio de ',prom:2:2);
           aprobados:=aprobados+1;
          end
      else
        writeln(nombre,' esta desaprobado con una nota promedio de ',prom:2:2);
      alumnos:=alumnos+1;
    end;
  end;
  writeln('El porcentaje de aprobados es ',aprobados/alumnos*100:3:2,'%');
  readln;
end.


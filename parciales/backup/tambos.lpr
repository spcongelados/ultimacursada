program tambos;
var
  i,n,maxdia,dia,acum:byte;
  nombre:string[15];
  litros,litrost,maxlitros,x,acumlitros:real;
  arch:text;
begin
  write('Ingresar X a superar: ');
  readln(x);
  assign(arch,'tambos.txt');
  reset(arch);
  readln(arch,n);
  litrost:=0;
  acum:=0;
  for i:=1 to n do
  begin
    acumlitros:=0;
    maxlitros:=0;
    readln(arch,nombre);
    read(arch,dia);
    maxdia:=dia;
    while dia<>0 do
    begin
      readln(arch,litros);
      if litros>maxlitros then
      begin
        maxlitros:=litros;
        maxdia:=dia;
      end;

      acumlitros:=acumlitros+litros;
      read(arch,dia);
    end;
    if acumlitros>x then
      acum:=acum+1;
    litrost:=litrost+acumlitros;
    writeln('Tambo: ',nombre,' Dia Max: ',maxdia,' Litros Max: ',maxlitros:6:2);
    readln(arch);
  end;
  if n<>0 then
  begin
  writeln('El promedio de litros por tambo es: ',litrost/n);

  end
  else
  writeln('No se ingresaron tambos');
  writeln(acum,' tambos superan a el valor x de ',x);
  readln;
end.


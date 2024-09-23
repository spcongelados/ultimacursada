program project3_16;
var
  litros,km,menorkm,menorlitros:real;
  arch:text;
  patente,patentemax:string[6];
  viajes,maxviajes,n,i:byte;

begin
  assign(arch,'3_16.txt');
  reset(arch);
  menorkm:=9999999;
  maxviajes:=0;
  readln(arch,n);
  for i:=1 to n do
  begin
    read(arch,patente);
    readln(arch,litros);
    readln(arch,n);
    km:=0;
    viajes:=0;
    while n<>0 do
    begin
      viajes:=viajes+1;
      km:=km+n;
      readln(arch,n)
    end;
    writeln('El consumo de ',patente,' es de ',litros/km:6:2);
    if maxviajes<viajes then
    begin
      maxviajes:=viajes;
      patentemax:=patente;
    end;
    if menorkm>km then
    begin
      menorkm:=km;
      menorlitros:=litros;
    end;
  end;
  writeln('El que mas viajes hizo es ',patentemax);
  writeln('La cantidad de litros que utilizo el auto que menos km hizo fue de ',menorlitros:6:2);
  readln;
end.


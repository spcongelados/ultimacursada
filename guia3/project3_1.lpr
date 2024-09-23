program project3_1;

var
  arch:text;
  max,min,aux:integer;
  posmax,pos,ap,i,n:byte;
begin
  assign(arch,'3_1.txt');
  reset(arch);
  pos:=1;
  ap:=1;
  read(arch,n);
  read(arch,max);
  if max mod 2<>0 then
    min:=max
  else
    min:=2;
  for i:=2 to n do
  begin
    read(arch,aux);
    write(aux,' ');
    if (aux mod 2<>0) and ((aux<min) or (min=2)) then
      min:=aux;
    if aux>max then
    begin
      posmax:=i;
      max:=aux;
      ap:=1;
    end
    else if aux=max then
    ap:=ap+1;
  end;
  writeln;
  writeln('El maximo es ',max,' en la posicion ',posmax,' con ',ap,' apariciones');
  if min=2 then
  writeln('No hay numeros impares')
  else
  writeln('El minimo de los impares es ',min);
  readln;
end.


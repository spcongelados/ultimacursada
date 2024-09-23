program project3_3;
var
  num,ant:integer;
  count,i,n:byte;
  arch:text;
begin
  count:=0;
  assign(arch,'3_3.txt');
  reset(arch);
  read(arch,n);
  read(arch,ant);
  for i:=2 to n do
  begin
    read(arch,num);
    if num>ant then
      count:=count+1;
    ant:=num;
  end;
  writeln('La cantidad de veces que un numero supera al anterior es: ',count);
  readln;
end.


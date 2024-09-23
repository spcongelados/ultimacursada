program project3_4;
var
  num,ant,dif,difmax:integer;
  i,posmax:byte;
  arch:text;
begin
  assign(arch,'3_4.txt');
  reset(arch);
  read(arch,ant);
  i:=0;
  difmax:=0;
  while not eof(arch) do
  begin
    i:=i+1;
    read(arch,num);
    dif:=abs(num-ant);
    if dif>difmax then
    begin
      difmax:=dif;
      posmax:=i;
    end;
    ant:=num;
  end;
  writeln('La diferencia maxima es ',difmax,' y se encuentra en la posicion ',posmax);
  readln;
end.


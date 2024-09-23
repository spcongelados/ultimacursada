program project3_10;
var
  n1,n2,acum:byte;
  arch:text;
  c:char;
  error:integer;
begin
  assign(arch,'3_10.txt');
  reset(arch);
  acum:=1;
  read(arch,c);
  val(c,n1,error);
  while not eof(arch) do
  begin
    read(arch,c);
    read(arch,n2);
    if n1=n2 then
    acum:=acum+1
    else
      begin
        writeln('Num:',n1,' Frec:',acum);
        acum:=1
      end;
    n1:=n2;
  end;
  writeln('Num:',n1,' Frec:',acum);
  readln;
end.


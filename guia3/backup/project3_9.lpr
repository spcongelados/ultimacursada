program project3_9;
var
  arch:text;
  n,nant:byte;
begin
  assign(arch,'3_9.txt');
  reset(arch);
  read(arch,n);
  while not (eof(arch)) or (nant>n) do
  begin
    nant:=n;
    read(arch,n);
    if nant>n then
      writeln('Esta desordenado');
  end;
  if nant<n then
  writeln('Esta ordenado');
  readln;
end.


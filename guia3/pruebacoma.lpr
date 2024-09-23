program pruebacoma;

var
  aux:string[1];
  n:integer;
  arch:text;
begin
  assign(arch,'pruebacoma.txt');
  reset(arch);
  while not eof(arch) do
  begin
    read(arch,n);
    writeln(n);
    read(arch,aux);
    writeln(n,aux);
  end;
end.


program project3_19b;
var
  nant,n,nmax:integer;
  conjunto:boolean;
  arch:text;
begin
  assign(arch,'3_19.txt');
  reset(arch);
  read(arch,nant);
  while not eof(arch) do
  begin
    read(arch,n);
    if (nant<0) and (n>=0) then
    begin
      conjunto:=true;
      nmax:=0;
    end;
    if conjunto and (n<0) then
    begin
      conjunto:=false;
      write(nmax,' ');
    end;

    if conjunto and (n>nmax) then
      nmax:=n;
    nant:=n;
  end;
  readln;

end.


program project3_19;
var
  nant,n,nmax:integer;
  conjunto:boolean;
  arch:text;
begin
  assign(arch,'3_19.txt');
  reset(arch);

  while not eof(arch) do
  begin
    read(arch,nant);
    conjunto:=false;
    nmax:=0;
    while not eoln(arch) do
    begin
      read(arch,n);
      if (nant<0) and (n>=0) then
        conjunto:=true
      else if conjunto and (n<0) then
        begin
          conjunto:=false;
          write(nmax,' ');
          nmax:=0;
        end;
      if conjunto and (n>=nmax) then
        nmax:=n;
      nant:=n;
    end;
  end;
  readln;

end.


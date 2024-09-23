program project3_21;

var
  arch:text;
  nant,n,nmax:integer;
  i,imax,elem,maxelem:byte;

begin
  assign(arch,'3_21.txt');
  reset(arch);
  read(arch,nant);
  read(arch,n);
  writeln(nant,n);
  nmax:=0;
  maxelem:=0;
  i:=0;
  imax:=0;
  if nant<>0 then
  elem:=1
  else
  elem:=0;
  while (n<>0) or (nant<>0)do
  begin
    elem:=elem+1;
    if nant>nmax then
    begin
      nmax:=nant
    end;
    if n=0 then
    begin
      i:=i+1;
      if elem>maxelem then
      begin
        maxelem:=elem;
        imax:=i;
      end;
      writeln('Subconjunto:',i,'Maximo;',nmax);
      nmax:=-999999;
      elem:=0;
    end;

    nant:=n;
    read(arch,n);
    writeln(nant,n);
  end;
  writeln('El subconjunto con mas elementos es: ',imax);
  readln;
end.


program project3_22;
type
  st20=string[20];
var
  c:char;
  voc,maxvoc,i,n,capicua:byte;
  arch,archsalida:text;
  masvoc,pal,alreves:string[20];

begin
  assign(arch,'3_22.txt');
  assign(archsalida,'3_22b.txt');
  reset(arch);
  rewrite(archsalida);
  read(arch,c);
  maxvoc:=0;
  capicua:=0;
  while not eof(arch) do
  begin
    pal:='';
    alreves:='';
    n:=0;
    voc:=0;
    while (c<>' ') and (not eof(arch)) do
    begin
      pal:=pal+c;
      alreves:=c+alreves;
      n:=n+1;
      c:=upcase(c);
      if (c='A') or (c='E') or (c='I') or (c='O') or (c='U') then
      voc:=voc+1;
      read(arch,c);
      if eof(arch) then
      begin
        n:=n+1;
        pal:=pal+c;
        alreves:=c+alreves;
      end;
    end;
    if voc>maxvoc then
    begin
      maxvoc:=voc;
      masvoc:=pal;
    end;

    if n>0 then
    begin
      if n>4 then
      begin
      write(alreves);
      write(' ');
      end
    end;
    if pal=alreves then
    capicua:=capicua+1;
    read(arch,c);
  end;
  writeln(masvoc);
  writeln(capicua)
  close(arch);
  close(archsalida);
readln;
end.


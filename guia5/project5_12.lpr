program project5_12;

type
  tvst=array[1..100] of string[15];
  tvint=array[1..100] of integer;
  tvcar=array[1..100] of char;


procedure cargararrays(var vclave:tvst;var vprom:tvint;var vcar:tvcar;var n:byte);
var
  arch:text;
  c:char;
  suma,num:integer;
  i,contesp,ultima:byte;
begin
  assign(arch,'5_12.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    contesp:=0;
    c:=' ';
    suma:=0;
    vclave[n]:='';
    while c=' ' do
     read(arch,c);
    while c<>' ' do
    begin
      if (upcase(c) in ['A'..'Z']) or (c in ['1'..'9']) then
        vclave[n]:=vclave[n]+c;
      else
        contesp:=contesp+1;
      read(arch,c);
    end;
    if contesp<=3 then
    begin
      for i:=1 to 3 do
      begin
        read(arch,num);
        suma:=suma+num;
      end;
      vprom[n]:=suma/3;
      Read(arch,c);
      while c=' ' do
        Read(arch,c);
      vcar[n]:=c;
      ultima:=length(vclave[n]);
      if c<>vclave[n][ultima] then
        n:=n-1;
    end
    else
      n:=n-1;
  end;

end;


begin
end.


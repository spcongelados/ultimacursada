program project5_10;
type
  tvint=array[1..100] of integer;
  tvbyte=array[1..100] of byte;

procedure cargararchivo(var a:tvint;var n:byte);
var
  arch:text;
  i:byte;
begin
  assign(arch,'5_10.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    read(arch,a[n]);
  end;
end;

procedure cargararrays(var b:tvint;var c:tvbyte;var j:byte);
var
  i,n:byte;
  a:tvint;
  aux:integer;
  enrango:boolean;
  suma:integer;
  cantidad:byte;
begin
  cargararchivo(a,n);
  enrango:=false;
  i:=1;
  j:=0;
  while (i<=n) do
  begin
    if ((a[i]<0)) then
    begin
      enrango:=true;
      cantidad:=0;
      suma:=0;
      i:=i+1;
      while (i<=n) and (a[i]>=0) do
      begin
        cantidad:=cantidad+1;
        suma:=suma+a[i];
        i:=i+1;
      end;
      if a[i]<0 then
      begin
        j:=j+1;
        b[j]:=suma;
        writeln(b[j]);
        c[j]:=cantidad;
        writeln(c[j]);
      end;
    end;
    if a[i]>0 then
    i:=i+1;
  end;
end;

var
  b:tvint;
  c:tvbyte;
  j,i:byte;
begin
  cargararrays(b,c,j);
 (* for i:=1 to j do
  begin
    write(b[i],' ');
  end;
  writeln;
  for i:=1 to j do
  begin
    write(c[i],' ');
  end;    *)
  readln;
end.


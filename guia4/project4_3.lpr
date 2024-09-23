program project4_3;

function nnaturales(n:integer):integer;
var
  i:integer;
  suma:integer;
begin
  suma:=0;
  for i:=1 to n do
  begin
    suma:=suma+i;
  end;
  nnaturales:=suma;
end;

procedure mostrarsuma(n:integer);
begin
  writeln('Suma de N naturales: ',nnaturales(n));
end;
begin
end.


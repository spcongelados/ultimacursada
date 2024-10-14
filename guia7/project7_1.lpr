program project7_1;
type
  st10=string[10];
  tr=record
    nombre:st10;
    dia:byte;
    mes:byte;
    anio:integer;
  end;
  tv=array[1..100] of tr;
  testacion=array[1..4] of byte;

procedure cargararray(var vec:tv;var n:byte);
var
  arch:byte;
begin
  assign(arch,'7_1.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    readln(arch,vec[n].nombre,vec[n].dia,vec[n].mes,vec[n].anio);
  end;
  close(arch);
end;

procedure estacion(vec:tv;n:byte);
var
  i:byte;
  cont:testacion;
begin
  for i:=1 to 4 do
    cont:=0;
  for i:=1 to n do
  begin
    case vec[i].mes of
    1,2: estacion[1]:=estacion[1]+1;
      ;
    3:  begin
          if vec[i].dia>=21 then
            estacion[2]:=estacion[2]+1
          else
            estacion[1]:=estacion[1]+1;
        end;
      ;
    4,5:estacion[2]:=estacion[2]+1;
      ;
    6:  begin
          if vec[i].dia>=21 then
            estacion[3]:=estacion[3]+1
          else
            estacion[2]:=estacion[2]+1;
        end;
      ;
    7,8:estacion[3]:=estacion[3]+1;
      ;
    9:  begin
          if vec[i].dia>=21 then
            estacion[4]:=estacion[4]+1
          else
            estacion[3]:=estacion[3]+1;
        end;
      ;
    10,11:estacion[4]:=estacion[4]+1;
      ;
    end;
  end;
end;

begin
end.


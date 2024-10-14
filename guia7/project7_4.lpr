program project7_4;
type
  st10=string[10];
  tvres=array[1..100] of char;
  tr=record
    nombre:st10;
    cant:byte;
    res:tvres;
    punt:integer;
  end;
  tv=array[1..100] of tr;

procedure cargarvec(var vec:tv;var n:byte);
var
  arch:text;
  i:byte;
  aux:char;
begin
  n:=0;
  assign(arch,'7_4.txt');
  reset(arch);
  while not eof(arch) do
  begin
    n:=n+1;
    read(arch,vec[n].nombre,vec[n].cant);
    vec[n].punt:=0;
    for i:=1 to vec[n].cant do
    begin
      read(arch,vec[n].res[i],aux);
      case vec[n].res[i] of
      'G': vec[n].punt:=vec[n].punt+3
        ;
      'E': vec[n].punt:=vec[n].punt+1
        ;
      end;
    end;
  readln(arch);
  end;
  close(arch);
end;


begin
end.


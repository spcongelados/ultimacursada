program project7_3;
type
  treg=record
    x,y,distcent:real;
    cuadrante:byte;
  end;
  tv=array[1..100] of treg;
  tvc=array[0..6] of byte;
function distancia(x1,y1,x2,y2:real):real;
begin
  distancia:=Sqrt(sqr(x1-x2)+sqr(y1-y2));
end;

function fcuadrante(x,y:real):byte;
begin
  if x>0 then
  begin
    if y>0 then
      fcuadrante:=1
    else if y<0 then
      fcuadrante:=4
    else
      fcuadrante:=6;//eje y
  end
  else if x<0 then
  begin
    if y>0 then
      fcuadrante:=2
    else if y<0 then
      fcuadrante:=3
    else
      fcuadrante:=6;//eje y
  end
  else
  begin
    if y=0 then
      fcuadrante:=0//centro
    else
      fcuadrante:=5;//eje x
  end;
end;

procedure cargarvec(var vec:tv;var n:byte);
var
  arch:text;
begin
  n:=0;
  assign(arch,'7_3.txt');
  reset(arch);
  while not eof(arch) do
  begin
    n:=n+1;
    readln(arch,vec[n].x,vec[n].y);
    vec[n].distcent:=distancia(vec[n].x,vec[n].y,0,0);
    vec[n].cuadrante:=fcuadrante(vec[n].x,vec[n].y);
  end;
  close(arch);

end;

procedure alcentro(vec:tv;n:byte);
var
  i,maxi,mini:byte;
  max,min:real;
begin
  max:=-1;
  min:=99999999;
  for i:=1 to n do
  begin
    if vec[i].distcent>max then
    begin
      max:=vec[i].distcent;
      maxi:=i;
    end;
    if vec[i].distcent<min then
    begin
      min:=vec[i].distcent;
      mini:=i;
    end;
  end;
  if (max>=0) and (min<99999999) then
  begin
    writeln('El punto mas cercano al centro es: ',vec[mini].x,',',vec[mini].y);
    writeln('El punto mas lejano al centro es: ',vec[maxi].x,',',vec[maxi].y);
  end
  else
    writeln('Error en la carga de datos');
end;

procedure porcentajecuadrantes(vec:tv;n:byte);
var
  i:byte;
  cont:tvc;
begin
  for i:=0 to 6 do
    cont[i]:=0;
  for i:=1 to n do
  begin
    case vec[i].cuadrante of
    0: cont[0]:=cont[0]+1;
    1: cont[1]:=cont[1]+1;
    2: cont[2]:=cont[2]+1;
    3: cont[3]:=cont[3]+1;
    4: cont[4]:=cont[4]+1;
    5: cont[5]:=cont[5]+1;
    6: cont[6]:=cont[6]+1;
    end;
  end;
  if n<>0 then
  begin
    for i:=0 to 6 do
    begin
      if i in[1..4] then
      begin
        writeln('En el cuadrante ',i,' se encuentra el ',cont[i]/n*100,'%');
      end
      else if i=0 then
        writeln('En el centro se encuentra el ',cont[i]/n*100,'%')
      else if i=5 then
        writeln('En el eje x se encuentra el ',cont[i]/n*100,'%')
      else
        writeln('En el eje y se encuentra el ',cont[i]/n*100,'%');
    end;
  end
  else
    writeln('No se cargaron puntos correctamente');
end;

var
  vec:tv;
  n:byte;


begin
  cargarvec(vec,n);
  alcentro(vec,n);
  porcentajecuadrantes(vec,n);
  readln;
end.


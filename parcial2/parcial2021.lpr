program parcial2021;

type
  st3=string[3];
  st10=string[10];
  tvc=array[1..100] of st3;
  tvd=array[1..100] of st10;
  tm=array[1..100,1..100] of byte;
  tr=record
    cad:st3;
    desc:st10;
  end;
  tvr=array[1..100] of tr;

procedure cargarcad(var cad:tvc;var n:byte);
var
  arch:text;
begin
  assign(arch,'CadNoticias.txt');
  reset(arch);
  n:=0;
  while not eof(arch) do
  begin
    n:=n+1;
    readln(arch,cad[n]);
  end;
  close(arch);
end;

procedure cargardesc(var desc:tvd;var m:byte);
var
  arch:text;
  cod:byte;
  c:char;
begin
  assign(arch,'TipoNoticias.txt');
  reset(arch);
  m:=0;
  while not eof(arch) do
  begin
    read(arch,cod);
    readln(arch,c,desc[cod]);
    if cod>m then
      m:=cod;
  end;
  close(arch);
end;

procedure inicializarmat(var notas:tm;n,m:byte);
var
  i,j:byte;
begin
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      notas[i,j]:=0;
    end;
  end;
end;

procedure cargarnotas(var notas:tm;n,m:byte;cad:tvc);
var
  arch:text;
  i,j:byte;
  cadaux:st3;
begin
  inicializarmat(notas,n,m);
  assign(arch,'Coberturas.txt');
  reset(arch);
  while not eof(arch) do
  begin
    read(arch,cadaux,j);
    i:=1;
    while cad[i]<>cadaux do
      i:=i+1;
    readln(arch,notas[i,j]);
  end;
  close(arch);
end;

procedure indicesmin(notas:tm;n,m,maux:byte;var imin,jmin,min:byte);
begin
  if n=0 then
    begin
      min:=255;
      imin:=0;
      jmin:=0;
    end
  else
  begin
    if m=0 then
      indicesmin(notas,n-1,maux,maux,imin,jmin,min)
    else
      indicesmin(notas,n,m-1,maux,imin,jmin,min);
    if (min>notas[n,m]) and (notas[n,m]<>0) then
      begin
        min:=notas[n,m];
        imin:=n;
        jmin:=m;
      end;
  end;
end;

procedure incisoa(notas:tm;n,m:byte;cad:tvc;desc:tvd);
var
  imin,jmin,min:byte;
begin
  indicesmin(notas,n,m,m,imin,jmin,min);
  writeln('La cadena de noticias y descripcion que menos notas tuvo fue:',cad[imin],',',desc[jmin]);
end;

function totalportipo(notas:tm;n,j:byte):word;
begin
  if n=0 then
    totalportipo:=0
  else
    begin
      totalportipo:=totalportipo(notas,n-1,j)+notas[n,j];
    end;
end;

procedure porcentajecadenaportipo(notas:tm;cad:tvc;n,m:byte);
var
  i,x:byte;
  tot:word;
begin
  writeln('Ingrese el tipo de noticia por codigo:');
  readln(x);
  tot:=totalportipo(notas,n,x);
  for i:=1 to n do
  begin
    writeln(cad[i],': ',notas[i,x]/tot*100,'%')
  end;
end;

procedure cargarnuevovec(notas:tm;cad:tvc;desc:tvd;n,m:byte;var nuevovec:tvr;var l:byte);
var
  i,j:byte;
begin
  l:=0;
  for i:=1 to n do
  begin
    for j:=1 to m do
    begin
      if notas[i,j]<>0 then
        begin
          l:=l+1;
          nuevovec[l].cad:=cad[i];
          nuevovec[l].desc:=desc[j];
        end;
    end;
  end;
end;

procedure mostrarnuevovec(nuevovec:tvr;l:byte);
var
  i:byte;
begin
  for i:=1 to l do
  begin
    writeln(nuevovec[i].cad,' ',nuevovec[i].desc)
  end;
end;

var
  n,m,l:byte;
  notas:tm;
  cad:tvc;
  desc:tvd;
  nuevovec:tvr;

begin
  cargarcad(cad,n);
  cargardesc(desc,m);
  cargarnotas(notas,n,m,cad);
  incisoa(notas,n,m,cad,desc);
  porcentajecadenaportipo(notas,cad,n,m);
  cargarnuevovec(notas,cad,desc,n,m,nuevovec,l);
  mostrarnuevovec(nuevovec,l);
end.


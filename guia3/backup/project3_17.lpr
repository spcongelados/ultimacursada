program project3_17;

var
  precio,monto,final:real;
  promocion,aux:char;
  nombre,nombremax:string[15];
  artof,maxartof,soloof,n,i,oferta:byte;
  arch:text;

begin
  assign(arch,'3_17.txt');
  reset(arch);
  readln(arch,nombre);
  nombremax:=nombre;
  maxartof:=0;
  soloof:=0;
  while nombre<>'*****' do
  begin
    oferta:=0;
    writeln('Nombre: ',nombre);
    readln(arch,n);
    monto:=0;
    final:=0;
    for i:=1 to n do
    begin
      readln(arch,precio,aux,promocion);
      if promocion='S' then
      begin
        final:=final+precio*0.9;
        oferta:=oferta+1;
      end
      else
      begin
        final:=final+precio;
      end;
      monto:=monto+precio;
    end;
    if oferta=n then
      soloof:=soloof+1;
    writeln(nombre,' Monto total:',monto:6:2,' Total de descuento:',monto-final:6:2,' Precio final:',final:6:2);
    readln(arch,nombre);
  end;
  writeln(soloof,' clientes compraron solo articulos en oferta');
  readln;
end.


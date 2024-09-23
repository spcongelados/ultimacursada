program project4_9;

procedure sumafrac(n1,d1,n2,d2:integer);
begin
  writeln('La suma como fraccion es: ',n1*d2+n2*d1,'/',d1*d2)
end;

procedure multfrac(n1,d1,n2,d2:integer);
begin
  writeln('La multiplicacion como fraccion es: ',n1*n2,'/',d1*d2)
end;

procedure leerarchivo(arch:text;var n1,d1,n2,d2:integer);
begin
  while not eof(arch) do
    begin
      readln(arch,n1,d1,n2,d2);
      sumafrac(n1,d1,n2,d2);
      multfrac(n1,d1,n2,d2);
    end;
end;


begin
end.


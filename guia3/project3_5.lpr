program project3_5;

var
  k,q:integer;
  n:byte;
begin
  write('Ingrese K: ');readln(k);
  write('Ingrese Q: ');readln(q);
  n:=1;
  write('Los multiplos de ',k,' menores que ',q,' son: ');
  repeat
    write(k*n,' ');
    n:=n+1;
  until (k*n>q);
  readln;
end.


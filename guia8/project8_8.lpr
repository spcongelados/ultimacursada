program project8_8;

type
  tm=array[1..100,1..100] of integer;


procedure maximoporfila(mat:tm;n,m,maux:byte;var max:integer);
begin
  if (n=1) and (m=1) then
    max:=mat[n,m]
  else
    begin
      if m=1 then
        begin
          maximoporfila(mat,n-1,maux,maux,max);
          max:=mat[n,m];
        end
      else
        begin
          maximoporfila(mat,n,m-1,maux,max);
          if max<mat[n,m] then
            max:=mat[n,m];
          if m=maux then
            writeln('El máximo de la fila ', n, ' es: ', max);
        end;
    end;
end;

var
  mat:tm;
  max:integer;

begin
  mat[1, 1] := 5;   mat[1, 2] := 3;   mat[1, 3] := 8;   mat[1, 4] := 1;   mat[1, 5] := 4;
  mat[2, 1] := 7;   mat[2, 2] := 2;   mat[2, 3] := 6;   mat[2, 4] := 9;   mat[2, 5] := 5;
  mat[3, 1] := 1;   mat[3, 2] := 4;   mat[3, 3] := 3;   mat[3, 4] := 2;   mat[3, 5] := 8;
  mat[4, 1] := 0;   mat[4, 2] := 6;   mat[4, 3] := 7;   mat[4, 4] := 4;   mat[4, 5] := 3;
  mat[5, 1] := 2;   mat[5, 2] := 1;   mat[5, 3] := 5;   mat[5, 4] := 9;   mat[5, 5] := 0;

  maximoporfila(mat,5,5,5,max);
  readln;
end.


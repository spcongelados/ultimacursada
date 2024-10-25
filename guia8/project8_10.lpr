program project8_10;

type
  tv=array[1..100] of integer;

function creciente(num:integer):boolean;
var
  n1,n2:byte;
begin
  if num<10 then
    creciente:=true
  else
    begin
      n1:=num mod 10;
      n2:=(num mod 100) div 10;
      if n1>=n2 then
        creciente:=creciente(num div 10)
      else
        creciente:=false;
    end;
end;

procedure intercalar(vec1,vec2:tv;var vecr:tv;n,m:byte;var l:byte);
begin
  if (n=0) and (m=0) then
    l:=0
  else
    begin
      if (n>0) and (m>0) then
      begin
        if vec1[n] > vec2[m] then
          begin
            intercalar(vec1, vec2, vecr, n, m - 1, l);
            l := l + 1;
            vecr[l] := vec2[m];
          end
        else if vec1[n] < vec2[m] then
          begin
            intercalar(vec1, vec2, vecr, n - 1, m, l);
            l := l + 1;
            vecr[l] := vec1[n];
          end
        else
          begin
            intercalar(vec1, vec2, vecr, n - 1, m - 1, l);
            l := l + 1;
            vecr[l] := vec1[n];
          end;
      end
      else if n>0 then
        begin
          intercalar(vec1,vec2,vecr,n-1,m,l);
          l:=l+1;
          vecr[l]:=vec1[n];
        end
      else
        begin
          intercalar(vec1,vec2,vecr,n,m-1,l);
          l:=l+1;
          vecr[l]:=vec2[m];
        end;
    end;
end;

begin
end.


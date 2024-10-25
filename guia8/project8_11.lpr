program project8_11;

procedure mediapiramide(n,m,maux:byte);
begin
  if n>0 then
  begin
    if m=0 then
    begin
      mediapiramide(n-1,maux-1,maux-1);
      if n>1 then
        writeln;
    end
    else
    begin
      mediapiramide(n,m-1,maux);
      write(m);
    end;
  end;
end;


begin
  mediapiramide(9,9,9);
  readln;
end.


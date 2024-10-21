program project8_2;

function recursiva(i:integer):integer;
begin
  if i=0 then
    recursiva:=1;
  else
  begin
    if i mod 2=0 then
      recursiva:=1+recursiva(i-1)
    else
      recursiva:=recursiva(i-1)
  end;
end;


begin
end.


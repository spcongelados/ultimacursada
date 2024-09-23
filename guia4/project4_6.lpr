program project4_6;

function nrandom(a,b:integer):integer;
begin
  randomize;
  if b>a then
    nrandom:=a+random(b-a+1)
  else
    nrandom:=b+random(a-b+1);
end;
begin
end.


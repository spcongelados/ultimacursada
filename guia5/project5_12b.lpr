program project5_12b;
type
  st15=string[15];
  tvst=array[1..100] of st15;
  tvreal=array[1..100] of real;
  tvcar=array[1..100] of char;
procedure cargararrays(var vclave:tvst;var vprom:tvreal;var vcar:tvcar;var n:byte);
var
  arch:text;
  contcar,i,largo:byte;
  c:char;
  prom,num:real;
  palabra:st15;
begin
  n:=0;
  assign(arch,'5_12.txt');
  reset(arch);
  while not eof(arch) do
  begin
    read(arch,c);
    palabra:='';
    contcar:=0;
    prom:=0;
    while c<>' ' do
    begin
      if (upcase(c) in ['A'..'Z']) or (c in ['1'..'9']) then
      begin
           palabra:=palabra+c;
      end
      else
           contcar:=contcar+1;
      read(arch,c);

    end;
    if contcar<=3 then
    begin
         for i:=1 to 3 do
         begin
           read(arch,num);
           prom:=prom+num;
         end;
         prom:=prom/3;
         read(arch,c);
         while c=' ' do
           read(arch,c);
         largo:=length(palabra);
         if c<>palabra[largo] then
         begin
              n:=n+1;
              vclave[n]:=palabra;
              vprom[n]:=prom;
              vcar[n]:=c;
         end;
    end;
    readln(arch);
  end;
 close(arch);
end;

function clavemaximopromedio(letrabuscada:char;vclave:tvst;vprom:tvreal;vcar:tvcar;n:byte):st15;
var
  i,maxi:byte;
  max:real;
begin
 max:=-1;
 for i:=1 to n do
 begin
   if (vcar[i]=letrabuscada) and (vprom[i]>max) then
   begin
        max:=vprom[i];
        maxi:=i;
   end;
 end;

 if max=-1 then
   clavemaximopromedio:='';
 else
 clavemaximopromedio:=vclave[maxi];
end;


begin
end.


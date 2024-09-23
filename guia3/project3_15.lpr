program project3_15;

var
  c,obj:char;
  primera,misma:boolean;
  arch:text;
  contprim,contpal:byte;
begin
  write('Letra a analizar: ');readln(obj);
  assign(arch,'3_15.txt');
  reset(arch);
  c:=' ';
  primera:=true;
  misma:=false;
  contpal:=0;
  contprim:=0;
  while c <>'.' do
  begin
    read(arch,c);
    if (c in ['a'..'z']) or (c in ['A'..'Z']) then
    begin
     if (c=obj) then
      begin
        if primera then
          begin
            contprim:=contprim+1;
            contpal:=contpal+1;
            misma:=true;
          end
        else if not misma then
          begin
            contpal:=contpal+1;
            misma:=true;
          end;
      end;
     primera:=false;
    end
    else
      begin
        primera:=true;
        misma:=false;
      end;

  end;
  writeln('La letra se encuentra en ',contpal,' palabras, y ',contprim,' palabras comienzan con esa letra');
  readln;
end.


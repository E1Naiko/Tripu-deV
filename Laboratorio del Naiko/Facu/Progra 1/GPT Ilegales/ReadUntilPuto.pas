{
    Make a pascal module that reads characters until the word "puto" is made
}
program ReadUntilPuto;
var
  ch: char;
  inputString: string;
begin
  inputString := '';
  repeat
    read(ch);
    inputString := inputString + ch;
    if length(inputString) > 4 then
      delete(inputString, 1, 1); // Keep the last 4 characters
  until inputString = 'puto';
  writeln('Found the word "puto"!');
end.

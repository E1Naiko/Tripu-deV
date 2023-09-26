{
    Make a pascal module that reads characters until the word "puto" is made
    Make it also count the amount of characters that comes before it reads the word "puto"
}
program ReadUntilPutoWithCount;
var
  ch: char;
  inputString: string;
  charCount: integer;
begin
  inputString := '';
  charCount := 0;
  
  repeat
    read(ch);
    inputString := inputString + ch;
    charCount := charCount + 1;

    if length(inputString) > 4 then
      delete(inputString, 1, 1); // Keep the last 4 characters
      
  until inputString = 'puto';

  writeln('Found the word "puto" after reading ', charCount, ' characters.');
end.

{
I got the following pascal code: program ReadUntilPutoWithCount;
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
 Make it also inform when it finds the word 'nepe'
 
 
To modify your Pascal code to inform when it finds the word 'nepe', you can add an additional check within the repeat-until loop. Here's the modified code:

```pascal

```

Now, the program will inform you when it finds either 'puto' or 'nepe', and it will exit the loop when either word is found.


program Hello;
begin
  writeln ('Hello World')
end.
}

program ReadUntilPutoOrNepeWithCount;
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
      
    if Pos('puto', inputString) > 0 then
      writeln('Found the word "puto" after reading ', charCount, ' characters.');

    if Pos('nepe', inputString) > 0 then
      writeln('Found the word "nepe" after reading ', charCount, ' characters.');

  until (inputString = 'puto') or (inputString = 'nepe');

  writeln('Exiting the loop after reading ', charCount, ' characters.');
end.



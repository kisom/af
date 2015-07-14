--  The top-level for a Forth implemented in Ada. This derives heavily
--  from jonesforth (http://git.annexia.org/?p=jonesforth.git;a=summary).

with Dictionary;

procedure Forth is
begin
   Dictionary.Push ("+");
end Forth;

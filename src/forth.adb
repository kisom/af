--  The top-level for a Forth implemented in Ada. This derives heavily
--  from jonesforth (http://git.annexia.org/?p=jonesforth.git;a=summary).

with Text_IO, System, System.Address_To_Access_Conversions;
with Dictionary, Stack;

procedure Forth is
   package IntPtrs is new System.Address_To_Access_Conversions (Integer);
   Main_Stack : Stack.Stack_Type := Stack.New_Stack;
   Item       : Stack.Stack_Entry_Pointer;
   Num_Ptr    : access Integer;
begin
   Num_Ptr             := new Integer;
   Num_Ptr.all         := 42;
   Item                := new Stack.Stack_Entry;
   Item.all.Entry_Type := Stack.Integer;
   Item.all.Value      := IntPtrs.To_Address (Num_Ptr);

   Dictionary.Push ("+");
   Dictionary.Push ("-");
   Stack.Push (Main_Stack, Item);

   Text_IO.Put_Line ("OK");
end Forth;

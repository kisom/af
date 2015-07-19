--  The top-level for a Forth implemented in Ada. This derives heavily
--  from jonesforth (http://git.annexia.org/?p=jonesforth.git;a=summary).

with Text_IO, System, System.Address_To_Access_Conversions;
with Dictionary, Common, Stack;

procedure Forth is
   package IntPtrs is new System.Address_To_Access_Conversions (Integer);

   Main_Env   : Common.Env;
   Item       : Stack.Stack_Entry_Pointer;
   Num_Ptr    : access Integer;
begin
   Num_Ptr             := new Integer;
   Num_Ptr.all         := 42;
   Item                := new Stack.Stack_Entry;
   Item.all.Entry_Type := Stack.Integer;
   Item.all.Value      := IntPtrs.To_Address (IntPtrs.Object_Pointer
       (Num_Ptr));

   Dictionary.Push ("+");
   Dictionary.Push ("-");
   Common.Push (Main_Env, Item);

   Text_IO.Put_Line ("OK");
end Forth;

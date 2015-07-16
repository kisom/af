package body Stack is

   function New_Stack return Stack_Type is
   begin
      return null;
   end New_Stack;

   procedure Push (Stack : in out Stack_Type;
                   Item  : in     Stack_Entry_Pointer) is
      Temp : Stack_Entry_Pointer;
   begin
      if Stack = null then
         Stack := Stack_Type (Item);
         Stack.all.Next := null;
      else
         Temp          := Item;
         Temp.all.Next := Stack;
         Stack         := Stack_Type (Temp);
      end if;
   end Push;

   procedure Pop  (Stack : in out Stack_Type;
                   Item  :    out Stack_Entry_Pointer) is
   begin
      if Stack = null then
         raise Stack_Underflow;
      else
         Item          := Stack_Entry_Pointer (Stack);
         Stack         := Stack.all.Next;
         Item.all.Next := null;
      end if;
   end Pop;

end Stack;

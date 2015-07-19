package body Common is

   function Name_Size (Name : in     String) return Natural is
   begin
      return (Name'Size) / 8;
   end Name_Size;

   procedure Push (Environment : in out Env;
                   Item        : in     Stack.Stack_Entry_Pointer) is
   begin
      Stack.Push (Environment.Env_Stack, Item);
   end Push;

   procedure Pop (Environment : in out Env;
                   Item       :    out Stack.Stack_Entry_Pointer) is
   begin
      Stack.Pop (Environment.Env_Stack, Item);
   end Pop;

end Common;

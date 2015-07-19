package body Dictionary is

   --  The bottom 5 bits of the length header byte are used to store
   --  the length, yielding a maximum length of 31.
   Max_Name_Length : constant Natural := 31;

   procedure Push (Name : in     String) is
      Prev : DEntry_Ptr;
      Node : DEntry_Ptr;
   begin
      if Common.Name_Size (Name) <= Max_Name_Length then
         Node            := new DEntry;
         Node.all.Name   := To_Unbounded_String (Name);
         Node.all.Length := Common.Unsigned8 (Common.Name_Size (Name));

         if Latest /= null then
            Prev := Latest;
         else
            Prev := null;
         end if;

         Node.all.Next := Prev;
         Latest        := Node;
      end if;
   end Push;

   procedure Lookup (Name  : in     Unbounded_String;
                     Word  :    out DEntry_Ptr;
                     Found :    out Boolean) is
      Cursor : DEntry_Ptr := Latest;
   begin
      loop
         exit when Cursor = null;
         if Cursor.all.Name = Name then
            --  Copy word without copying over link pointer.
            Word                := new DEntry;
            Word.all.Name       := Cursor.all.Name;
            Word.all.Length     := Cursor.all.Length;
            Word.all.Definition := Cursor.all.Definition;
            Found               := True;
         else
            Cursor := DEntry_Ptr (Cursor.all.Next);
         end if;
      end loop;
   end Lookup;

   procedure Execute (Word : in     DEntry_Ptr;
                      Env  : in out Common.Env) is
   begin
      Word.all.Definition.all (Env);
   end Execute;

end Dictionary;

package body Dictionary is

   --  The bottom 5 bits of the length header byte are used to store
   --  the length, yielding a maximum length of 31.
   Max_Name_Length : constant Natural := 31;

   procedure Push (Name : in     String) is
      Prev : DEntry_Ptr;
      Node : DEntry_Ptr;
   begin
      if Common.Name_Size (Name) <= Max_Name_Length then
         Node        := new DEntry;
         Node.Name   := To_Unbounded_String (Name);
         Node.Length := Common.Unsigned8 (Common.Name_Size (Name));

         if Latest /= null then
            Prev := Latest;
         else
            Prev := null;
         end if;

         Node.Link_Pointer := Prev;
         Latest            := Node;
      end if;
   end Push;

end Dictionary;

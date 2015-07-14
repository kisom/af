package body Common is

   function Name_Size (Name : in     String) return Natural is
   begin
      return (Name'Size) / 8;
   end Name_Size;

end Common;

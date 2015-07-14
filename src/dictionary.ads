with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Common;

package Dictionary is
   
   type DEntry is
      record
         Link_Pointer : access DEntry;
         Length       : Common.Unsigned8;
         Name         : Unbounded_String;
   end record;

   Latest : access DEntry;

   procedure Push (Name : in    String);

end Dictionary;
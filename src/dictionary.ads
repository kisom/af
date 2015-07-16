with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;
with Common;

package Dictionary is

   type DEntry is
      record
         Next       : access DEntry;
         Length     : Common.Unsigned8;
         Name       : Unbounded_String;

         --  The definition should be a pointer to a
         --  a function that returns an error.
         Definition : access function (Env : Common.Env)
                                       return Common.Error;
   end record;
   type DEntry_Ptr is access all DEntry;

   Latest : DEntry_Ptr;

   procedure Push (Name : in    String);

   procedure Lookup (Name  : in     Unbounded_String;
                     Word  :    out DEntry_Ptr;
                     Found :    out Boolean);

end Dictionary;

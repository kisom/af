--  Common types and functions for the Forth.

package Common is

   type Unsigned8  is mod 2 ** 8;
   Max_Unsigned8 : Natural := (2 ** 8) - 1;

   type Unsigned32 is mod 2 ** 32;

   function Name_Size (Name : in     String) return Natural;

end Common;

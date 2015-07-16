--  Common types and functions for the Forth.
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;

with Stack;

package Common is

   type Unsigned8  is mod 2 ** 8;
   Max_Unsigned8 : Natural := (2 ** 8) - 1;

   type Unsigned32 is mod 2 ** 32;

   function Name_Size (Name : in     String) return Natural;

   type Error is
      record
         Occurred : Boolean;          --  Did an error occur?
         Message  : Unbounded_String; --  What happened?
      end record;

   type Env is
      record
         Env_Stack : Stack.Stack_Type;
      end record;

end Common;

--  Common types and functions for the Forth.
with Ada.Strings.Unbounded;   use Ada.Strings.Unbounded;

with Stack;

package Common is

   type Unsigned8  is mod 2 ** 8;
   Max_Unsigned8 : Natural := (2 ** 8) - 1;

   type Unsigned32 is mod 2 ** 32;

   function Name_Size (Name : in     String) return Natural;

   type Execution_Status is (Success, Error);

   type Result is
      record
         Status  : Execution_Status; --  Did an error occur?
         Code    : Unsigned8;        --  Numeric condition identifier.
         Message : Unbounded_String; --  What happened?
      end record;

   type Env is
      record
         Env_Stack : Stack.Stack_Type;
      end record;

   procedure Push (Environment : in out Env;
                   Item        : in     Stack.Stack_Entry_Pointer);

   procedure Pop (Environment : in out Env;
                   Item       :    out Stack.Stack_Entry_Pointer);

end Common;

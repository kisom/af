with System;

package Stack is
   type Stack_Value_Type is (Integer, UnsignedInteger, String, Word);
   type Stack_Entry is
      record
         Entry_Type : Stack_Value_Type;
         Value      : System.Address;
         Next       : access Stack_Entry;
      end record;
   type Stack_Entry_Pointer is access all Stack_Entry;
   type Stack_Type is access all Stack_Entry;

   Stack_Overflow  : exception;
   Stack_Underflow : exception;

   function New_Stack return Stack_Type;

   procedure Push (Stack : in out Stack_Type;
                   Item  : in     Stack_Entry_Pointer);
   procedure Pop  (Stack : in out Stack_Type;
                   Item  :    out Stack_Entry_Pointer);

end Stack;

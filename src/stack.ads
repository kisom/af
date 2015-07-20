with System;

package Stack is
   type Stack_Value_Type is (Integer, UnsignedInteger, String, Word);

   --  A stack entry should store the type of value being stored, a pointer
   --  to the value being stored, and a pointer to the next value on the
   --  stack. This approach is based on my understanding of how Ada works,
   --  and is probably not the best approach. Callers that wish to use a
   --  value on the stack will have to verify the type matches what they
   --  expect to receive and signal an error if not.
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
                   Item  : in     Stack_Entry_Pointer)
      with
         Pre  => Item /= null,
         Post => Stack /= null;
   procedure Pop  (Stack : in out Stack_Type;
                   Item  :    out Stack_Entry_Pointer)
      with
         Pre  => Stack /= null,
         Post => Item  /= null;

end Stack;

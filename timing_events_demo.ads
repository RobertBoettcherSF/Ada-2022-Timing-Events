--  Ada 2022 topic: Ada.Real_Time.Timing_Events.
pragma Ada_2022;

package Timing_Events_Demo is

   --  Arm a one-shot timing event; wait until it fires (or 2s timeout).
   function Wait_For_Pulse (Delay_Ms : Natural) return Boolean;

end Timing_Events_Demo;

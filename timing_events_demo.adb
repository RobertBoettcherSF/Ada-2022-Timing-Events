pragma Ada_2022;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Real_Time.Timing_Events;

package body Timing_Events_Demo is

   protected Pulse is
      procedure Handler
        (Event : in out Ada.Real_Time.Timing_Events.Timing_Event);
      procedure Reset;
      entry Wait;
   private
      Fired : Boolean := False;
   end Pulse;

   protected body Pulse is
      procedure Handler
        (Event : in out Ada.Real_Time.Timing_Events.Timing_Event)
      is
         pragma Unreferenced (Event);
      begin
         Fired := True;
      end Handler;

      procedure Reset is
      begin
         Fired := False;
      end Reset;

      entry Wait when Fired is
      begin
         null;
      end Wait;
   end Pulse;

   TE : Ada.Real_Time.Timing_Events.Timing_Event;

   function Wait_For_Pulse (Delay_Ms : Natural) return Boolean is
      D : constant Time_Span := Milliseconds (Delay_Ms);
   begin
      Pulse.Reset;
      Ada.Real_Time.Timing_Events.Set_Handler
        (TE, Clock + D, Pulse.Handler'Access);
      select
         Pulse.Wait;
         return True;
      or
         delay 2.0;
         return False;
      end select;
   end Wait_For_Pulse;

end Timing_Events_Demo;

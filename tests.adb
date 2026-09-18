pragma Ada_2022;

with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Timing_Events_Demo;

procedure Tests is
   Ok : Boolean;
begin
   Ok := Timing_Events_Demo.Wait_For_Pulse (Delay_Ms => 50);
   Assert (Ok);
   Put_Line ("PASS Timing_Event handler fired after short delay");

   Put_Line ("All Timing Events topic tests passed.");
end Tests;

-- Main entry point for the Intrusion Detection System
with Ada.Text_IO;
with Ada.Calendar;
with Ada.Streams;
with Ada.Unbounded_Strings;
use Ada.Unbounded_Strings;

with IDS_Types;
with IDS_Config;
with IDS_Detection;
with IDS_Anomaly;

use IDS_Types;
use IDS_Config;

package IDS_Main is
   -- Sample signatures for initialization
   Signatures : constant Signature_Array := (
      1 => (1, To_Unbounded_String("GET /admin HTTP/1.1"), 8),
      2 => (2, To_Unbounded_String("UNION SELECT"), 9),
      3 => (3, To_Unbounded_String("/etc/passwd"), 7)
   );
end IDS_Main;

with Ada.Text_IO; use Ada.Text_IO;

procedure IDS_Main is
   use type IDS_Types.Alert;
   use type IDS_Types.Alert_Array;
begin
   -- Initialize the detection engine
   IDS_Detection.Initialize (IDS_Detection.Signatures);
   
   Put_Line ("IDS Initialized. Waiting for traffic...");
   
   -- Simulation loop
   while True loop
      -- In a real implementation, this would read from a network socket
      -- Here we simulate a packet
      declare
         Pkt : constant Packet := (
            Source_IP => "192.168.1.100",
            Dest_IP => "10.0.0.1",
            Source_Port => 54321,
            Dest_Port => 80,
            Protocol => "TCP",
            Payload => To_Unbounded_String("GET /admin HTTP/1.1")
         );
         
         Alerts : IDS_Types.Alert_Array := IDS_Detection.Analyze (Pkt);
      begin
         if Alerts'Length > 0 then
            for A of Alerts loop
               Put_Line ("ALERT: " & A.Message);
            end loop;
         end if;
      end;
      
      -- Artificial delay for simulation
      delay 1.0;
   end loop;
end IDS_Main;

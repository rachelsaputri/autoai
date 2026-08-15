-- Package defining the detection engine interface
with IDS_Types;
use type IDS_Types.Packet;
use type IDS_Types.Signature;
use type IDS_Types.Alert;

package IDS_Detection is
   -- Initialize the engine with a list of signatures
   procedure Initialize
     (Signatures : in IDS_Types.Signature_Array);
   
   -- Analyze a packet and return alerts
   function Analyze (Pkt : in IDS_Types.Packet) return IDS_Types.Alert_Array;
end IDS_Detection;

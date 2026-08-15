-- Package defining anomaly scoring logic
with IDS_Types;
use type IDS_Types.Packet;

package IDS_Anomaly is
   -- Calculate anomaly score for a packet
   function Score (Pkt : in IDS_Types.Packet) return Float;
end IDS_Anomaly;

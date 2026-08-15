-- Package defining core data types for the IDS
package IDS_Types is
   -- Packet structure
   type Packet is record
      Source_IP : String (1..15);  -- Fixed size for simplicity
      Dest_IP : String (1..15);
      Source_Port : Natural;
      Dest_Port : Natural;
      Protocol : String (1..4);
      Payload : Unbounded_Strings.Unbounded_String;
   end record;
   
   -- Signature for matching
   type Signature is record
      ID : Natural;
      Pattern : Unbounded_Strings.Unbounded_String;
      Severity : Natural;  -- 1 to 10
   end record;
   
   -- Alert generated upon detection
   type Alert is record
      Timestamp : Time;
      Severity : Natural;
      Message : Unbounded_Strings.Unbounded_String;
      Source_Packet : Packet;
   end record;
   
   -- Packet stream type
   type Packet_Stream is access all Packet;
end IDS_Types;

-- Package defining configuration constants for the IDS
package IDS_Config is
   -- Network interface to monitor
   Interface_Name : constant String := "eth0";
   
   -- Maximum packet size to capture
   Max_Packet_Size : constant Natural := 65535;
   
   -- Threshold for anomaly detection
   Anomaly_Threshold : constant Float := 0.75;
   
   -- Log file path
   Log_File_Path : constant String := "ids_alerts.log";
end IDS_Config;

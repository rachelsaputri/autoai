-- MaxScript 3D Threat Topology Visualizer Engine
-- This script strictly handles the procedural generation of 3D scenes from security telemetry data.

-- Global Configuration
try (destroyDialog visualizer_dlg) catch()
rollout visualizer_dlg "Threat 3D Visualizer" width:400 height:600
(
    button btn_import "Import Correlation Data"
    button btn_render "Generate 3D Scene"
    button btn_animate "Start Threat Animation"
    label lbl_status "Status: Ready"
    progressbar pgb_load width:350 height:20 range:0 100
    
    fn parse_json_data filepath = 
    (
        -- In a production environment, this would use a dedicated JSON parser or Max's built-in data handlers.
        -- For this MaxScript implementation, we simulate parsing a structured telemetry array.
        print ("Parsing telemetry from: " + filepath)
        #( -- Mock data structure for demonstration
            #(id:1, node:"192.168.1.10", severity:8, vector:"network", x:0, y:0, z:0)
            #(id:2, node:"192.168.1.25", severity:6, vector:"endpoint", x:5, y:3, z:2)
            #(id:3, node:"10.0.0.5", severity:9, vector:"cloud", x:-3, y:6, z:1)
        )
    )
    
    fn build_3d_topology data_array =
    (
        clearSelection()
        local node_group = Group name:"Threat_Topology_Graph"
        
        for datum in data_array do
        (
            local severity = datum.severity
            local scale_val = (severity * 0.2) + 0.5
            local color = bezier_color color:(color (severity*25) (severity*5) 50)
            
            -- Create a sphere for each node
            local node_obj = sphere name:("Node_" + datum.node) radius:scale_val pos:[datum.x, datum.y, datum.z]
            node_obj.material = standard diffuse_color:color
            group by node_group
        )
        
        -- Connect nodes based on proximity or vector relationship (simplified for demo)
        for i = 1 to data_array.count - 1 do
        (
            local start = data_array[i]
            local end = data_array[i+1]
            local line_obj = line name:("Link_" + i as string)
            addknot line_obj 1 #corner #line [start.x, start.y, start.z]
            addknot line_obj 2 #corner #line [end.x, end.y, end.z]
            update line_obj
        )
        
        select node_group
        zoomExt selected
        print ("3D Topology generated successfully.")
    )
    
    fn run_import =
    (
        local file_path = getOpenFileName caption:"Select Correlation Telemetry File"
        if file_path != undefined then
        (
            lbl_status.text = "Status: Processing..."
            local data = parse_json_data file_path
            build_3d_topology data
            lbl_status.text = "Status: Scene Generated"
        )
        else
        (
            lbl_status.text = "Status: No file selected"
        )
    )
    
    on btn_import pressed do run_import
    on btn_render pressed do
    (
        lbl_status.text = "Status: Rendering Final Frame..."
        render frame:0 to:10 outputsize:#(1920,1080)
        lbl_status.text = "Status: Render Complete"
    )
    on btn_animate pressed do
    (
        lbl_status.text = "Status: Animating Attack Propagation..."
        playbackRange = (0,100)
        animate on
        for t = 0 to 100 do
        (
            currenttime = t
            -- Animate node sizes based on temporal severity spikes
            for obj in nodes where superclassof obj == sphere do
            (
                obj.radius = obj.radius + (sin(t) * 0.1)
            )
        )
        currenttime = 0
        lbl_status.text = "Status: Animation Loop Ready"
    )
)
createdialog visualizer_dlg

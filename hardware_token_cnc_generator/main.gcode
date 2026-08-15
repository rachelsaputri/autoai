% MAIN: Hardware Token CNC Generator
; Generates G-code for manufacturing hardware security tokens
; Designed for air-gapped authentication systems
; Version: 1.0

; Initialize CNC Machine
G21 ; Set units to millimeters
G90 ; Absolute positioning
G17 ; Select XY plane
G40 ; Cancel cutter radius compensation
G49 ; Cancel tool length compensation
G80 ; Cancel canned cycles

; Define Token Parameters
; Token ID: HST-001
; Material: Stainless Steel 316L
; Dimensions: 35.0mm x 20.0mm x 2.5mm
; Surface Finish: Ra 0.8μm

; Safety Block
G0 Z50.0 ; Safe height
G0 X0 Y0 ; Home position

; Tool Selection
T1 M6 ; Select end mill D2.0
S20000 M3 ; Spindle on, 20000 RPM

; Roughing Operation
G0 X-5.0 Y-5.0
G1 Z-2.0 F100 ; Plunge
G1 X-5.0 Y5.0 F500 ; Rough pass 1
G1 X5.0 Y5.0 F500
G1 X5.0 Y-5.0 F500
G1 X-5.0 Y-5.0 F500

; Tool Path Generation for Token Geometry
; Contour following for outer boundary
G0 X0 Y0
G1 Z-2.0 F80
G2 X17.5 Y10.0 I0 J10.0 F300 ; Arc 1
G1 X17.5 Y-10.0 F300 ; Line
G2 X0 Y-10.0 I0 J-10.0 F300 ; Arc 2
G1 X0 Y0 F300 ; Close loop

; Hole Drilling for Authentication Keys
; Hole 1: (5, 5)
G0 X5 Y5
G81 X5 Y5 Z-3.0 R2.0 F150 ; Drill hole

; Hole 2: (-5, 5)
G81 X-5 Y5 Z-3.0 R2.0 F150

; Hole 3: (5, -5)
G81 X5 Y-5 Z-3.0 R2.0 F150

; Hole 4: (-5, -5)
G81 X-5 Y-5 Z-3.0 R2.0 F150

; Finishing Pass
G0 Z1.0
T2 M6 ; Select finishing end mill D1.0
S25000 M3
G1 Z-2.0 F50
G2 X17.5 Y10.0 I0 J10.0 F200
G1 X17.5 Y-10.0 F200
G2 X0 Y-10.0 I0 J-10.0 F200
G1 X0 Y0 F200

; Surface Inspection
G0 Z10.0
G91 ; Incremental positioning
G1 Z-0.1 F100 ; Verify surface contact
G1 Z0.1 F100
G90 ; Return to absolute

; Retract and Stop
G0 Z50.0
M5 ; Spindle off
M9 ; Coolant off
M30 ; End of program

import tkinter as tk
from tkinter import ttk, messagebox
import threading
import time
import random

class InteractiveDiagnosticTool:
    def __init__(self, root):
        self.root = root
        self.root.title("Interactive Diagnostic & Visualization Tool")
        self.root.geometry("800x600")
        
        self.running = False
        self.data_points = []
        
        self.setup_ui()
        
    def setup_ui(self):
        # Top frame for controls
        control_frame = tk.Frame(self.root)
        control_frame.pack(side=tk.TOP, fill=tk.X, padx=10, pady=5)
        
        self.start_btn = tk.Button(control_frame, text="Start Diagnostics", command=self.start_diagnostics)
        self.start_btn.pack(side=tk.LEFT, padx=5)
        
        self.stop_btn = tk.Button(control_frame, text="Stop Diagnostics", command=self.stop_diagnostics, state=tk.DISABLED)
        self.stop_btn.pack(side=tk.LEFT, padx=5)
        
        self.reset_btn = tk.Button(control_frame, text="Reset", command=self.reset_data)
        self.reset_btn.pack(side=tk.LEFT, padx=5)
        
        # Main frame for visualization
        self.canvas_frame = tk.Frame(self.root)
        self.canvas_frame.pack(side=tk.TOP, fill=tk.BOTH, expand=True, padx=10, pady=5)
        
        self.canvas = tk.Canvas(self.canvas_frame, bg='white')
        self.canvas.pack(fill=tk.BOTH, expand=True)
        
        # Status bar
        self.status_bar = tk.Label(self.root, text="Ready", bd=1, relief=tk.SUNKEN, anchor=tk.W)
        self.status_bar.pack(side=tk.BOTTOM, fill=tk.X)
        
    def start_diagnostics(self):
        if not self.running:
            self.running = True
            self.start_btn.config(state=tk.DISABLED)
            self.stop_btn.config(state=tk.NORMAL)
            self.status_bar.config(text="Diagnostics running...")
            threading.Thread(target=self.diagnostics_loop, daemon=True).start()
            
    def stop_diagnostics(self):
        self.running = False
        self.start_btn.config(state=tk.NORMAL)
        self.stop_btn.config(state=tk.DISABLED)
        self.status_bar.config(text="Diagnostics stopped.")
        
    def reset_data(self):
        self.running = False
        self.start_btn.config(state=tk.NORMAL)
        self.stop_btn.config(state=tk.DISABLED)
        self.data_points = []
        self.canvas.delete("all")
        self.status_bar.config(text="Data reset.")
        self.draw_graph()
        
    def diagnostics_loop(self):
        while self.running:
            # Simulate generating diagnostic data
            metric_1 = random.gauss(100, 20)
            metric_2 = random.gauss(50, 10)
            metric_3 = random.randint(0, 100)
            
            self.data_points.append({
                "m1": metric_1,
                "m2": metric_2,
                "m3": metric_3,
                "time": time.time()
            })
            
            # Keep only last 100 points to avoid memory issues and keep graph readable
            if len(self.data_points) > 100:
                self.data_points.pop(0)
                
            self.draw_graph()
            
            # Check for anomalies (just a simple threshold check for demo)
            if metric_1 > 130:
                self.root.after(0, lambda: self.status_bar.config(text=f"ALERT: Metric 1 high ({metric_1:.2f})"))
            
            time.sleep(0.5)
            
    def draw_graph(self):
        self.canvas.delete("all")
        
        width = self.canvas.winfo_width() if self.canvas.winfo_width() > 0 else 800
        height = self.canvas.winfo_height() if self.canvas.winfo_height() > 0 else 600
        
        if len(self.data_points) < 2:
            return
            
        # Define plot area
        margin_left = 50
        margin_bottom = 50
        margin_right = 20
        margin_top = 20
        
        plot_width = width - margin_left - margin_right
        plot_height = height - margin_bottom - margin_top
        
        # Draw axes
        self.canvas.create_line(margin_left, margin_bottom, width - margin_right, margin_bottom)
        self.canvas.create_line(margin_left, margin_top, margin_left, margin_bottom)
        
        # Find min/max for scaling
        m1_vals = [d["m1"] for d in self.data_points]
        m2_vals = [d["m2"] for d in self.data_points]
        
        m1_min, m1_max = min(m1_vals), max(m1_vals)
        m2_min, m2_max = min(m2_vals), max(m2_vals)
        
        # Add some padding to range
        if m1_min == m1_max:
            m1_min -= 1
            m1_max += 1
        if m2_min == m2_max:
            m2_min -= 1
            m2_max += 1
            
        # Draw Metric 1 (Line)
        points_m1 = []
        for i, d in enumerate(self.data_points):
            x = margin_left + (i / (len(self.data_points) - 1)) * plot_width
            y = margin_top + plot_height - ((d["m1"] - m1_min) / (m1_max - m1_min)) * plot_height
            points_m1.append((x, y))
            
            # Draw point
            self.canvas.create_oval(x-2, y-2, x+2, y+2, fill="blue", outline="blue")
            
        # Draw line for M1
        if len(points_m1) > 1:
            for i in range(len(points_m1) - 1):
                self.canvas.create_line(points_m1[i], points_m1[i+1], fill="blue")
                
        # Draw Metric 2 (Line)
        points_m2 = []
        for i, d in enumerate(self.data_points):
            x = margin_left + (i / (len(self.data_points) - 1)) * plot_width
            y = margin_top + plot_height - ((d["m2"] - m2_min) / (m2_max - m2_min)) * plot_height
            points_m2.append((x, y))
            
            # Draw point
            self.canvas.create_oval(x-2, y-2, x+2, y+2, fill="red", outline="red")
            
        # Draw line for M2
        if len(points_m2) > 1:
            for i in range(len(points_m2) - 1):
                self.canvas.create_line(points_m2[i], points_m2[i+1], fill="red")
                
        # Legend
        self.canvas.create_text(width - 100, 20, anchor=tk.E, text="M1 (Blue) M2 (Red)")
        
        # Axis labels
        self.canvas.create_text(margin_left - 5, margin_top + 10, anchor=tk.E, text="Value")
        self.canvas.create_text(width // 2, height - 5, anchor=tk.S, text="Time")

if __name__ == "__main__":
    root = tk.Tk()
    app = InteractiveDiagnosticTool(root)
    root.mainloop()

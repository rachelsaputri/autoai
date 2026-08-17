# Threat 3D Visualizer

This project implements a **Threat 3D Visualizer** using the **Action!** programming language. Action! is a fast, compiled language from the 1980s/90s, originally for the Atari 8-bit computers, known for its low-level memory control and execution speed.

## Architecture
The `visualizer_engine.act` file contains the core logic:
1. **Memory Mapping**: Defines the memory structure for 3D coordinates (X, Y, Z) and threat intensity vectors.
2. **Coordinate Transformation**: Maps real-time threat intelligence data (lat, lon, severity) into a 3D Cartesian space.
3. **Render Loop**: A high-speed polling loop that clears the screen, calculates projected 2D points for each threat, and draws connecting wireframe lines to visualize attack paths.
4. **User Interaction**: Basic keyboard input handling to rotate the 3D view.

## Usage
1. Compile the `visualizer_engine.act` file using a standard Action! compiler/toolchain.
2. Run the compiled binary. It will automatically attempt to initialize the graphics mode (typically mode 3/4 or 6/7 depending on the host).
3. Observe the projected threat vectors. Press **ESC** to exit the visualization.

## Constraints & Considerations
- **Action! Limitations**: This implementation targets the memory-mapped graphics of classic systems. Modern environments may require an emulator (like Altirra or Atarimax) to render the graphics correctly.
- **Performance**: Action! compiles to machine code, making this highly efficient for real-time vector projection without floating-point overhead (fixed-point math is used).
- **Scope**: This is a foundational engine. Future iterations could integrate actual threat intel feeds (e.g., STIX/TAXII) into the data ingestion loop.

## License
MIT License.

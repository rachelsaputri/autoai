// TelemetryParser.ck - Module for parsing raw telemetry streams
// Handles conversion of raw inputs into normalized data structures

class TelemetryParser {
    // Internal state for parsing buffers
    float parsed_buffer[];
    int buffer_size;

    fun void setup(int size) {
        size => buffer_size;
        size => parsed_buffer.size;
    }

    fun void process(float data[]) {
        // Normalize data: Scale from raw range to 0.0 - 1.0
        // This is a common telemetry normalization step
        0.001 => float scale;
        for (0 => int i; i < data.cap(); i++) {
            data[i] * scale => parsed_buffer[i];
        }
        <<< "Parser: Data Normalized" >>>;
    }

    fun float[] getBuffer() {
        return parsed_buffer;
    }
}

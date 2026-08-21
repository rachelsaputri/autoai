kernel void process_data(global const float* input, global float* output, int n) {
    int id = get_global_id(0);
    if (id < n) {
        float val = input[id];
        // Example transformation: double the value
        output[id] = val * 2.0f;
    }
}

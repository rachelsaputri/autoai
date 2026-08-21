#include <stdio.h>
#include <stdlib.h>
#include <OpenCL/cl.h>
#include "utils.h"

#define ERROR_CHECK(err) if(err != CL_SUCCESS) {
    fprintf(stderr, "OpenCL Error: %d\n", err);
    exit(1);
}

int main() {
    const int n = 1024;
    float* h_input = (float*)malloc(n * sizeof(float));
    float* h_output = (float*)malloc(n * sizeof(float));

    for(int i=0; i<n; i++) {
        h_input[i] = (float)i;
    }

    cl_platform_id platform;
    clGetPlatformIDs(1, &platform, NULL);

    cl_device_id device;
    clGetDeviceIDs(platform, CL_DEVICE_TYPE_GPU, 1, &device, NULL);

    cl_context context = clCreateContext(NULL, 1, &device, NULL, NULL, &ERROR_CHECK(0) ? NULL : NULL);
    // Simplified context creation for brevity in example
    cl_command_queue queue = clCreateCommandQueue(context, device, 0, NULL);

    cl_mem d_input = clCreateBuffer(context, CL_MEM_READ_ONLY, n * sizeof(float), NULL, NULL);
    cl_mem d_output = clCreateBuffer(context, CL_MEM_WRITE_ONLY, n * sizeof(float), NULL, NULL);

    clEnqueueWriteBuffer(queue, d_input, CL_TRUE, 0, n * sizeof(float), h_input, 0, NULL, NULL);

    // Read kernel source
    const char* source = "kernel void process_data(global const float* input, global float* output, int n) {\n"
                         "    int id = get_global_id(0);\n"
                         "    if (id < n) {\n"
                         "        float val = input[id];\n"
                         "        output[id] = val * 2.0f;\n"
                         "    }\n"
                         "}\n";

    cl_program program = clCreateProgramWithSource(context, 1, &source, NULL, NULL);
    clBuildProgram(program, 1, &device, NULL, NULL, NULL);

    cl_kernel kernel = clCreateKernel(program, "process_data", NULL);
    clSetKernelArg(kernel, 0, sizeof(cl_mem), &d_input);
    clSetKernelArg(kernel, 1, sizeof(cl_mem), &d_output);
    clSetKernelArg(kernel, 2, sizeof(int), &n);

    size_t global_work_size = n;
    clEnqueueNDRangeKernel(queue, kernel, 1, NULL, &global_work_size, NULL, 0, NULL, NULL);
    clFinish(queue);

    clEnqueueReadBuffer(queue, d_output, CL_TRUE, 0, n * sizeof(float), h_output, 0, NULL, NULL);

    for(int i=0; i<10; i++) {
        printf("Input: %f, Output: %f\n", h_input[i], h_output[i]);
    }

    clReleaseMemObject(d_input);
    clReleaseMemObject(d_output);
    clReleaseKernel(kernel);
    clReleaseProgram(program);
    clReleaseCommandQueue(queue);
    clReleaseContext(context);
    free(h_input);
    free(h_output);

    return 0;
}

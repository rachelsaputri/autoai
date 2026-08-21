#ifndef UTILS_H
#define UTILS_H

typedef float float3;

static inline float3 make_float3(float x, float y, float z) {
    float3 v = {x, y, z};
    return v;
}

static inline float dot_product(float3 a, float3 b) {
    return a.x * b.x + a.y * b.y + a.z * b.z;
}

#endif

;; Low-Level Memory Allocator Simulation

function init_memory_pool(size) {
    pool = { size: size, used: 0, blocks: [] };
    return pool;
}

function allocate_memory(pool, size) {
    if (pool.used + size > pool.size) {
        printf("[ERROR] Memory allocation failed: insufficient space.\n");
        return -1;
    }
    
    ;; Simple first-fit strategy (simulated)
    base_addr = pool.used;
    pool.used = pool.used + size;
    
    ;; Record block
    new_block = { addr: base_addr, size: size, freed: false };
    pool.blocks = append(pool.blocks, new_block);
    
    return base_addr;
}

function free_memory(pool, addr, size) {
    for each block in pool.blocks {
        if (block.addr == addr && !block.freed) {
            block.freed = true;
            pool.used = pool.used - size;
            printf("[MEMORY] Freed %d bytes at 0x%x.\n", size, addr);
            return;
        }
    }
    printf("[WARNING] No matching block found for deallocation.\n");
}

function get_used_memory(pool) {
    return pool.used;
}

function get_free_memory(pool) {
    return pool.size - pool.used;
}

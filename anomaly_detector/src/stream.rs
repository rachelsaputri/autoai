use crate::models::CorrelatedAlert;
use std::collections::VecDeque;

pub struct EventBuffer {
    buffer: VecDeque<CorrelatedAlert>,
    capacity: usize,
}

impl EventBuffer {
    pub fn new(capacity: usize) -> Self {
        Self {
            buffer: VecDeque::with_capacity(capacity),
            capacity,
        }
    }

    pub fn push(&mut self, event: CorrelatedAlert) {
        if self.buffer.len() >= self.capacity {
            self.buffer.pop_front();
        }
        self.buffer.push_back(event);
    }

    pub fn get_window(&self) -> Vec<CorrelatedAlert> {
        self.buffer.iter().cloned().collect()
    }
    
    pub fn is_full(&self) -> bool {
        self.buffer.len() >= self.capacity
    }
}

impl Default for EventBuffer {
    fn default() -> Self {
        Self::new(1000)
    }
}

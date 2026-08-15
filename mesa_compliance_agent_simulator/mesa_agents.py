from mesa import Agent
import random

class ComplianceAgent(Agent):
    def __init__(self, unique_id, model):
        super().__init__(unique_id, model)
        self.state = "compliant"  # Options: compliant, drifting, non_compliant
        self.resistance = random.uniform(0, 1)
        self.trail = [self.state]
        
    def step(self):
        # Agent logic based on model policy strength and own resistance
        drift_chance = (1 - self.model.policy_strength) * self.resistance
        
        if self.state == "compliant":
            if random.random() < drift_chance:
                self.state = "drifting"
        elif self.state == "drifting':
            recovery_chance = self.model.policy_strength * 0.5
            if random.random() < recovery_chance:
                self.state = "compliant"
            else:
                self.state = "non_compliant"
        elif self.state == "non_compliant':
            recovery_chance = self.model.policy_strength * 0.2
            if random.random() < recovery_chance:
                self.state = "compliant"
        
        self.trail.append(self.state)

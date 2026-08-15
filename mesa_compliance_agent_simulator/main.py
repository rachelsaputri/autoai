from mesa import Model
from mesa.time import RandomActivation
from mesa_agents import ComplianceAgent
import json
import os

class ComplianceModel(Model):
    def __init__(self, n_agents, policy_strength=1.0):
        super().__init__()
        self.schedule = RandomActivation(self)
        self.policy_strength = policy_strength
        
        # Create agents
        for i in range(n_agents):
            agent = ComplianceAgent(i, self)
            self.schedule.add(agent)
        
        self.compliance_stats = {"compliant": 0, "drifting": 0, "non_compliant": 0}

    def step(self):
        # Each agent acts
        self.schedule.step()
        
        # Update stats
        self.compliance_stats = {"compliant": 0, "drifting": 0, "non_compliant": 0}
        for agent in self.schedule.agents:
            state = agent.state
            if state in self.compliance_stats:
                self.compliance_stats[state] += 1

def run_simulation(n_agents=100, steps=100):
    model = ComplianceModel(n_agents)
    for step in range(steps):
        model.step()
    print(f"Final Compliance Stats: {model.compliance_stats}")
    return model.compliance_stats

if __name__ == "__main__":
    stats = run_simulation()

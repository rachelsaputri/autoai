from mesa import Agent
import random

class SecurityAgent(Agent):
    def __init__(self, unique_id, model, role, behavior):
        super().__init__(unique_id, model)
        self.role = role  # 'detection', 'remediation', 'communication'
        self.behavior = behavior  # Dictionary of behaviors
        self.state = 'idle'  # Agent's current state
        self.neighbors = []

    def step(self):
        """Execute one step of the agent."""
        self.state = self.behavior[self.state]  # Transition to the next state based on behavior
        if self.state == 'active':
            self.interact_with_neighbors()
        # Additional agent-specific logic can be added here

    def interact_with_neighbors(self):
        """Interact with neighboring agents."""
        for neighbor in self.neighbors:
            # Simulate interaction logic
            if self.role == 'detection' and neighbor.role == 'remediation':
                self.model.update_system_status('threat_detected')
            elif self.role == 'communication':
                self.model.log_communication(self.unique_id, neighbor.unique_id)

class AgentFactory:
    @staticmethod
    def create_agent(unique_id, model, role, behavior):
        """Factory method to create agents based on their role."""
        if role in ['detection', 'remediation', 'communication']:
            return SecurityAgent(unique_id, model, role, behavior)
        else:
            raise ValueError("Unknown agent role")

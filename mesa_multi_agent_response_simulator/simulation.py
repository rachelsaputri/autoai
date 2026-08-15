from mesa import Model
from mesa.time import BaseScheduler
from mesa_multi_agent_response_simulator.agents import AgentFactory
from mesa_multi_agent_response_simulator.environment import MultiAgentGrid

class SecuritySimulation(Model):
    def __init__(self, width=10, height=10, num_agents=20):
        super().__init__()
        self.schedule = BaseScheduler(self)
        self.grid = MultiAgentGrid(width, height, torus=True)
        self.status = 'normal'
        self.log = []
        self._setup_agents(num_agents)

    def _setup_agents(self, num_agents):
        """Set up the initial agents for the simulation."""
        roles = ['detection', 'remediation', 'communication']
        behaviors = {
            'idle': 'active',
            'active': 'idle'
        }
        for i in range(num_agents):
            role = roles[i % len(roles)]
            agent = AgentFactory.create_agent(i, self, role, behaviors)
            self.schedule.add(agent)
            self.grid.place_agent(agent, i % self.grid.width, i // self.grid.height)
            agent.neighbors = self.grid.get_neighbors(agent)

    def step(self):
        """Execute one step of the simulation."""
        # Update system status based on agents' actions
        for agent in self.schedule.agents:
            agent.step()
            if agent.state == 'active':
                agent.interact_with_neighbors()
        self.schedule.step()

    def update_system_status(self, status):
        """Update the overall system status."""
        self.status = status
        if status == 'threat_detected':
            print('Threat detected in the system')

    def log_communication(self, sender, receiver):
        """Log communication between agents."""
        self.log.append({'sender': sender, 'receiver': receiver})
        print(f'Agent {sender} communicated with Agent {receiver}')

# Run the simulation
if __name__ == '__main__':
    model = SecuritySimulation(width=10, height=10, num_agents=30)
    for _ in range(100):  # Run 100 steps
        model.step()

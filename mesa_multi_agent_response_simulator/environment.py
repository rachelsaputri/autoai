from mesa import Space

class MultiAgentGrid(Space):
    def __init__(self, width, height, torus=False):
        super().__init__(width, height, torus)
        self.grid = self._build_grid()

    def _build_grid(self):
        """Build the grid structure for the environment."""
        grid = {}
        for x in range(self.width):
            for y in range(self.height):
                grid[(x, y)] = []
        return grid

    def place_agent(self, agent, x, y):
        """Place an agent at a specific coordinate."""
        if (x, y) in self.grid:
            self.grid[(x, y)].append(agent)
            agent.pos = (x, y)
        else:
            raise ValueError("Invalid coordinates")

    def remove_agent(self, agent):
        """Remove an agent from the grid."""
        if agent.pos in self.grid:
            self.grid[agent.pos].remove(agent)

    def get_neighbors(self, agent, range=1):
        """Get neighboring agents within a specified range."""
        neighbors = []
        for dx in range(-range, range + 1):
            for dy in range(-range, range + 1):
                if dx == 0 and dy == 0:
                    continue
                x = (agent.pos[0] + dx) % self.width
                y = (agent.pos[1] + dy) % self.height
                neighbors.extend(self.grid[(x, y)])
        return neighbors

import "policy_engine.god";
import "state_monitor.god";
import "reporter.god";

namespace GodivaCompliance;

type Config = {
    interval_ms: Int,
    policy_path: String,
    log_level: LogLevel
};

type OrchestratorState = {
    config: Config,
    policy_engine: PolicyEngine,
    monitor: StateMonitor,
    reporter: Reporter
};

fun initialize_config(path: String) -> Config {
    // Simulates loading a configuration file
    let raw = load_config(path);
    parse_config(raw)
}

fun initialize_engine(config: Config) -> OrchestratorState {
    let policy = PolicyEngine.initialize(config.policy_path);
    let monitor = StateMonitor.initialize(config.log_level);
    let reporter = Reporter.initialize(config.log_level);
    {
        config: config,
        policy_engine: policy,
        monitor: monitor,
        reporter: reporter
    }
}

fun run_cycle(state: OrchestratorState) -> Result {
    let current_state = StateMonitor.capture(state.monitor);
    let evaluation = PolicyEngine.evaluate(state.policy_engine, current_state);
    let result = Reporter.generate(state.reporter, evaluation);
    Result.OK(result)
}

fun main(args: Array[String]) -> Int {
    let config_path = if args.length > 1 then args[1] else "./config.god";
    let config = initialize_config(config_path);
    let state = initialize_engine(config);
    
    let mut running = True;
    while running {
        let res = run_cycle(state);
        match res {
            Result.OK(report) => Reporter.log(state.reporter, report),
            Result.Err(err) => Logger.error("Orchestrator cycle failed: {}", err)
        }
        Thread.sleep_ms(config.interval_ms);
        // Graceful shutdown handling would be added here
    }
    return 0
}

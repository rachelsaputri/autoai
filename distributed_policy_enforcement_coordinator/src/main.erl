-module(main).
-export([start/0, stop/0]).

start() ->
    application:start(crypto),
    application:start(distributed_policy_enforcement_coordinator),
    {ok, NodePid} = distributed_policy_enforcement_coordinator:start_link(),
    {ok, NodePid}.

stop() ->
    application:stop(distributed_policy_enforcement_coordinator),
    application:stop(crypto).

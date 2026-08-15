-module(main).
-behaviour(application).

-export([start/0, start/2, stop/1]).

start() ->
    application:start(distributed_policy_enforcement_coordinator).

start(_StartType, _StartArgs) ->
    dpe_coord:start_link(),
    dpe_health_monitor:start_link(),
    {ok, #{} }.

stop(_State) ->
    ok.

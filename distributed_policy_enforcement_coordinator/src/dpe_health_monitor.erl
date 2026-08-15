-module(dpe_health_monitor).
-behaviour(gen_server).

-export([start_link/0, get_status/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).
-define(CHECK_INTERVAL, 5000).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

get_status() ->
    gen_server:call(?SERVER, get_status).

init([]) ->
    process_flag(trap_exit, true),
    erlang:send_after(?CHECK_INTERVAL, self(), check_cluster),
    {ok, #{check_interval => ?CHECK_INTERVAL} }.

handle_call(get_status, _From, State) ->
    Status = #{status => running, nodes => nodes()},
    {reply, {ok, Status}, State};

handle_call(_Request, _From, State) ->
    {reply, {error, unknown_request}, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(check_cluster, State) ->
    CurrentNodes = nodes(),
    LocalNode = node(),
    case lists:member(LocalNode, CurrentNodes) of
        true -> ok;
        false -> dpe_coord:stop()
    end,
    erlang:send_after(?CHECK_INTERVAL, self(), check_cluster),
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

nodes() ->
    case erlang:get_cluster_nodes() of
        undefined -> [node()];
        Ns -> Ns
    end.

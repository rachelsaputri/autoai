-module(dpe_coord).
-behaviour(gen_server).

-export([start_link/0, stop/0, get_cluster_state/0, broadcast_policy/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-define(SERVER, ?MODULE).

type cluster_state() :: #{
    nodes := [node()],
    policies := map(),
    health := map()
}.

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

stop() ->
    gen_server:call(?SERVER, stop).

get_cluster_state() ->
    gen_server:call(?SERVER, get_cluster_state).

broadcast_policy(Policy) ->
    gen_server:cast(?SERVER, {broadcast_policy, Policy}).

init([]) ->
    process_flag(trap_exit, true),
    State = #{nodes => [node()], policies => #{}, health => #{}},
    {ok, State}.

handle_call(get_cluster_state, _From, State) ->
    {reply, {ok, State}, State};

handle_call(stop, _From, State) ->
    {stop, normal, ok, State};

handle_call(_Request, _From, State) ->
    {reply, {error, unknown_request}, State}.

handle_cast({broadcast_policy, Policy}, State) ->
    CurrentPolicies = maps:get(policies, State),
    NewPolicies = maps:put(local_node(), Policy, CurrentPolicies),
    broadcast_to_cluster(Policy, maps:get(nodes, State)),
    {noreply, State#{policies => NewPolicies}};

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% Internal functions
local_node() ->
    node().

broadcast_to_cluster(_Msg, []) ->
    ok;
broadcast_to_cluster(Msg, [Node | Rest]) when is_atom(Node) ->
    rpc:cast(Node, dpe_policy_sync, apply_policy, [Msg]),
    broadcast_to_cluster(Msg, Rest).

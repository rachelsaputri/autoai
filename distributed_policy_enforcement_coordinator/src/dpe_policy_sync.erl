-module(dpe_policy_sync).
-behaviour(gen_server).

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-export([apply_policy/1]).

-define(SERVER, ?MODULE).

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

init([]) ->
    process_flag(trap_exit, true),
    {ok, #{policy_store => #{}} }.

handle_call(_Request, _From, State) ->
    {reply, {error, not_implemented}, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%% Remote entry point
apply_policy(Policy) ->
    gen_server:cast(?SERVER, {apply_policy, Policy}).

handle_cast({apply_policy, Policy}, State) ->
    PolicyStore = maps:get(policy_store, State),
    NewStore = maps:put(pol_id(Policy), Policy, PolicyStore),
    {noreply, State#{policy_store => NewStore}}.

pol_id(Policy) ->
    maps:get(id, Policy, random:uniform(100000)).

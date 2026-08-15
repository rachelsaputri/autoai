-module(distributed_policy_enforcement_coordinator).
-behaviour(application).
-behaviour(gen_server).

-export([start_link/0, start_link/1, start_link/2, start_link/3]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).
-export([application_start/2, application_stop/1]).

-define(SERVER, ?MODULE).

%% API
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

start_link(_Type, _Args) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

start_link(_Name, _State, _Args) ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

%% Application callbacks
application_start(_StartType, _StartArgs) ->
    case gen_server:start_link({local, ?SERVER}, ?MODULE, [], []) of
        {ok, Pid} ->
            {ok, Pid};
        {error, Reason} ->
            {error, Reason}
    end.

application_stop(_State) ->
    ok.

%% gen_server callbacks
init([]) ->
    {ok, #{}}.

handle_call(_Request, _From, State) ->
    {reply, ok, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

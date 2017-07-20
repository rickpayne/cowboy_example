%%%-------------------------------------------------------------------
%% @doc cowboy_example public API
%% @end
%%%-------------------------------------------------------------------

-module(cowboy_example_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile(
                 [
                  {'_',
                   [
                    {"/", cowboy_static, {priv_file, cowboy_example, "index.html"}}
                   ]}
                 ]),
    {ok, _} = cowboy:start_http(http, 100, [{port, 8888}],
                                [
                                 {env, [{dispatch, Dispatch}]}
                                ]),
    cowboy_example_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================

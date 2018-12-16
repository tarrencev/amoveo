-module(graphql_object).
-export([execute/4]).

%% Assume we are given a map(). Look up the field in the map. If not
%% present, return the value null.
execute(_Ctx, Obj, Field, _Args) ->
    io:fwrite("We in dis"),
    {ok, maps:get(Field, Obj, null)}.

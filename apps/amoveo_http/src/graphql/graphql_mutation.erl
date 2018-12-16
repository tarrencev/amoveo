-module(graphql_mutation).

-export([execute/4]).

execute(Ctx, _, Field, #{ <<"input">> := Input}) ->
    {ok, Response} = graphql_signed_transaction:create(Ctx, Input),
    {ok, Response};

execute(_Ctx, _, _Other, _) ->
    {error, invalid_mutation}.

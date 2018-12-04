-module(graphql_order).
-include("../../amoveo_core/src/records.hrl").
-include("./graphql_records.hrl").

-export([execute/4]).

tuple2list(Tuple) ->
  [element(I, Tuple) || I <- lists:seq(1, tuple_size(Tuple))].

execute(_Ctx, Order, Field, Args) ->
    case Field of
        <<"id">> ->
          {ok, base64:encode(Order#orderproof.value#orders.aid)};
        <<"amount">> ->
          {ok, Order#orderproof.value#orders.amount};
        <<"rootHash">> ->
          {ok, base64:encode(Order#orderproof.root)};
        <<"proof">> ->
          Path = tuple2list(lists:nth(1, Order#orderproof.path)),
          EncodedPath = lists:map(fun(Y) -> base64:encode(Y) end, Path),
          {ok, [{ok, M} || M <- EncodedPath]}
    end.

-module(graphql_query).
-include("../../amoveo_core/src/records.hrl").
-include("./graphql_records.hrl").

-export([execute/4]).

execute(_, _, Field, Args) ->
  case Field of
    <<"account">> ->
      #{ <<"pubkey">> := Pubkey } = Args,
      {ok, api:account(Pubkey)};
    <<"header">> ->
      #{ <<"height">> := Height } = Args,
      {ok, block:block_to_header(block:get_by_height(Height))};
    <<"block">> ->
      #{ <<"height">> := Height } = Args,
      {ok, block:get_by_height(Height)};
    <<"height">> ->
      {ok, api:height()};
    <<"governance">> ->
      {ok, #governance{}};
    <<"oracles">> ->
      Oracles = oracles:all(),
      SortedOracles = lists:sort(fun({_, X}, {_, Y}) -> X#oracle.starts > Y#oracle.starts end, Oracles),
      {ok, [{ok, M} || M <- SortedOracles]}
  end.

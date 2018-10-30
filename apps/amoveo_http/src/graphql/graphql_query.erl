-module(graphql_query).
-include("../../amoveo_core/src/records.hrl").

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
      {ok, block:get_by_height(Height)}
  end.

-module(graphql_account).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Account, Field, Args) ->
    case Field of
        <<"balance">> ->
          {ok, Account#acc.balance};
        <<"nonce">> ->
          {ok, Account#acc.nonce};
        <<"pubkey">> ->
          {ok, Account#acc.pubkey};
        <<"bets">> ->
          {ok, Account#acc.bets};
        <<"bets_hash">> ->
          {ok, Account#acc.bets_hash}
    end.

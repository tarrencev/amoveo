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
          {ok, base64:encode(Account#acc.pubkey)};
        <<"bets">> ->
          {ok, Account#acc.bets};
        <<"betsHash">> ->
          {ok, base64:encode(Account#acc.bets_hash)}
    end.

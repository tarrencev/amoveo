-module(graphql_coinbase_transaction).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Transaction, Field, Args) ->
    case Field of
        <<"from">> ->
          {ok, base64:encode(Transaction#coinbase.from)};
        <<"nonce">> ->
          {ok, Transaction#coinbase.nonce};
        <<"fee">> ->
          {ok, Transaction#coinbase.fee};
        <<"type">> ->
          {ok, 'COINBASE'}
    end.

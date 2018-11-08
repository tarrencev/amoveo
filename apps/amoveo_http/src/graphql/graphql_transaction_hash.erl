-module(graphql_transaction_hash).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, TransactionHash, Field, Args) ->
    case Field of
        <<"hash">> ->
          {ok, base64:encode(TransactionHash#transaction_hash.hash)}
    end.

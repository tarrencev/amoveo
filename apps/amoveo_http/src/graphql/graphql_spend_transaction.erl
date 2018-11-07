-module(graphql_spend_transaction).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Transaction, Field, Args) ->
    case Field of
        <<"from">> ->
          {ok, base64:encode(Transaction#signed.data#spend.from)};
        <<"nonce">> ->
          {ok, Transaction#signed.data#spend.nonce};
        <<"fee">> ->
          {ok, Transaction#signed.data#spend.fee};
        <<"to">> ->
          {ok, Transaction#signed.data#spend.to};
        <<"amount">> ->
          {ok, Transaction#signed.data#spend.amount};
        <<"version">> ->
          {ok, Transaction#signed.data#spend.version};
        <<"type">> ->
          {ok, 'SPEND'}
    end.

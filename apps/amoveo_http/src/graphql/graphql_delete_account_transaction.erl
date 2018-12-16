-module(graphql_delete_account_transaction).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Transaction, Field, Args) ->
    case Field of
        <<"from">> ->
          {ok, base64:encode(Transaction#signed.data#delete_acc_tx.from)};
        <<"nonce">> ->
          {ok, Transaction#signed.data#delete_acc_tx.nonce};
        <<"fee">> ->
          {ok, Transaction#signed.data#delete_acc_tx.fee};
        <<"to">> ->
          {ok, base64:encode(Transaction#signed.data#delete_acc_tx.to)};
        % <<"signature">> ->
        %   {ok, Transaction#signed.data#delete_acc_tx.signature};
        <<"type">> ->
          {ok, 'DELETE_ACCOUNT'}
    end.

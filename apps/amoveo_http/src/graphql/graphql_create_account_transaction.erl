-module(graphql_create_account_transaction).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Transaction, Field, Args) ->
    case Field of
        <<"from">> ->
          {ok, base64:encode(Transaction#signed.data#create_acc_tx.from)};
        <<"nonce">> ->
          {ok, Transaction#signed.data#create_acc_tx.nonce};
        <<"fee">> ->
          {ok, Transaction#signed.data#create_acc_tx.fee};
        <<"pubkey">> ->
          {ok, base64:encode(Transaction#signed.data#create_acc_tx.pubkey)};
        <<"amount">> ->
          {ok, Transaction#signed.data#create_acc_tx.amount};
        % <<"signature">> ->
        %   {ok, Transaction#signed.data#create_acc_tx.signature};
        <<"type">> ->
          {ok, 'CREATE_ACCOUNT'}
    end.

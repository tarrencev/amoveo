% tag::coreEnum[]
-module(graphql_enum).

-export([input/2, output/2]).

%% Input mapping <1>
input(<<"TransactionType">>, <<"COINBASE">>) -> {ok, 'COINBASE'};
input(<<"TransactionType">>, <<"SPEND">>)  -> {ok, 'SPEND'};
input(<<"TransactionType">>, <<"CREATE_ACCOUNT">>)    -> {ok, 'CREATE_ACCOUNT'};
input(<<"TransactionType">>, <<"DELETE_ACCOUNT">>) -> {ok, 'DELETE_ACCOUNT'};
input(<<"TransactionType">>, <<"NEW_CHANNEL">>)  -> {ok, 'NEW_CHANNEL'};
input(<<"TransactionType">>, <<"CHANNEL_TEAM_CLOSE">>)  -> {ok, 'CHANNEL_TEAM_CLOSE'};
input(<<"TransactionType">>, <<"CHANNEL_SOLO_CLOSE">>)  -> {ok, 'CHANNEL_SOLO_CLOSE'};
input(<<"TransactionType">>, <<"CHANNEL_SLASH">>)  -> {ok, 'CHANNEL_SLASH'};
input(<<"TransactionType">>, <<"CHANNEL_TIMEOUT">>)  -> {ok, 'CHANNEL_TIMEOUT'};
input(<<"TransactionType">>, <<"ORACLE_NEW">>)  -> {ok, 'ORACLE_NEW'};
input(<<"TransactionType">>, <<"ORACLE_BET">>)  -> {ok, 'ORACLE_BET'};
input(<<"TransactionType">>, <<"ORACLE_CLOSE">>)  -> {ok, 'ORACLE_CLOSE'};
input(<<"TransactionType">>, <<"ORACLE_UNMATCHED">>)  -> {ok, 'ORACLE_UNMATCHED'};
input(<<"TransactionType">>, <<"ORACLE_WINNINGS">>)    -> {ok, 'ORACLE_WINNINGS'}.

%% Output mapping <2>
output(<<"TransactionType">>, TransactionType) ->
    {ok, atom_to_binary(TransactionType, utf8)}.
%% end::coreEnum[]

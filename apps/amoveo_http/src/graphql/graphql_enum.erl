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
input(<<"TransactionType">>, <<"ORACLE_WINNINGS">>)    -> {ok, 'ORACLE_WINNINGS'};

input(<<"OracleType">>, <<"EMPTY">>)    -> {ok, 'EMPTY'};
input(<<"OracleType">>, <<"TRUE">>)    -> {ok, 'TRUE'};
input(<<"OracleType">>, <<"FALSE">>)    -> {ok, 'FALSE'};
input(<<"OracleType">>, <<"BAD_QUESTION">>)    -> {ok, 'BAD_QUESTION'};

input(<<"GovernanceEnum">>, <<"NONE">>) -> {ok, 'NONE'};
input(<<"GovernanceEnum">>, <<"BLOCK_REWARD">>) -> {ok, 'BLOCK_REWARD'};
input(<<"GovernanceEnum">>, <<"DEVELOPER_REWARD">>) -> {ok, 'DEVELOPER_REWARD'};
input(<<"GovernanceEnum">>, <<"MAX_BLOCK_SIZE">>) -> {ok, 'MAX_BLOCK_SIZE'};
input(<<"GovernanceEnum">>, <<"BLOCK_PERIOD">>) -> {ok, 'BLOCK_PERIOD'};
input(<<"GovernanceEnum">>, <<"TIME_GAS">>)    -> {ok, 'TIME_GAS'};
input(<<"GovernanceEnum">>, <<"SPACE_GAS">>)    -> {ok, 'SPACE_GAS'};
input(<<"GovernanceEnum">>, <<"FUN_LIMIT">>)  -> {ok, 'FUN_LIMIT'};
input(<<"GovernanceEnum">>, <<"VAR_LIMIT">>)  -> {ok, 'VAR_LIMIT'};
input(<<"GovernanceEnum">>, <<"GOVERNANCE_CHANGE_LIMIT">>)  -> {ok, 'GOVERNANCE_CHANGE_LIMIT'};
input(<<"GovernanceEnum">>, <<"ORACLE_INITIAL_LIQUIDITY">>)  -> {ok, 'ORACLE_INITIAL_LIQUIDITY'};
input(<<"GovernanceEnum">>, <<"MINIMUM_ORACLE_TIME">>)  -> {ok, 'MINIMUM_ORACLE_TIME'};
input(<<"GovernanceEnum">>, <<"MAXIMUM_ORACLE_TIME">>)  -> {ok, 'MAXIMUM_ORACLE_TIME'};
input(<<"GovernanceEnum">>, <<"MAXIMUM_QUESTION_SIZE">>)  -> {ok, 'MAXIMUM_QUESTION_SIZE'};
input(<<"GovernanceEnum">>, <<"CREATE_ACC_TX">>)  -> {ok, 'CREATE_ACC_TX'};
input(<<"GovernanceEnum">>, <<"DELETE_ACC_TX">>)  -> {ok, 'DELETE_ACC_TX'};
input(<<"GovernanceEnum">>, <<"NC">>)  -> {ok, 'NC'};
input(<<"GovernanceEnum">>, <<"CTC">>)  -> {ok, 'CTC'};
input(<<"GovernanceEnum">>, <<"CSC">>)  -> {ok, 'CSC'};
input(<<"GovernanceEnum">>, <<"TIMEOUT">>)  -> {ok, 'TIMEOUT'};
input(<<"GovernanceEnum">>, <<"CS">>)  -> {ok, 'CS'};
input(<<"GovernanceEnum">>, <<"EX">>)  -> {ok, 'EX'};
input(<<"GovernanceEnum">>, <<"ORACLE_NEW">>)  -> {ok, 'ORACLE_NEW'};
input(<<"GovernanceEnum">>, <<"ORACLE_BET">>)  -> {ok, 'ORACLE_BET'};
input(<<"GovernanceEnum">>, <<"ORACLE_CLOSE">>)  -> {ok, 'ORACLE_CLOSE'};
input(<<"GovernanceEnum">>, <<"UNMATCHED">>)  -> {ok, 'UNMATCHED'};
input(<<"GovernanceEnum">>, <<"ORACLE_WINNINGS">>)    -> {ok, 'ORACLE_WINNINGS'};
input(<<"GovernanceEnum">>, <<"ORACLE_QUESTION_LIQUIDITY">>)    -> {ok, 'ORACLE_QUESTION_LIQUIDITY'}.

%% Output mapping <2>
output(<<"TransactionType">>, TransactionType) ->
    {ok, atom_to_binary(TransactionType, utf8)};
output(<<"GovernanceEnum">>, GovernanceEnum) ->
    {ok, atom_to_binary(GovernanceEnum, utf8)};
output(<<"OracleType">>, OracleType) ->
    {ok, atom_to_binary(OracleType, utf8)}.
%% end::coreEnum[]

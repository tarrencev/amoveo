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

input(<<"GovernanceOracleVariable">>, <<"NONE">>) -> {ok, 'NONE'};
input(<<"GovernanceOracleVariable">>, <<"BLOCK_REWARD">>) -> {ok, 'BLOCK_REWARD'};
input(<<"GovernanceOracleVariable">>, <<"DEVELOPER_REWARD">>)  -> {ok, 'DEVELOPER_REWARD'};
input(<<"GovernanceOracleVariable">>, <<"TIME_GAS">>)    -> {ok, 'TIME_GAS'};
input(<<"GovernanceOracleVariable">>, <<"MAX_BLOCK_SIZE">>) -> {ok, 'MAX_BLOCK_SIZE'};
input(<<"GovernanceOracleVariable">>, <<"FUN_LIMIT">>)  -> {ok, 'FUN_LIMIT'};
input(<<"GovernanceOracleVariable">>, <<"VAR_LIMIT">>)  -> {ok, 'VAR_LIMIT'};
input(<<"GovernanceOracleVariable">>, <<"ORACLE_INITIAL_LIQUIDITY">>)  -> {ok, 'ORACLE_INITIAL_LIQUIDITY'};
input(<<"GovernanceOracleVariable">>, <<"MINIMUM_ORACLE_TIME">>)  -> {ok, 'MINIMUM_ORACLE_TIME'};
input(<<"GovernanceOracleVariable">>, <<"MAXIMUM_ORACLE_TIME">>)  -> {ok, 'MAXIMUM_ORACLE_TIME'};
input(<<"GovernanceOracleVariable">>, <<"MAXIMUM_QUESTION_SIZE">>)  -> {ok, 'MAXIMUM_QUESTION_SIZE'};
input(<<"GovernanceOracleVariable">>, <<"GOVERNANCE_CHANGE_LIMIT">>)  -> {ok, 'GOVERNANCE_CHANGE_LIMIT'};
input(<<"GovernanceOracleVariable">>, <<"CREATE_ACC_TX">>)  -> {ok, 'CREATE_ACC_TX'};
input(<<"GovernanceOracleVariable">>, <<"DELETE_ACC_TX">>)  -> {ok, 'DELETE_ACC_TX'};
input(<<"GovernanceOracleVariable">>, <<"NC">>)  -> {ok, 'NC'};
input(<<"GovernanceOracleVariable">>, <<"CTC">>)  -> {ok, 'CTC'};
input(<<"GovernanceOracleVariable">>, <<"CSC">>)  -> {ok, 'CSC'};
input(<<"GovernanceOracleVariable">>, <<"TIMEOUT">>)  -> {ok, 'TIMEOUT'};
input(<<"GovernanceOracleVariable">>, <<"CS">>)  -> {ok, 'CS'};
input(<<"GovernanceOracleVariable">>, <<"EX">>)  -> {ok, 'EX'};
input(<<"GovernanceOracleVariable">>, <<"ORACLE_NEW">>)  -> {ok, 'ORACLE_NEW'};
input(<<"GovernanceOracleVariable">>, <<"ORACLE_BET">>)  -> {ok, 'ORACLE_BET'};
input(<<"GovernanceOracleVariable">>, <<"ORACLE_CLOSE">>)  -> {ok, 'ORACLE_CLOSE'};
input(<<"GovernanceOracleVariable">>, <<"UNMATCHED">>)  -> {ok, 'UNMATCHED'};
input(<<"GovernanceOracleVariable">>, <<"ORACLE_WINNINGS">>)    -> {ok, 'ORACLE_WINNINGS'}.

%% Output mapping <2>
output(<<"TransactionType">>, TransactionType) ->
    {ok, atom_to_binary(TransactionType, utf8)};
output(<<"GovernanceOracleVariable">>, GovernanceOracleVariable) ->
    {ok, atom_to_binary(GovernanceOracleVariable, utf8)};
output(<<"OracleType">>, OracleType) ->
    {ok, atom_to_binary(OracleType, utf8)}.
%% end::coreEnum[]

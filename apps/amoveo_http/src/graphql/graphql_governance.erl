-module(graphql_governance).
-include("../../amoveo_core/src/records.hrl").
-include("./graphql_records.hrl").

-export([execute/4]).

execute(_Ctx, Order, Field, Args) ->
    case Field of
        <<"blockReward">> ->
          {ok, trees:get(governance, block_reward)};
        <<"developerReward">> ->
          {ok, trees:get(governance, developer_reward)};
        <<"maxBlockSize">> ->
          {ok, trees:get(governance, max_block_size)};
        <<"blockPeriod">> ->
          {ok, trees:get(governance, block_period)};
        <<"timeGas">> ->
          {ok, trees:get(governance, time_gas)};
        <<"spaceGas">> ->
          {ok, trees:get(governance, space_gas)};
        <<"funLimit">> ->
          {ok, trees:get(governance, fun_limit)};
        <<"varLimit">> ->
          {ok, trees:get(governance, var_limit)};
        <<"governanceChangeLimit">> ->
          {ok, trees:get(governance, governance_change_limit)};
        <<"oracleInitialLiquidity">> ->
          {ok, trees:get(governance, oracle_initial_liquidity)};
        <<"minimumOracleTime">> ->
          {ok, trees:get(governance, minimum_oracle_time)};
        <<"maximumOracleTime">> ->
          {ok, trees:get(governance, maximum_oracle_time)};
        <<"maximumQuestionSize">> ->
          {ok, trees:get(governance, maximum_question_size)};
        <<"createAccountTx">> ->
          {ok, trees:get(governance, create_acc_tx)};
        <<"spendTx">> ->
          {ok, trees:get(governance, spend)};
        <<"deleteAccountTx">> ->
          {ok, trees:get(governance, delete_acc_tx)};
        <<"newChannelTx">> ->
          {ok, trees:get(governance, nc)};
        <<"channelTeamCloseTx">> ->
          {ok, trees:get(governance, ctc)};
        <<"channelSoloCloseTx">> ->
          {ok, trees:get(governance, csc)};
        <<"channelTimeoutTx">> ->
          {ok, trees:get(governance, timeout)};
        <<"channelSlashTx">> ->
          {ok, trees:get(governance, cs)};
        <<"existenceProofTx">> ->
          {ok, trees:get(governance, ex)};
        <<"oracleNewTx">> ->
          {ok, trees:get(governance, oracle_new)};
        <<"oracleBetTx">> ->
          {ok, trees:get(governance, oracle_bet)};
        <<"oracleCloseTx">> ->
          {ok, trees:get(governance, oracle_close)};
        <<"unmatchedTx">> ->
          {ok, trees:get(governance, unmatched)};
        <<"oracleWinningsTx">> ->
          {ok, trees:get(governance, oracle_winnings)}
    end.

-module(graphql_oracle).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, {Message, Oracle}, Field, Args) ->
    case Field of
        <<"id">> ->
          {ok, base64:encode(Oracle#oracle.id)};
        <<"result">> ->
          {ok, Oracle#oracle.result};
        <<"question">> ->
          {ok, Message};
        <<"question_hash">> ->
          {ok, base64:encode(Oracle#oracle.question)};
        <<"starts">> ->
          {ok, Oracle#oracle.starts};
        <<"type">> ->
          case Oracle#oracle.type of
            0 ->
              {ok, 'EMPTY'};
            1 ->
              {ok, 'TRUE'};
            2 ->
              {ok, 'FALSE'};
            3 ->
              {ok, 'BAD_QUESTION'}
          end;
        % <<"orders">> ->
        %   {ok, Oracle#oracle.orders};
        <<"creator">> ->
          {ok, base64:encode(Oracle#oracle.creator)};
        <<"done_timer">> ->
          {ok, Oracle#oracle.done_timer};
        <<"governance">> ->
          case Oracle#oracle.governance of
            0 ->
              {ok, 'NONE'};
            1 ->
              {ok, 'BLOCK_REWARD'};
            2 ->
              {ok, 'DEVELOPER_REWARD'};
            3 ->
              {ok, 'TIME_GAS'};
            4 ->
              {ok, 'MAX_BLOCK_SIZE'};
            5 ->
              {ok, 'FUN_LIMIT'};
            6 ->
              {ok, 'VAR_LIMIT'};
            7 ->
              {ok, 'ORACLE_INITIAL_LIQUIDITY'};
            8 ->
              {ok, 'MINIMUM_ORACLE_TIME'};
            9 ->
              {ok, 'MAXIMUM_ORACLE_TIME'};
            10 ->
              {ok, 'MAXIMUM_QUESTION_SIZE'};
            11 ->
              {ok, 'GOVERNANCE_CHANGE_LIMIT'};
            12 ->
              {ok, 'SPEND'};
            13 ->
              {ok, 'DELETE_ACC_TX'};
            14 ->
              {ok, 'NC'};
            15 ->
              {ok, 'CTC'};
            16 ->
              {ok, 'CSC'};
            17 ->
              {ok, 'TIMEOUT'};
            18 ->
              {ok, 'CS'};
            19 ->
              {ok, 'EX'};
            20 ->
              {ok, 'ORACLE_NEW'};
            21 ->
              {ok, 'ORACLE_BET'};
            22 ->
              {ok, 'ORACLE_CLOSE'};
            23 ->
              {ok, 'UNMATCHED'};
            24 ->
              {ok, 'ORACLE_WINNINGS'}
          end;
        <<"governance_amount">> ->
          {ok, Oracle#oracle.governance_amount}
    end.

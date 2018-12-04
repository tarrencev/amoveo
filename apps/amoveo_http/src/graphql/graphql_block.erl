-module(graphql_block).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Block, Field, Args) ->
    case Field of
        <<"height">> ->
          {ok, Block#block.height};
        <<"prevHash">> ->
          {ok, base64:encode(Block#block.prev_hash)};
        <<"treesHash">> ->
          {ok, base64:encode(Block#block.trees_hash)};
        <<"time">> ->
          {ok, Block#block.time};
        <<"difficulty">> ->
          {ok, Block#block.difficulty};
        <<"period">> ->
          {ok, Block#block.period};
        <<"version">> ->
          {ok, Block#block.version};
        <<"nonce">> ->
          {ok, Block#block.nonce};
        <<"marketCap">> ->
          {ok, Block#block.market_cap};
        <<"channelsVeo">> ->
          {ok, Block#block.channels_veo};
        <<"liveChannels">> ->
          {ok, Block#block.live_channels};
        <<"manyAccounts">> ->
          {ok, Block#block.many_accounts};
        <<"manyOracles">> ->
          {ok, Block#block.many_accounts};
        <<"liveOracles">> ->
          {ok, Block#block.many_accounts};
        <<"transactions">> ->
          {ok, [{ok, M} || M <- Block#block.txs]}
    end.

-module(graphql_header).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Header, Field, Args) ->
    case Field of
        <<"height">> ->
          {ok, Header#header.height};
        <<"prevHash">> ->
          {ok, base64:encode(Header#header.prev_hash)};
        <<"treesHash">> ->
          {ok, base64:encode(Header#header.trees_hash)};
        <<"txsProofHash">> ->
          {ok, base64:encode(Header#header.txs_proof_hash)};
        <<"time">> ->
          {ok, Header#header.time};
        <<"difficulty">> ->
          {ok, Header#header.difficulty};
        <<"version">> ->
          {ok, Header#header.version};
        <<"nonce">> ->
          {ok, base64:encode(Header#header.nonce)};
        <<"period">> ->
          {ok, Header#header.period};
        <<"accumulativeDifficulty">> ->
          {ok, Header#header.accumulative_difficulty}
    end.

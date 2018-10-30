-module(graphql_header).
-include("../../amoveo_core/src/records.hrl").

-export([execute/4]).

execute(_Ctx, Header, Field, Args) ->
    case Field of
        <<"height">> ->
          {ok, Header#header.height};
        <<"prev_hash">> ->
          {ok, Header#header.prev_hash};
        <<"trees_hash">> ->
          {ok, Header#header.trees_hash};
        <<"txs_proof_hash">> ->
          {ok, Header#header.txs_proof_hash};
        <<"time">> ->
          {ok, Header#header.time};
        <<"difficulty">> ->
          {ok, Header#header.difficulty};
        <<"version">> ->
          {ok, Header#header.version};
        <<"nonce">> ->
          {ok, Header#header.nonce};
        <<"period">> ->
          {ok, Header#header.period};
        <<"accumulative_difficulty">> ->
          {ok, Header#header.accumulative_difficulty}
    end.

-module(graphql_type).
-include("../../amoveo_core/src/records.hrl").

-export([execute/1]).

%% tag::resolveType[]
execute(#acc{}) -> {ok, 'Account'};
execute(#block{}) -> {ok, 'Block'};
execute(#header{}) -> {ok, 'Header'};
execute(#oracle{}) -> {ok, 'Oracle'};
execute(#transaction_hash{}) -> {ok, 'SignedTransactionPayload'};
execute(_Otherwise) -> {error, unknown_type}.
%% end::resolveType[]

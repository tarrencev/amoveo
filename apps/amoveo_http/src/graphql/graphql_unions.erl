-module(graphql_unions).
-include("../../amoveo_core/src/records.hrl").

-export([execute/1]).

%% tag::resolveType[]
execute(#signed{ data = #spend{} }) -> {ok, 'SpendTransaction'};
execute(#signed{ data = #create_acc_tx{} }) -> {ok, 'CreateAccountTransaction'};
execute(#signed{ data = #delete_acc_tx{} }) -> {ok, 'DeleteAccountTransaction'};
execute(#coinbase{}) -> {ok, 'CoinbaseTransaction'};
execute(_Otherwise) -> {error, unknown_type}.
%% end::resolveType[]

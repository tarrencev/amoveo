-module(amoveo_http_app).
-behaviour(application).


%% Application callbacks
-export([start/2,
         stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    {ok, Pid} = amoveo_http_sup:start_link(),
    ok = load_schema(),
    ok = start_internal(),
    ok = start_external(),
    {ok, Pid}.

stop(_State) ->
    ok.

start_internal() ->
    Dispatch =
        cowboy_router:compile(
          [{'_', [{"/:file", int_file_handler, []},
                  {"/", int_handler, []}
                 ]}]),
    %Port = application:get_env(amoveo_core, internal_port, ?DEFAULT_INTERNAL_PORT),
    {ok, Port} = application:get_env(amoveo_core, internal_port),
    {ok, _} = cowboy:start_http(http_internal, 100,
                                [{ip, {127, 0, 0, 1}}, {port, Port}],
                                [{env, [{dispatch, Dispatch}]}]),
    ok.

start_external() ->
    Dispatch =
        cowboy_router:compile(
          [{'_', [{"/ext/:file", get_api_handler, []},
          {'_', [{"/graphql", ext_graphql_handler, []},
		  {"/:file", ext_file_handler, []},
                  {"/", ext_handler, []}
                 ]}]),
    {ok, Port} = application:get_env(amoveo_core, port),
    {ok, _} = cowboy:start_http(http, 100,
                                [{ip, {0, 0, 0, 0}}, {port, Port}],
                                [{env, [{dispatch, Dispatch}]}]),
    ok.

load_schema() ->
    {ok, SchemaFile} = application:get_env(amoveo_http, schema_file),
    PrivDir = code:priv_dir(amoveo_http),
    {ok, SchemaData} = file:read_file(
                         filename:join(PrivDir, SchemaFile)),
    Mapping = #{
      enums => #{ 'TransactionType' => graphql_enum,
                  'GovernanceOracleVariable' => graphql_enum,
                  'OracleType' => graphql_enum,
                   default   => graphql_enum },
       interfaces => #{ default => graphql_type },
       unions => #{ default => graphql_unions },
       objects => #{
         'Account' => graphql_account,
         'Block' => graphql_block,
         'Header' => graphql_header,
         'CoinbaseTransaction' => graphql_coinbase_transaction,
         'CreateAccountTransaction' => graphql_create_account_transaction,
         'DeleteAccountTransaction' => graphql_delete_account_transaction,
         'Oracle' => graphql_oracle,
         'Order' => graphql_order,
         'SpendTransaction' => graphql_spend_transaction,
         'SignedTransactionPayload' => graphql_transaction_hash,
         'Query' => graphql_query,
         'Mutation' => graphql_mutation,
         default => graphql_object }
     },
    ok = graphql:load_schema(Mapping, SchemaData),
    Root = {root,
            #{ query => 'Query',
               mutation => 'Mutation'
             }},
    ok = graphql:insert_schema_definition(Root),
    ok = graphql:validate_schema(),
    ok.

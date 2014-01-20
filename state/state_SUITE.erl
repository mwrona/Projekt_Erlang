-module(state_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([all/0, init_per_testcase/2, end_per_testcase/2]).
-export([test/1]).

all() ->
	[test].
	
init_per_testcase(test, Config) ->
	[{state, stuff} | Config].
	
end_per_testcase(test, Config) ->
	ok.
	
test(Config) ->
	stuff = ?config(state, Config).

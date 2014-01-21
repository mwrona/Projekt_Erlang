-module(groups_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([all/0, groups/0, init_per_testcase/2, end_per_testcase/2, init_per_group/2, end_per_group/2]).
-export([case1/1, case2/1, case3/1]).

all() ->
	[{group, group1}].
	
groups() ->
	[{group1,
		[shuffle, sequence],
		[case1, {group, group2}]},
	 {group2,
		[paralell],
		[case2, case3]}].
	
init_per_testcase(case1, Config) ->
	[{c, case1} | Config];
init_per_testcase(case2, Config) ->
	[{c, case2} | Config];
init_per_testcase(case3, Config) ->
	[{c, case3} | Config].
	
end_per_testcase( _, _Config) ->
	ok.
	
init_per_group(group1, Config) ->
	[{g, group1} | Config];
init_per_group(group2, Config) ->
	[{g, group2} | Config].
	
end_per_group( _, _Config) ->
	ok.
	
case1(Config) ->
	{case1 = ?config(c, Config), group1 = ?config(g, Config)}.
	
case2(Config) ->
	{case2 = ?config(c, Config), group2 = ?config(g, Config)}.
	
case3(Config) ->
	{case3 = ?config(c, Config), group2 = ?config(g, Config)}.

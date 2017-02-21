%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright (c) 2017, Mathieu Kerjouan <mk [at] steepath.eu>
%%% @doc documentation about this module
%%%      ...
%%% @end
%%%-------------------------------------------------------------------

-module(smerl).
-compile([export_all]).
-include("smerl.hrl").

main(Args) ->
    arguments(Args).

arguments(Args) ->
    case filelib:is_file(?CONFIG) of
	true -> 
	    io:format("open file ~s~n", [?CONFIG]),
	    options(Args, [{config, ?CONFIG}]);
	false -> 
	    io:format("configuration ~s not found~n", [?CONFIG]),
	    options(Args, [])
    end.

options([], Parameters) ->
    smerl_usage:main(Parameters);
?OPTIONS("add",       'smerl_add');
?OPTIONS("announce",  'smerl_announce');
?OPTIONS("automatic", 'smerl_automatic');
?OPTIONS("build",     'smerl_build');
?OPTIONS("check",     'smerl_check');
?OPTIONS("create",    'smerl_create');
?OPTIONS("daemon",    'smerl_daemon');
?OPTIONS("deploy",    'smerl_deploy');
?OPTIONS("fetch",     'smerl_fetch');
?OPTIONS("get",       'smerl_get');
?OPTIONS("gui",       'smerl_gui');
?OPTIONS("help",      'smerl_usage');
?OPTIONS("init",      'smerl_create');
?OPTIONS("list",      'smerl_list');
?OPTIONS("log",       'smerl_log');
?OPTIONS("log",       'smerl_log');
?OPTIONS("look",      'smerl_look');
?OPTIONS("optimize",  'smerl_optimize');
?OPTIONS("remove",    'smerl_remove');
?OPTIONS("set",       'smerl_set');
?OPTIONS("test",      'smerl_test');
?OPTIONS("update",    'smerl_update');
?OPTIONS("usage",     'smerl_usage');
?OPTIONS("wui",       'smerl_wui');
options(_, _) ->
    smerl_usage:main().

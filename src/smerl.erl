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
?OPTIONS("add",       'smerl_add');       % add new article
?OPTIONS("announce",  'smerl_announce');  % announce new article
?OPTIONS("automatic", 'smerl_automatic'); % automatic actions
?OPTIONS("build",     'smerl_build');     % build static site
?OPTIONS("check",     'smerl_check');     % check conf and articles syntax
?OPTIONS("create",    'smerl_create');    % create new static site
?OPTIONS("daemon",    'smerl_daemon');    % run as daemon
?OPTIONS("deploy",    'smerl_deploy');    % deploy site to remote endpoint
?OPTIONS("fetch",     'smerl_fetch');     % fetch external features
?OPTIONS("get",       'smerl_get');       % get parameters
?OPTIONS("gui",       'smerl_gui');       % start gui
?OPTIONS("help",      'smerl_usage');     % print usage
?OPTIONS("init",      'smerl_create');    % alias for create
?OPTIONS("list",      'smerl_list');      % list all articles
?OPTIONS("log",       'smerl_log');       % list action history
?OPTIONS("look",      'smerl_look');      % start local server
?OPTIONS("optimize",  'smerl_optimize');  % optimize html/css/js files
?OPTIONS("remove",    'smerl_remove');    % remove article
?OPTIONS("set",       'smerl_set');       % set parameters
?OPTIONS("test",      'smerl_test');      % test capabilities
?OPTIONS("update",    'smerl_update');    % update current build
?OPTIONS("usage",     'smerl_usage');     % print usage
?OPTIONS("wui",       'smerl_wui');       % start web ui
options(_, _) ->
    smerl_usage:main().

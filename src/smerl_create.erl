%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright (c) 2017, Mathieu Kerjouan <mk [at] steepath.eu>
%%% @doc documentation about this module
%%%      ...
%%% @end
%%%-------------------------------------------------------------------

-module(smerl_create).
-compile([export_all]).
-include("smerl.hrl").

template() ->
    [{file, ?CONFIG}
    ,{file, index} 
    ,{dir, template}
    ,{file, "template/header"}
    ,{file, "template/footer"}
    ,{dir, static}   
    ,{dir, article}].

main() ->
    usage().

main(Parameters) ->
    usage().

% smerl create Name
% smerl create Name with git
% smerl create Name with fossil
% smerl create Name with mercurial
% smerl create Name with svn
main([], Parameters) ->
    ok;
main([Name|Tail], Parameters) ->
    arguments(Tail, [{name, Name}] ++ Parameters);
main(Rest, Parameters) ->
    usage().

arguments([], Parameters) ->
    execute(Parameters);
arguments(["with", "git"], Parameters) ->
    execute(git, Parameters);
arguments(["with", "fossil"], Parameters) ->
    execute(fossil, Parameters);
arguments(_, _) ->
    usage().

execute(Parameters) ->
    Name = proplists:get_value(name, Parameters),
    io:format("initialize ~p static size...~n", [Name]).

execute(git, Parameters) ->
    Name = proplists:get_value(name, Parameters),
    io:format("initialize repository ~p with git~n", [Name]);
execute(fossil, Parameters) ->
    Name = proplists:get_value(name, Parameters),
    io:format("initialize repository ~p with fossil~n", [Name]);
execute(svn, Parameters) ->
    Name = proplists:get_value(name, Parameters),
    io:format("initialize repository ~p with svn~n", [Name]).

usage() ->
    ok.
usage(Parameters) ->
    ok.

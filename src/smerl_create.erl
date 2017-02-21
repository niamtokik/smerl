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
    ,{file, "index"} 
    ,{dir,  "template"}
    ,{file, "template/header"}
    ,{file, "template/footer"}
    ,{dir,  "static"}   
    ,{dir,  "article"}].

template(Template, Parameters) ->
    Dir = proplists:get_value(name, Parameters),
    template(Template, Dir, Parameters).

template([], Dir, Parameters) ->
    ok;
template([{file, Target}|Tail], Dir, Parameters)->
    io:format("touch -p ~s~n", [Dir ++ "/" ++ Target]),
    template(Tail, Dir, Parameters);
template([{dir, Target}|Tail], Dir, Parameters) ->
    io:format("mkdir -p ~s~n", [Dir ++ "/" ++ Target]),
    template(Tail, Dir, Parameters).

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
    io:format("initialize ~p static dir...~n", [Name]),
    template(template(), Parameters).

execute(git, Parameters) ->
    Name = proplists:get_value(name, Parameters),
    io:format("initialize repository ~p with git~n", [Name]),
    io:format("git init ~s~n", [Name]),
    execute(Parameters);
execute(fossil, Parameters) ->
    Name = proplists:get_value(name, Parameters),
    io:format("initialize repository ~p with fossil~n", [Name]),
    io:format("mkdir -p ~s~n", [Name]),
    io:format("fossil new ~s~n", [Name ++ "/" ++ Name ++ ".fossil"]),
    execute(Parameters);
execute(svn, Parameters) ->
    Name = proplists:get_value(name, Parameters),
    io:format("initialize repository ~p with svn~n", [Name]).

usage() ->
    ok.
usage(Parameters) ->
    ok.

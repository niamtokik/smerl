%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright (c) 2017, Mathieu Kerjouan <mk [at] steepath.eu>
%%% @doc documentation about this module
%%%      ...
%%% @end
%%%-------------------------------------------------------------------

-module(smerl_add).
-compile([export_all]).

main() ->
    ok.

execute(Name) ->
    Target = "article/yyyy-mm-dd-title.asc",
    % Target = "tag/tag1/tag2/tag3/yyyy-mm-dd-title.asc",
    io:format("add ~s/~s", [Name, Target]).

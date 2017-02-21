%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright (c) 2017, Mathieu Kerjouan <mk [at] steepath.eu>
%%% @doc documentation about this module
%%%      ...
%%% @end
%%%-------------------------------------------------------------------

-module(smerl_commands).
-compile(export_all).
-include("smerl.hrl").

% init static site template
%   $ smerl create mywebsite
%     mkdir mywebsite
%     touch mywebsite/index
%     mkdir mywebsite/article
%     mkdir mywebsite/static
create() ->
    [{file, ?CONFIG}
    ,{file, "index"}
    ,{dir,  "article"}
    ,{dir,  "static"}].
create(List) ->
    ok.

% create or update configuration file
% from command line
%   $ smerl set announce
%   $ smerl set deploy
set(List) ->
    ok.

% get current configuration from configuration
% file
%   $ smerl get announce
%   $ smerl get deploy
get(List) ->
    ok.

% fetch and extract required files automatically
%   $ smerl fetch javascript [url|projectname]
%   $ smerl fetch javascript angularjs
%   $ smerl fetch css [url|projectname]
%   $ smerl fetch css bootstrap
fetch(List) ->
    ok.

% check syntax
%   $ smerl check 
check(List) ->
    ok.

% build site
%   $ smerl build
%     mkdir mywebsite/_build
%     generate mywebsite/_build/index.html
%     generate mywebsite/_build/
build(List) ->
    ok.

% update existing
%   $ smerl update 
update(List) ->
    ok.

% add new article based on configuration
add(List) ->
    ok.

% remove article based on configuration
remove(List) ->
    ok.

% list current article
list(List) ->
    ok.

% list action history from the beginning
% of the creation.
log(List) ->
    ok.

% listen on localhost:8080
% and see static site
%   $ smerl look
look(List) ->
    ok.

% compress all static files
% require extra software like ImageMagick
optimize(List) ->
    ok.

% GUI administrative page
% using erlang with wx 
%   $ smerl gui
gui(List) ->
    ok.

% Web ui administrative page
% using web page.
%   $ smerl wui
wui(List) ->
    ok.

% Run this script as daemon with rest
% api control.
%   $ smerl daemon
daemon(List) ->
    ok.

% deploy update to remote store
% with ftp, http, git, fossil...
%   $ smerl deploy
deploy(List) ->
    ok.

% make an announce on social network
% like twitter, facebook, linkedin...
%   $ smerl announce
announce(List) ->
    ok.

% make automatic scripted action 
% configured from configuration file
%   $ smerl automatic
automatic(List) ->
    ok.

% return help
usage() ->
    io:format("Usage: smerl ~s~n", ["create"]).

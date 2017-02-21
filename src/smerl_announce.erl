%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright (c) 2017, Mathieu Kerjouan <mk [at] steepath.eu>
%%% @doc documentation about this module
%%%      ...
%%% @end
%%%-------------------------------------------------------------------

-module(smerl_announce).
-compile([export_all]).

% smerl announce all
% smerl announce rss
% smerl announce twitter
% smerl announce linkedin
% smerl announce alentoor
% smerl announce facebook
% smerl announce google
% smerl announce mail

main() ->
    ok.
main(Parameters) ->
    ok.
main(Rest, Parameters) ->
    ok.


mail_template() ->
    [{recipient, []}
    ,{subject, <<"">>}
    ,{message, <<"">>}].

mail() ->
    smerl_announce_mail:main().

twitter_template() ->
    [{message, <<"">>}
    ,{parameters, []}].

twitter() ->
    smerl_announce_twitter:main().


linkedin() ->
    smerl_announce_linkedin:main().

alentoor() ->
    smerl_announce_alentoor:main().

facebook() ->
    smerl_announce_facebook:main().

google() ->
    smerl_announce_google:main().

execute() ->
    ok.

usage() ->
    ok.

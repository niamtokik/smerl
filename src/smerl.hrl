%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan <mk [at] steepath.eu >
%%% @copyright (c) 2017, <mk [at] steepath.eu>
%%% @doc documentation about this module
%%%      ...
%%% @end
%%%-------------------------------------------------------------------

-define(CONFIG, "smerl.cfg").

% simple macro helper
-define(OPTIONS(X, Y),
	options([X],Parameters) ->
	       Y:main(Parameters);
        options([X|Rest], Parameters) ->
	       Y:main(Rest, Parameters)).


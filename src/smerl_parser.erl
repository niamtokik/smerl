%%%-------------------------------------------------------------------
%%% @author Mathieu Kerjouan
%%% @copyright (c) 2017, Mathieu Kerjouan <mk [at] steepath.eu>
%%% @doc documentation about this module
%%%      ...
%%% @end
%%%-------------------------------------------------------------------

-module(smerl_parser).
-compile([export_all]).

-define(PARSER(X, Y),
	parse(<<X/utf8, Rest/bitstring>>) ->
	       Y(<<Rest/utf8>>)).

parse(<<"\n", Rest/bitstring>>) ->
    ok;
parse(<<"\n\n", Rest/bitstring>>) ->
    ok;

% we only map parenthesis!
parse(<<"\\(", Rest/bitstring>>) ->
    ok;
parse(<<"\\)", Rest/bitstring>>) ->
    ok;

% meta
?PARSER("(meta ", meta);
?PARSER("(m ", meta);

% title
?PARSER("(title ", title);
?PARSER("(t ", title);

% chapter
?PARSER("(chapter ", chapter);
?PARSER("(c ", chapter);

% section
?PARSER("(section ", section);
?PARSER("(subsection ", subsection);
?PARSER("(subsubsection ", subsubsection);

% paragraph
?PARSER("(paragraph ", paragraph);
?PARSER("(p ", paragraph);

% code
?PARSER("(code ", code);
?PARSER("($ ", code);

% comment
?PARSER("(comment ", comment);
?PARSER("(# ", comment);

% inclusion - need to protect against loop
?PARSER("(include ", include);
?PARSER("(i ", include);

% evaluate text expression
?PARSER("(eval ", eval);
?PARSER("(! ", eval);

% text
parse(<<Char, Rest/bitstring>>) ->
    ok.

%%--------------------------------------------------------------------
%%
%%--------------------------------------------------------------------
article(_) ->
    <<"<article>My Article</article>">>.

title(_) ->
    <<"<title>My Title</title>">>.

chapter(_) ->
    <<"<h1>My Chapter</h1>">>.

section(_) ->
    <<"<h2>My Section</h2>">>.

subsection(_) ->
    <<"<h3>My Subsection</h3>">>.

subsubsection(_) ->
    <<"<h4>My Subsubsection</h4>">>.

paragraph(_) ->
    <<"<p>My Paragraph Text</p>">>.

code(_) ->
    <<"<pre>My Code</pre>">>.

comment(_) ->
    ok.

meta(_) ->
    ok.

include(_) ->
    ok.

eval(_) ->
    ok.

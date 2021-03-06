
%-------------
% Latin
%

lsentence(M, [CapFirst|Rest], []) :-
  var(M),
  capitalize(First, CapFirst),
  lsent(M, [First|Rest], []).
lsentence(M, S, []) :-
  var(S),
  lsent(M, [First|Rest], []),
  capitalize(First, CapFirst),
  S = [CapFirst|Rest].

lsent( identity(subj(S),obj(O)) ) -->
  lsubject(S), lisverb(_), lobject(O), lperiod.

lsubject(S) --> lpronoun(S).

lobject(noun(O,[])) --> lnoun(O).

lisverb(M) --> [X], { dict(ldict, M, X, [ps=verb,is]) }.

lpronoun(M) --> [X], { dict(ldict, M, X, [ps=pronoun]) }.

lnoun(M) --> [X], { dict(ldict, M, X, [ps=noun]) }.

lperiod --> ['. '].

ldict(book, liber, [ps=noun]).
ldict(is, est, [ps=verb,is]).
ldict(this, hic, [ps=pronoun]).

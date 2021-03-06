%  Here's how to use it:
%  
%  ?- armaments(truman, X).
%  
%  X = 110 
%  
%  yes
%  ?- armaments(C, X).
%  
%  C = eisenhower
%  X = 120 ;
%  
%  C = truman
%  X = 110 ;
%  no
%  ?- 

carrier(eisenhower, [ raptors , helicopters, tomahawks ] , [ 45, 25, 50 ]).
carrier(truman, [raptors, helicopters, tomahawks ], [53, 15, 42]).

armaments(CARRIER, TOTAL_ARMS) :-
   carrier(CARRIER, ARMS, QUANTITIES),
   sum(QUANTITIES, TOTAL_ARMS).

% You basically write your own utilities.  Here's one that adds up a list of numbers:

% It recurses through the list using an accumulater, second argument to store sum:
sum(LIST, SUM) :-
   sum(LIST, 0, SUM).

% when the list is empty, the accumulator, second argument, has the answer.
sum([], SUM, SUM).

sum([N | Ns], ACC, SUM) :-
   ACC2 is ACC + N,    % add the number to the accumulator
   sum(Ns, ACC2, SUM).  % and recurse

%---------------------------------------------------------
% You could also do it a bit different, using property lists:

% Here's how to use it this way:
% 
% ?- armaments2(truman, X).
% 
% X = 110 
% 
% yes
% ?- armaments2(C, X).
% 
% C = eisenhower
% X = 120 ;
% 
% C = truman
% X = 110 ;
% no
% ?- report_arms(truman).
% truman
%   raptors - 53
%   helicopters - 15
%   tomahawks - 42
% 
% yes
% ?- report_arms.
% eisenhower
%   raptors - 45
%   helicopters - 25
%   tomahawks - 50
% 
% truman
%   raptors - 53
%   helicopters - 15
%   tomahawks - 42
%  

carrier2(eisenhower, [raptors - 45, helicopters - 25, tomahawks - 50]).
carrier2(truman, [raptors - 53, helicopters - 15, tomahawks - 42]).

armaments2(CARRIER, TOTAL_ARMS) :-
  carrier2(CARRIER, ARMS),
  sum_arms(ARMS, TOTAL_ARMS).

sum_arms(LIST, SUM) :-
   sum_arms(LIST, 0, SUM).
   
sum_arms([], SUM, SUM).
sum_arms([ ARM - N | ARMS], ACC, SUM) :-
   ACC2 is ACC + N,
   sum_arms(ARMS, ACC2, SUM).

% The property list makes it easier to generate reports:

report_arms :-
   carrier2(C, _),
   report_arms(C),
   fail.
report_arms.
   
report_arms(CARRIER) :-
  carrier2(CARRIER, ARMS),
  write(CARRIER), nl,
  write_arms_list(ARMS).

write_arms_list([]) :-
   nl.
write_arms_list( [ARM|ARMS] ) :-
   tab(2), write(ARM),
   nl,
   write_arms_list(ARMS).

% What this is intended to illustrate is that Prolog is very flexible in it's ability to represent knowledge.
% You can set up the knowledge about carriers and armaments however it makes sense, and then write
% Prolog predicates that pick the knowledge apart and use it however you would like.
%
% This simple example uses the exact same ideas used in the TCM knowledge base.  We create a way to
% represent the knowledge, in a similar way to the way I represented the carriers above.
%
% Then there are predicates written that use that knowledge in the manner we want, in that case taking
% inputs about symptoms and matching them with a diagnosis.
%
% Here's how we might make more use of the carrier knowledge.  Say we wanted to pick a carrier to deploy
% based on our requirements for a mission.  Again, this is very similar to what we did with TCM.

% we will assert a requirement like this:
% requirement( helicopter - N ).

% Here's how to use it:
% ?- assert( requirement( helicopters - 20 ) ).
% 
% yes
% ?- deploy_carrier(X).
% 
% X = eisenhower ;
% no
% ?- retract( requirement( _ ) ).
% 
% yes
% 
% ?- assert( requirement( helicopters - 10 ) ).
% 
% yes
% ?- deploy_carrier(X).
% 
% X = eisenhower ;
% 
% X = truman ;
% no
% ?- 

deploy_carrier(CARRIER) :-
   requirement( ARM - NEEDED ),
   carrier2(CARRIER, ARMS),
   member( ARM - AVAILABLE, ARMS ),
   AVAILABLE > NEEDED.

% we need a copy of member/2:

member(A, [A|_]).
member(A, [_|Z]) :- member(A,Z).

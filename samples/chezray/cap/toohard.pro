%% Code generated by crypto on 11/28/2001.

:- dcg_terminal(draw).
:- noNonTerminals.

domain([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]).

toohard :-
    solution(toohard, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], X).

solution(toohard) -->
   [S], 
   evaluate(S * S, ProdCarry46, O), 
   [O], 
   evaluate(0 + O , SumCarry6, R76), 
   *[R76], 
   [I], I > 0, 
   evaluate(I * S + ProdCarry46, ProdCarry45, O), 
   evaluate(S * I, ProdCarry55, R55), 
   *[R55], 
   evaluate(SumCarry6 + O + R55 , SumCarry5, R75), 
   *[R75], 
   [H], H > 0, 
   evaluate(H * S + ProdCarry45, ProdCarry44, T), 
   [T], T > 0, 
   evaluate(I * I + ProdCarry55, ProdCarry54, D), 
   [D], 
   evaluate(SumCarry5 + T + D , SumCarry4, R74), 
   *[R74], 
   evaluate(T * S + ProdCarry44, R42, R43), 
   *[R43], 
   *[R42], R42 > 0, 
   evaluate(H * I + ProdCarry54, ProdCarry53, R), 
   [R], 
   evaluate(SumCarry4 + R43 + R , SumCarry3, R73), 
   *[R73], 
   evaluate(T * I + ProdCarry53, H, A), 
   [A], 
   evaluate(SumCarry3 + R42 + A , SumCarry2, R72), 
   *[R72], 
   evaluate(SumCarry2 + H , 0, R71), 
   *[R71], R71 > 0, 
   displayGram(6, 7, 
               ['R71', 'R72', 'A', 'R73', 'R', 'R42', 'R43', 'R74', 'D', 'T', 'H', 'R75', 'R55', 'I', 'R76', 'O', 'S'], 
               [R71, R72, A, R73, R, R42, R43, R74, D, T, H, R75, R55, I, R76, O, S]	).

pos('T', 3, 1, 0).
pos('H', 4, 1, 0).
pos('I', 5, 1, 0).
pos('S', 6, 1, 0).
pos('I', 5, 2, 0).
pos('S', 6, 2, 0).
pos('R42', 2, 4, 1).
pos('R43', 3, 4, 1).
pos('T', 4, 4, 0).
pos('O', 5, 4, 0).
pos('O', 6, 4, 0).
pos('H', 1, 5, 0).
pos('A', 2, 5, 0).
pos('R', 3, 5, 0).
pos('D', 4, 5, 0).
pos('R55', 5, 5, 1).
pos('R71', 1, 7, 1).
pos('R72', 2, 7, 1).
pos('R73', 3, 7, 1).
pos('R74', 4, 7, 1).
pos('R75', 5, 7, 1).
pos('R76', 6, 7, 1).
barLine(1, 3, real).
barLine(2, 6, real).

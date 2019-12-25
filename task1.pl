length2([], 0).
length2([_|T], N):-length2(T, N1),N is N1 + 1.

member2([X|_], X):-!.
member2([_|Y], X):-member2(Y, X).

append2([], X, X).
append2([X|Y], Z, [X|T]):-append2(Y, Z, T).

remove2(X, [X|T], T).
remove2(X, [Y|T], [Y|R]):-remove2(X, T, R).

permute2([],[]).
permute2(X, R):-remove2(Y, X, T),permute2(T, T1),R = [Y|T1].

sublist2(S, R):-append2(X, _, S),append2(_, R, X).


%Вставка элемента в список на заданную позицию

%с использованием стандартных предикатов
ins_in_pos_std([],N,_,_) :- N>0, !.
ins_in_pos_std(T1,1,Q,T) :- append2([Q],T1,T).
ins_in_pos_std([H|T],N,Q,[H|R]) :- N>0, N1 is N-1, ins_in_pos_std(T,N1,Q,R).

%без стандартных предикатов
ins_in_pos([],N,_,_) :- N>0, !.
ins_in_pos(T,1,Q,[Q|T]).
ins_in_pos([H|T],N,Q,[H|R]) :- N>0, N1 is N-1, ins_in_pos(T,N1,Q,R).


%Поиск индекса первого отрицательного элемента в списке

%с использованием стандартных предикатов
indexOfMinStd([H|T], A, I) :-
    H < 0, length2(A,I);
    append2(A,[H],A1),
    indexOfMinStd(T,A1,I).
indexOfMinStd(List, Index) :-
    indexOf(List, 1, Index).

%без стандартных предикатов
indexOfMin([H|T], A, I) :-
    H < 0, A = I, !;
    ANew is A + 1,
    indexOfMin(T, ANew, I).
indexOfMin(List, Index) :-
    indexOf(List, [], Index).



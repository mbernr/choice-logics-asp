
% For a nice output, we introduce a unary predicate deg/1, 
% which only shows the satisfaction degree of the input formula.
deg(K) :- inputformula(F), deg(F,K).

% Formula must have a finite degree to be a preferred model
:- deg(#sup).

% Minimizing over #sup will give a warning. Therefore we introduce the helper predicate p/1.
p(K) :- deg(K), K < #sup.

% Minimize answer sets
#minimize {X:p(X)}.

#show in/1.
#show deg/1.
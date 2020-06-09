
% For a nice output, we introduce a unary predicate deg/1, 
% which only shows the satisfaction degree of the input formula.
deg(K) :- inputformula(F), deg(F,K).

% Formula must have a finite degree to be a model
:- deg(#sup).

#show in/1.
#show deg/1.
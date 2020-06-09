% If these rules were omitted, inputformula1 and inputformula2 would not be processed
inputformula(F) :- inputformula1(F).
inputformula(F) :- inputformula2(F).

% Filtering out interpretations for which the two 
% input formulas have the same satisfaction degree.
:- inputformula1(F), inputformula2(G), deg(F,K), deg(G,L), K=L.

#show in/1.
% If these rules were omitted, inputformula1 and inputformula2 would not be processed
inputformula(F) :- inputformula1(F).
inputformula(F) :- inputformula2(F).

% Filtering out interpretations for which the two 
% input formulas have the same satisfaction degree,
% (and the same optionality).
same_degree :- inputformula1(F), inputformula2(G), deg(F,K), deg(G,L), K=L.
same_optionality :- inputformula1(F), inputformula2(G), opt(F,K), opt(G,L), K=L.
:- same_degree, same_optionality.

#show in/1.
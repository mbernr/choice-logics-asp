
% Syntax 

subformula(F,F) :- inputformula(F).
subformula(F,G) :- subformula(F,neg(G)).
subformula(F,G) :- subformula(F,and(G,_)).
subformula(F,G) :- subformula(F,and(_,G)).
subformula(F,G) :- subformula(F,or(G,_)).
subformula(F,G) :- subformula(F,or(_,G)).
subformula(F,G) :- subformula(F,pref(_,G,_)).
subformula(F,G) :- subformula(F,pref(_,_,G)).

-atom(F) :- subformula(_,F), F = neg(_).
-atom(F) :- subformula(_,F), F = and(_,_).
-atom(F) :- subformula(_,F), F = or(_,_).
-atom(F) :- subformula(_,F), F = pref(_,_,_).
atom(F) :- subformula(_,F), not -atom(F).


% Guess interpretations 

{in(F) : atom(F)}.
out(F) :- atom(F), not in(F).


% Semantics for classical connectives

opt(F,1) :- subformula(_,F), atom(F).
opt(F,1) :- subformula(_,F), F = neg(_).
opt(F,X) :- subformula(_,F), F = and(G,H), opt(G,X), opt(H,Y), X >= Y.
opt(F,Y) :- subformula(_,F), F = and(G,H), opt(G,X), opt(H,Y), X < Y.
opt(F,X) :- subformula(_,F), F = or(G,H), opt(G,X), opt(H,Y), X >= Y.
opt(F,Y) :- subformula(_,F), F = or(G,H), opt(G,X), opt(H,Y), X < Y.

deg(F,1) :- subformula(_,F), atom(F), in(F).
deg(F,#sup) :- subformula(_,F), atom(F), out(F).
deg(F,1) :- subformula(_,F), F = neg(G), deg(G,#sup).
deg(F,#sup) :- subformula(_,F), F = neg(G), deg(G,K), K < #sup.
deg(F,X) :- subformula(_,F), F = and(G,H), deg(G,X), deg(H,Y), X >= Y.
deg(F,Y) :- subformula(_,F), F = and(G,H), deg(G,X), deg(H,Y), X < Y.
deg(F,X) :- subformula(_,F), F = or(G,H), deg(G,X), deg(H,Y), X < Y.
deg(F,Y) :- subformula(_,F), F = or(G,H), deg(G,X), deg(H,Y), X >= Y.


% Handle the custom definition for the choice connective

optIn(CL, X, Y) :- subformula(_,F), F = pref(CL,G,H), opt(G,X), opt(H,Y).
opt(F,Z) :- subformula(_,F), F = pref(CL,G,H), opt(G,X), opt(H,Y), optOut(CL, X, Y, Z).

degIn(CL, Opt1, Deg1, Opt2, Deg2) :- subformula(_,F), F = pref(CL,G,H), opt(G,Opt1), opt(H,Opt2), deg(G,Deg1), deg(H,Deg2).
deg(F,Z) :- subformula(_,F), F = pref(CL,G,H), opt(G,Opt1), opt(H,Opt2), deg(G,Deg1), deg(H,Deg2), degOut(CL, Opt1, Deg1, Opt2, Deg2, Z).
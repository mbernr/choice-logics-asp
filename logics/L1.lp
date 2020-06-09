
% Define L1 connective

optOut('l1',X, Y, Z) :- optIn('l1', X, Y), Z = X + 1. 

degOut('l1', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('l1', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Deg2 < #sup.
degOut('l1', Opt1, Deg1, Opt2, Deg2, Deg1 + 1) :- degIn('l1', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Deg2 = #sup.
degOut('l1', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('l1', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup.
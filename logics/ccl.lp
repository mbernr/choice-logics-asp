
% Define CCL connective

optOut('ccl',X, Y, Z) :- optIn('ccl', X, Y), Z = X + Y. 

degOut('ccl', Opt1, Deg1, Opt2, Deg2, Deg2) :- degIn('ccl', Opt1, Deg1, Opt2, Deg2), Deg1 = 1.
degOut('ccl', Opt1, Deg1, Opt2, Deg2, Deg1 + Opt2) :- degIn('ccl', Opt1, Deg1, Opt2, Deg2), Deg1 > 1, Deg1 < #sup.
degOut('ccl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('ccl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup.
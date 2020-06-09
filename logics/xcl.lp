
% Define XCL connective

optOut('xcl',X, Y, Z) :- optIn('xcl', X, Y), Z = X + Y. 

degOut('xcl', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('xcl', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Deg2 = #sup.
degOut('xcl', Opt1, Deg1, Opt2, Deg2, Deg2 + Opt1) :- degIn('xcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 < #sup.
degOut('xcl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('xcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 = #sup.
degOut('xcl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('xcl', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Deg2 < #sup.
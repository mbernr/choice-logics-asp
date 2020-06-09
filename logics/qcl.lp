
% Define QCL connective

optOut('qcl',X, Y, Z) :- optIn('qcl', X, Y), Z = X + Y. 

degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg2 + Opt1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 = #sup.
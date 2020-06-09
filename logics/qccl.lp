
% Define QCL connective

optOut('qcl',X, Y, Z) :- optIn('qcl', X, Y), Z = X + Y. 

degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg2 + Opt1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 = #sup.


% Define CCL connective

optOut('ccl',X, Y, Z) :- optIn('ccl', X, Y), Z = X + Y. 

degOut('ccl', Opt1, Deg1, Opt2, Deg2, Deg2) :- degIn('ccl', Opt1, Deg1, Opt2, Deg2), Deg1 = 1.
degOut('ccl', Opt1, Deg1, Opt2, Deg2, Deg1 + Opt2) :- degIn('ccl', Opt1, Deg1, Opt2, Deg2), Deg1 > 1, Deg1 < #sup.
degOut('ccl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('ccl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup.

% Regular QCL choice connective (ordered disjunction)

optOut('qcl',X, Y, Z) :- optIn('qcl', X, Y), Z = X + Y. 

degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg2 + Opt1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 = #sup.


% Conjunction of PQCL

optOut('pqcl_and',X, Y, Z) :- optIn('pqcl_and', X, Y), Z = X * Y. 

degOut('pqcl_and', Opt1, Deg1, Opt2, Deg2, (Deg1-1)*Opt2+Deg2) :- degIn('pqcl_and', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Deg2 < #sup.
degOut('pqcl_and', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('pqcl_and', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup.
degOut('pqcl_and', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('pqcl_and', Opt1, Deg1, Opt2, Deg2), Deg2 = #sup.


% Disjunction of PQCL

optOut('pqcl_or',X, Y, Z) :- optIn('pqcl_or', X, Y), Z = X * Y. 

degOut('pqcl_or', Opt1, Deg1, Opt2, Deg2, 1) :- degIn('pqcl_or', Opt1, Deg1, Opt2, Deg2), Deg1 = 1.
degOut('pqcl_or', Opt1, Deg1, Opt2, Deg2, 1) :- degIn('pqcl_or', Opt1, Deg1, Opt2, Deg2), Deg2 = 1.
degOut('pqcl_or', Opt1, Deg1, Opt2, Deg2, (Deg1-1)*Opt2+1) :- degIn('pqcl_or', Opt1, Deg1, Opt2, Deg2), Deg1 > 1, Deg1 < #sup, Deg2 = #sup.
degOut('pqcl_or', Opt1, Deg1, Opt2, Deg2, Deg2) :- degIn('pqcl_or', Opt1, Deg1, Opt2, Deg2), Deg1 > 1, Deg2 > 1, Deg2 < #sup.
degOut('pqcl_or', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('pqcl_or', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 = #sup.


% A choice logic based on 3 levels of satisfaction

optOut('l4',X, Y, Z) :- optIn('l4', X, Y), Z = (X+1)*(Y+1)-1. 

degOut('l4', Opt1, Deg1, Opt2, Deg2, (Deg1-1)*Opt2+Deg2) :- degIn('l4', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Deg2 < #sup.
degOut('l4', Opt1, Deg1, Opt2, Deg2, Opt1*Opt2+Deg1) :- degIn('l4', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Deg2 = #sup.
degOut('l4', Opt1, Deg1, Opt2, Deg2, Opt1*Opt2+Opt1+Deg2) :- degIn('l4', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 < #sup.
degOut('l4', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('l4', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 = #sup.

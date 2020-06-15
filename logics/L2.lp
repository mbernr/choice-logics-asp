
% L2 is a rather strange choice logic, that exemplifies
% how optionality can affect the satisfaction degree of
% only some formulas in a CL (those with opt != 3).

optOut('l2',X, Y, Z) :- optIn('l2', X, Y), Z = X + Y. 

degOut('l2', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('l2', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Opt2 != 3.
degOut('l2', Opt1, Deg1, Opt2, Deg2, Deg1 + Opt2) :- degIn('l2', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup, Opt2 = 3.
degOut('l2', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('l2', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup.
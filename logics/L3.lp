
% L3 is another strange choice logic, in which we
% require the first operand to have a degree lower
% than 3. We then prefer those interpretations
% that ascribe a degree of lower than 3 to the 
% second operand. This is not intuitive, arguably,
% but is allowed by the CL-framework.

optOut('l3',X, Y, Z) :- optIn('l3', X, Y), Z = X + 1. 

degOut('l3', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('l3', Opt1, Deg1, Opt2, Deg2), Deg1 < 3, Deg2 < 3.
degOut('l3', Opt1, Deg1, Opt2, Deg2, Deg1 + 1) :- degIn('l3', Opt1, Deg1, Opt2, Deg2), Deg1 < 3, Deg2 >= 3.
degOut('l3', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('l3', Opt1, Deg1, Opt2, Deg2), Deg1 >= 3.
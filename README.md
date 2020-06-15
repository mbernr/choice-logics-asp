# Encoding Choice Logics in ASP

This repository shows how choice logics can be encoded using Answer Set Programming (ASP). Choice logics are a tool to express preferences by extending propositional logic with non-classical binary connectives. Two examples are Qualitative Choice Logic (QCL) and Conjunctive Choice Logic (CCL). In addition to QCL and CCL, many other choice logics can be devised. This framework is built in a way such that a new choice logic can be reasoned about by simply specifying the semantics of the additional choice connectives.

## Requirements

All code was written for clingo 5, see https://potassco.org/clingo/. 

## Usage

### Specifying a Choice Logic

To specify the semantics of a choice connective, one needs to encode the corresponding optionality and satisfaction degree functions. This must be done via the predicates *optIn*, *optOut*, *degIn* and *degOut*. The following example shows the specification of QCL's choice connective.

```
optOut('qcl',X, Y, Z) :- optIn('qcl', X, Y), Z = X + Y. 

degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, Deg2 + Opt1) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 < #sup.
degOut('qcl', Opt1, Deg1, Opt2, Deg2, #sup) :- degIn('qcl', Opt1, Deg1, Opt2, Deg2), Deg1 = #sup, Deg2 = #sup.
```
For more examples, take a look at the *logics/* directory.

### Input Formulas

The classical connectives are represented by the predicates *neg*, *and*, as well as *or*. Choice connectives are encoded via the ternary predicate *pref*. The first argument of *pref* tells us which choice connective we are dealing with. 

Some problems require only a single input formula, which must be contained in the *inputformula* predicate.

```
inputformula(
  or(pref('qcl',a,b), pref('ccl',neg(a),c))
).
```

Some problems, such as checking for equivalence, require two input formulas. These must be contained in the *inputformula1*  and *inputformula2* predicates.

```
inputformula1(
  pref('qcl',a,pref('qcl',b,c))
).
inputformula2(
  pref('qcl',pref('qcl',a,b),c)
).
```

### Solving Problems

The code in *base.lp* does not need to be modified. Below, replace *input.lp* with the file containing your input formula, and replace *logic.lp* with the file containing the semantics of your choice connectives.

#### Show all models of some input formula

```clingo base.lp input.lp logic.lp models.lp 0```

#### Show preferred models of some input formula

```clingo --opt-mode=optN --quiet=1 base.lp input.lp logic.lp pref_models.lp```

#### Check whether two formulas are degree equivalent

```clingo base.lp input.lp logic.lp degree_equiv.lp```

Note that we are actually checking for the complement problem, i.e. the above program is unsatisfiable if and only if the two input formulas are degree equivalent.

#### Check whether two formulas are fully equivalent

```clingo base.lp input.lp logic.lp fully_equiv.lp```

Again, we are checking for the complement problem, i.e. the above program is unsatisfiable if and only if the two input formulas are fully equivalent.

Note that for QCL, strong equivalence and full equivalence are identical. 


## References

<a id="qcl_paper">[1]</a> Brewka, Gerhard, Salem Benferhat, and Daniel Le Berre. "Qualitative choice logic." Artificial Intelligence 157.1-2 (2004): 203-237.

<a id="ccl_paper">[2]</a> Abdelhamid Boudjelida and Salem Benferhat. "Conjunctive choice logic." International Symposium on Artificial Intelligence and Mathematics, ISAIM 2016, Fort Lauderdale, Florida, USA, January 4-6, 2016.

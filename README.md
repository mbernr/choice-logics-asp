# Encoding Choice Logics in ASP

This repository shows how choice logics can be encoded using Answer Set Programming (ASP). Choice logics are a tool to express preferences by extending propositional logic with non-classical binary connectives. Two examples are Qualitative Choice Logic (QCL) and Conjunctive Choice Logic (CCL). In addition to QCL and CCL, many other choice logics can be devised. This framework is built in a way such that a new choice logic can be reasoned about by simply specifying the semantics of the additional choice connectives.

## Requirements

All code was written for clingo 5, see https://potassco.org/clingo/. 

## Usage

Show all models of some input formula:

```clingo base.lp input.lp logic.lp models.lp 0```

Show preferred models of some input formula:

```clingo --opt-mode=optN --quiet=1 base.lp input.lp logic.lp pref_models.lp```

Check whether two formulas are degree equivalent:

```clingo base.lp input.lp logic.lp degree_equiv.lp```

Check whether two formulas are fully equivalent:

```clingo base.lp input.lp logic.lp fully_equiv.lp```


## References

<a id="qcl_paper">[1]</a> Brewka, Gerhard, Salem Benferhat, and Daniel Le Berre. "Qualitative choice logic." Artificial Intelligence 157.1-2 (2004): 203-237.

<a id="ccl_paper">[2]</a> Abdelhamid Boudjelida and Salem Benferhat. "Conjunctive choice logic." International Symposium on Artificial Intelligence and Mathematics, ISAIM 2016, Fort Lauderdale, Florida, USA, January 4-6, 2016.

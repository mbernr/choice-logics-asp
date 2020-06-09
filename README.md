# choice-logics-asp

Show all models of some input formula:

```clingo base.lp inputformulas/input_single1.lp logics/qccl.lp models.lp 0```

Show preferred models of some input formula:

```clingo --opt-mode=optN --quiet=1 base.lp inputformulas/input_single1.lp logics/qccl.lp pref_models.lp```

Check whether two formulas are fully equivalent:

```clingo base.lp inputformulas/input_pair1.lp logics/qcl.lp fully_equiv.lp```
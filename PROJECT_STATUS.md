# Project Status

This repository contains a 16:9 LaTeX Beamer lecture for the BIOS 662 TA review
session on September 28, 2026. The current deck covers parallel-group versus
crossover designs, clinical-trial phases, bootstrap sample-size terminology,
exact versus large-sample inference, and confidence intervals for a population
median. It also includes an HW2-Q1(e) module comparing base R and ggplot2
boxplots, plus an HW2-Q2(d) module on reclassifying patient #11, with an iPGE
scatter plot, before/after group summaries, and proofs of the sample-variance
conditions for adding or removing an observation. It uses standard Beamer
packages and the Madrid theme so it can compile
with a normal MiKTeX or TeX Live installation.

The source of truth is `main.tex`; `main.pdf` is generated and is not tracked.

The `code/` directory contains supporting BIOS 662 homework data and analysis
scripts. Homework 2 Problem 1(e) is implemented in `code/hw2_problem1e.R` and
generates comparable base R and ggplot2 boxplots.

Homework 2 Problem 2 uses `code/hw2_problem2.R` and its generated
`code/hw2_problem2_scatter.png`, which is included in the deck. The reclassification
example assumes correcting Ca moves patient #11 to normocalcemia while iPGE stays 60.

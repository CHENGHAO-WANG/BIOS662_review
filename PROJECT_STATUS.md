# Project Status

This repository contains a 16:9 LaTeX Beamer lecture for the BIOS 662 TA review
session on September 28, 2026. The current deck covers parallel-group versus
crossover designs, clinical-trial phases, bootstrap sample-size terminology,
exact versus large-sample inference, and confidence intervals for a population
median. It also includes an HW2-Q1(e) module comparing base R and ggplot2
boxplots. It uses standard Beamer packages and the Madrid theme so it can compile
with a normal MiKTeX or TeX Live installation.

The source of truth is `main.tex`; `main.pdf` is generated and is not tracked.

The `code/` directory contains supporting BIOS 662 homework data and analysis
scripts. Homework 2 Problem 1(e) is implemented in `code/hw2_problem1e.R` and
generates comparable base R and ggplot2 boxplots.

# BIOS 662 Lecture

This repository contains the LaTeX Beamer source for the September 28, 2026
BIOS 662 TA review lecture.

## Build

From this directory, run:

```powershell
latexmk -pdf main.tex
```

The generated presentation is `main.pdf`.

To remove generated LaTeX files, run:

```powershell
latexmk -C main.tex
```

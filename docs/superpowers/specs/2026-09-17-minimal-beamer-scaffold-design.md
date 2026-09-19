# Minimal Beamer Scaffold Design

## Goal

Initialize this directory as a Git repository containing a minimal, compilable
LaTeX Beamer presentation. The lecture topic and substantive structure will be
added later.

## Files

- `main.tex`: A small Beamer document with placeholder metadata, a title frame,
  an outline frame, and one sample content frame.
- `.gitignore`: Common LaTeX generated files and build directories.
- `README.md`: Prerequisites and concise `latexmk` build instructions.
- `PROJECT_STATUS.md`: A current-state description noting that the repository is
  an initialized Beamer scaffold awaiting lecture content.

## Constraints

- Keep the source compatible with a standard TeX Live or MiKTeX installation.
- Use only Beamer and packages normally included in those distributions.
- Do not add a bibliography, custom theme, timing plan, exercises, or lecture
  content at this stage.
- Keep all metadata clearly marked as placeholders.

## Verification

Compile `main.tex` with `latexmk -pdf` when `latexmk` is available. Confirm that
the expected PDF is produced and that Git contains only the intended scaffold
files and this design document.

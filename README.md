# Resume / CV

Personal resume built with LaTeX.

## Requirements

- [MacTeX](https://www.tug.org/mactex/)

## Building

```bash
pdflatex resume.tex
```

For a clean build (resolves any stale aux files):

```bash
rm -f *.aux *.log *.out && pdflatex resume.tex
```

## Project Structure

```
.
├── main.tex          # Main document
├── resume.cls        # Document class / style
├── resume.pdf        # Compiled output (not tracked in git)
└── README.md
```

## Notes

- PDF output is excluded from version control — compile locally to generate it
- Compiled with `pdflatex`


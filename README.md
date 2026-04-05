# Resume / CV

Personal resume built with LaTeX.

## Requirements

- [MacTeX](https://www.tug.org/mactex/)
- `pdflatex` and `latexmk` available on your PATH (included with MacTeX)

## Building Locally

Single build:

```bash
latexmk resume.tex
```

Watch mode — recompiles automatically on every save:

```bash
latexmk -pvc resume.tex
```

Build artifacts go to `build/` and the compiled PDF to `out/`. Neither directory is tracked in git.

## CI & Releases

Every push to `main` triggers a GitHub Actions workflow that compiles the resume in a clean environment and uploads the PDF as a workflow artifact, visible in the Actions tab for 90 days.

To publish a versioned release with the PDF permanently attached:

```bash
git tag v1.0
git push origin v1.0
```

This creates a Release with the compiled PDF as a downloadable asset.

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── build.yml    # CI workflow
├── resume.tex           # Main document
├── resume.cls           # Document class / style
├── latexmkrc            # Local build configuration
├── .gitignore
└── README.md
```

## Notes

- PDF output is excluded from version control — compile locally to generate it
- Compiled with `pdflatex`

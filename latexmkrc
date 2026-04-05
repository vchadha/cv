# Use pdflatex
$pdf_mode = 1;

# Output PDF with the same name as the main tex file
$out_dir = '.';

# Extra extensions to clean with `latexmk -c`
$clean_ext = "aux log out fls fdb_latexmk synctex.gz";

# Open PDF automatically after build (uses macOS Preview)
$pdf_previewer = 'open -a Preview';


#!/bin/bash

# Build the PDF using latexmk
echo "Building PDF..."

# Create exported directory if it doesn't exist
mkdir -p exported

# Run latexmk with proper configuration
latexmk -pdf -quiet -output-directory=exported -aux-directory=exported/aux -interaction=nonstopmode main.tex

# Check if build was successful
if [ -f "exported/main.pdf" ]; then
    echo "✓ PDF built successfully"

    # Clean up intermediate files (optional)
    latexmk -c -output-directory=exported main.tex
    echo "✓ Intermediate files cleaned"

    # Add the PDF to this commit
    git add exported/main.pdf
    echo "✓ PDF added to commit"
else
    echo "✗ PDF build failed!"
    echo "Check exported/main.log for errors"
    exit 1
fi

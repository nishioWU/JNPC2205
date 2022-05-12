#!/bin/sh

find . -name '*.pdf' | xargs -I{} dirname {} | sed 's/^.//' | xargs -I{} mkdir -p extracted_text{}
find . -name '*.pdf' | xargs -I{} pdftotext -nopgbrk {}
find . -name '*.pdf' | sed 's/^.//' | sed 's/.pdf$/.txt/' | xargs -I{} mv .{} extracted_text{}

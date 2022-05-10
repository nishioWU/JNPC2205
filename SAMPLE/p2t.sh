#!/bin/sh

find . -name '*.pdf' | xargs -I{} dirname {} | sed s/^.// | xargs -I{} mkdir -p OUTPUT{}
find . -name '*.pdf' | xargs -I{} pdftotext -nopgbrk {}
find . -name '*.pdf' | sed s/^.// | sed s/.pdf$/.txt/ | xargs -I{} mv .{} OUTPUT{}

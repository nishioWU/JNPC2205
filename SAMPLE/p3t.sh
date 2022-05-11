#!/bin/sh

# 出力先フォルダにタイムスタンプを付加した例
dir_prefix="extracted_text_"
dir_full="$dir_prefix`date +%Y-%m-%d_%H:%M:%S`"
find . -name '*.pdf' | xargs -I{} dirname {} | sed s/^.// | xargs -I{} mkdir -p "$dir_full"{}
find . -name '*.pdf' | xargs -I{} pdftotext -nopgbrk {}
find . -name '*.pdf' | sed s/^.// | sed s/.pdf$/.txt/ | xargs -I{} mv .{} "$dir_full"{}

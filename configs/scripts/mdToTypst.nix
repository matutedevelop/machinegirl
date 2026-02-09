{pkgs}:
pkgs.writeShellScriptBin "md2typ" ''
FILE_PATH="$1"
FILE_NAME_EXT="''${FILE_PATH##*/}"
FILE_NAME="''${FILE_NAME_EXT%.*}"

# Para cuando el filter este implementado utiliza este
# Esto es para que en obsidian puedas usar el plugin de  usar los bloques de matematicas de typst

#pandoc   -f markdown-raw_tex-tex_math_dollars   --to=typst   --template=/home/arroio/ITESO/TMPLTS/dir/template.typ   "/home/arroio/Documents/notest/notest/04-fleet/DATA ENG 1.1.md"   -o test.typ


pandoc --to=typst --template=/home/arroio/ITESO/TMPLTS/dir/template.typ "''${FILE_PATH}" -o "''${FILE_NAME}.typ"
typst  compile --root ../../../ "''${FILE_NAME}.typ"
zathura "''${FILE_NAME}.pdf"


''

{pkgs}:

pkgs.writeShellScriptBin "hyproled" ''

cd /home/arroio/Dev/TOOLS/hyproled
bash hyproled 
''


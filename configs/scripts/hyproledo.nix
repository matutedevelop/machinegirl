{pkgs}:

pkgs.writeShellScriptBin "hyproledo" ''
cd /home/arroio/Dev/TOOLS/hyproled
bash hyproled off
''



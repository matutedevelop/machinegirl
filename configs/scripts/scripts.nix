{ pkgs }:

{
  batteryNotify = import ./batteryNotify.nix { inherit pkgs; };
  hyproled = import ./hyproled.nix { inherit pkgs; };
  hyproledo = import ./hyproledo.nix { inherit pkgs; };
  rofiAudio = import ./rofiAudio.nix { inherit pkgs; };
  setWallpaper = import ./setWallpaper.nix { inherit pkgs; };
  cavaWaybar = import ./cava.nix { inherit pkgs; };
  mdToTypst = import ./mdToTypst.nix {inherit pkgs; };
  tmuxTermToggle = import ./tmuxTermToggle.nix {inherit pkgs; };
}

{ pkgs }:

{
  batteryNotify = import ./batteryNotify.nix { inherit pkgs; };
  hyproled = import ./hyproled.nix { inherit pkgs; };
  hyproledo = import ./hyproledo.nix { inherit pkgs; };
  rofiAudio = import ./rofiAudio.nix { inherit pkgs; };
  setWallpaper = import ./setWallpaper.nix { inherit pkgs; };
  cava-waybar = import ./cava.nix { inherit pkgs; };
}

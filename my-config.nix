{config, pkgs, ...}:

#nix.settings.experimental-features = [ "nix-command" "flakes" ];
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{

  imports = [
    (import "${home-manager}/nixos")
  ];
  
users.users.brunosxs = {
  isNormalUser = true;
  description = "BrunoSXS";
  extraGroups = ["networkmanager" "wheel"];
  packages = with pkgs; [
  ];
};

home-manager.users.brunosxs = {
/* The home.stateVersion option does not have a default and must be set */
home.stateVersion = "23.05";
home.packages = [pkgs.android-studio];
#programs.zsh.enable = true;
programs.git = 
{
	enable = true;
	userName = "BrunoSXS";
	userEmail = "trustmeiamadeveloper@gmail.com";
};

};
services.flatpak.enable = true;
}

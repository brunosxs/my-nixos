{config, pkgs, ...}:

#nix.settings.experimental-features = [ "nix-command" "flakes" ];
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
in
{

  imports = [
    (import "${home-manager}/nixos")
  ];
# Setting zsh as the default
users.defaultUserShell = pkgs.zsh;
programs.zsh = {
  enable = true; 
};
users.users.brunosxs = {
  isNormalUser = true;
  description = "BrunoSXS";
  extraGroups = ["networkmanager" "wheel"];
  packages = with pkgs; [
  zsh
  gparted
  blender
  ];
};

home-manager.users.brunosxs = {
/* The home.stateVersion option does not have a default and must be set */
home.stateVersion = "23.05";
home.packages = [pkgs.android-studio ];
#programs.zsh.enable = true;
programs.git = 
{
	enable = true;
	userName = "BrunoSXS";
	userEmail = "trustmeiamadeveloper@gmail.com";
};

programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    plugins = [
      {
	name = "fast-syntax-highlighting";
	file = "fast-syntax-highlighting.plugin.zsh";
	src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
	name = "zsh-nix-shell";
	file = "nix-shell.plugin.zsh";
	src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
      {
	# TODO use flake inputs for this
	name = "zsh-abbrev-alias";
	file = "abbrev-alias.plugin.zsh";
	src = builtins.fetchGit {
	  # Updated 2020-12-31
	  url = "https://github.com/momo-lab/zsh-abbrev-alias";
	  rev = "2f3d218f426aff21ac888217b0284a3a1470e274";
	};
      }
      {
	name = "zsh-colored-man-pages";
	file = "colored-man-pages.plugin.zsh";
	src = builtins.fetchGit {
	  url = "https://github.com/ael-code/zsh-colored-man-pages";
	  rev = "57bdda68e52a09075352b18fa3ca21abd31df4cb";
	};
      }
      {
	name = "zsh-fzf-tab";
	file = "fzf-tab.plugin.zsh";
	src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];
};

};
services.flatpak.enable = true;
}

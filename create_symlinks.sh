sudo rm /etc/nixos/configuration.nix
sudo ln -s ${PWD}/configuration.nix /etc/nixos/configuration.nix
sudo ln -s ${PWD}/my-config.nix /etc/nixos/my-config.nix
sudo nix-build

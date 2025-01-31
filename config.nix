{
  packageOverrides = pkgs: with pkgs; {
    devcontainer = pkgs.buildEnv {
      name = "devcontainer";
      paths = [
        neovim
        ripgrep
        fzf
        stow
      ];
    };
  };
}


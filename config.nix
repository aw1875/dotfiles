{
    packageOverrides = pkgs: with pkgs; {
        devcontainer = pkgs.buildEnv {
            name = "devcontainer";
            paths = [
                neovim
                fd
                ripgrep
                fzf
                stow
            ];
        };
    };
}


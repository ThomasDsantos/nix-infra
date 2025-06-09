{
  inputs,
  lib,
  config,
  ...
}:
{
  programs.git = {
    enable = true;
    userName = "Thomas Dos Santos";
    userEmail = "thomas.dssantos@gmail.com";
    
    signing = {
      key = "$(gpg --card-status | grep 'sec#' | sed -E 's/.*([A-F0-9]{16}) .*/\1/')";
      signByDefault = true;
    };


    extraConfig = {
      core = {
        editor = "vim";
        excludeFile = "~/.gitignore";
      };
      pull = {
        rebase = false;
      };
      url."ssh://git@github.com".insteadOf = "https://github.com/";
      init = {
        defaultBranch = "main";
      };
    };
  };
}


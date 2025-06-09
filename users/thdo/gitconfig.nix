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
      key = "A4407E174038FE38";
      signByDefault = true;
    };


    extraConfig = {
      core = {
        sshCommand = "ssh -o 'IdentitiesOnly=yes' -i ~/.ssh/notthebee";
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


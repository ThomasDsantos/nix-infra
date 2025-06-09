{
  config,
  inputs,
  pkgs,
  ...
}:
{
  nix.settings.trusted-users = [ "thdo" ];

  users = {
    users = {
      thdo = {
        shell = pkgs.zsh;
        uid = 1000;
        isNormalUser = true;
        password = "test";
        extraGroups = [
          "wheel"
          "users"
          "docker"
        ];
        group = "thdo";
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCmNaR51+JbvrIT96yyVO+sAsaFlhWu6rZAg8hLlIWztp3xhmhbQSz+B6rngu1NfnPjJfgGPwicsXswt3Lh9yOZ6Dhr+AiDKGbex0sV1uQMAvl12igT3OclEID9d/TQ2KffR29IKWzIXapbwEgPYktB4oVaZ1mNp3DKJg3TVWOHGB9MktN+UqPrfXtQWH70+T+p32YBjB4kpQigrGVX2Lte2ZiyPapbXFFMV3BGj4L1WEQkTzbDzdeGTH1hEZXFexE5hCYAPB8rHt4c3A7Yz+OO/TqfCZJhEauEqxuLa7FjlYPxrQbvqH9BNvoTH2y2P/R4MDF8gEhe4aqvCoCI8+n7qtUR4Gz9snVF5vEmDh8KswdkxjOG6VHkrzO4Xj5Zonxg40ZgX11N6vgNkzcNgdMkn7AehfaiWhC/dlAA+G851pDH8LTKVOPqfmINwJ1j8s4ysHZ/3J0CU1eJcLFc1KpbQfZ2Gt+wDeNdcZMzcUKXFmFPgpbPMhqmfSst94T5HChDufGSL4zHB1b8NF0MevVtwzZss8SDQBRkgEbvcs1y3s2HkOmmRXlx++6xlle4PltxwjPQAHKDjjHHTqg9o2QKb0VINPGSyYEsLXxT+wGMKy8arGYX4YolwWtWlWM5AeKhAyY1lM38N3Aa1tlH/YCnFmap3vT42olAh02vMriUqw== cardno:000609028969"
        ];
      };
    };
    groups = {
      thdo = {
        gid = 1000;
      };
    };
  };

  programs.zsh.enable = true;
}

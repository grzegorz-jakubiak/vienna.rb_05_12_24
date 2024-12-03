{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/packages/
  packages = [ pkgs.git ];

  languages.ruby = {
    enable = true;
    version = "3.3";
  };

  # See full reference at https://devenv.sh/reference/options/
}

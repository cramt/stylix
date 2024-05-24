{ config, lib, ... }:
let
  opacity = lib.strings.removePrefix "#" (lib.toHexString (builtins.ceil (config.stylix.opacity.applications * 255)));
  themeFile = (
    config.lib.stylix.colors // {
      opacity = opacity;
    }
  ) {
    template = ./template.mustache;
    extension = ".css";
  };
in
{
  options.stylix.targets.vesktop.enable = config.lib.stylix.mkEnableTarget "Vesktop" true;

  config = lib.mkIf config.stylix.targets.vesktop.enable {
    home.file."${config.xdg.configHome}/vesktop/themes/stylix.theme.css" = {
      source = themeFile;
    };
  };
}

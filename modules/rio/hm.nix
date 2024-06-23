# Documentation is available at:
# - https://raphamorim.io/rio/docs/next/configuration-file
{ config, lib, ... }:

let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  options.stylix.targets.rio.enable = config.lib.stylix.mkEnableTarget "Rio" true;

  config = lib.mkIf (config.stylix.enable && config.stylix.targets.rio.enable) {
    programs.rio.settings = {
      fonts = with config.stylix.fonts; {
        family = monospace.name;
        style = "normal";
        size = sizes.terminal;
      };
      window.opacity = with config.stylix.opacity; terminal;
      colors = with colors; {
        selection-background = base02;
        selection-foreground = base05;
        cursor = base05;
        tabs = base01;
        tabs-active = base02;
        background = base00;
        foreground = base05;
        black = base01;
        white = base06;
        red = base08;
        yellow = base09;
        green = base0B;
        cyan = base0C;
        blue = base0D;
        magenta = base0E;
        dim-foreground = base04;
        dim-white = base04;
        dim-black = base01;
        dim-yellow = base09;
        dim-green = base0B;
        dim-cyan = base0C;
        dim-blue = base0D;
        dim-magenta = base0E;
        dim-red = base0F;
        light-foreground = base07;
        light-white = base07;
        light-black = base02;
        light-red = base08;
        light-yellow = base0A;
        light-green = base0B;
        light-cyan = base0C;
        light-blue = base0D;
        light-magenta = base0E;
      };
    };
  };
}
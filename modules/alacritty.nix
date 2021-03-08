{ config, pkgs, lib, ... }:{
  # Alacritty
  programs.alacritty = {
    enable = true;
    settings = {

      scrolling.history = 10000;
      env.TERM = "xterm-256color";

      background_opacity = 0.85;
      window = {
        dimensions = {
          lines = 20;
          columns = 80;
        };
        padding = {
          x = 3;
          y = 3;
        };
      };
      cursor = {
        style = "Beam";
      };
    };
  };
}

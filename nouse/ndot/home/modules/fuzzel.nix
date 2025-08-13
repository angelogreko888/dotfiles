{
programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=13";
        dpi-aware = false;
        use-bold = true;
        icons-enabled = true;
        icon-theme = "buuf-nestort";
        terminal = "foot -e";
        x-margin = 20;
        y-margin = 20;
        horizontal-pad = 20;
        vertical-pad = 20;
        tabs = 4;
        inner-pad = 17;
        line-height = 25;
      };
      colors = {
        background = "000000ee";
        text = "f9f5d7ff";
        match = "563A9Cff";
        selection = "433D8Bff";
        selection-text = "FFE1FFff";
        selection-match = "8B5DFFff";
        border = "FFFFFFFF";
      };
      border = {
        width = 2;
        radius = 15;
      };
    };
  };
}

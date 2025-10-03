{
  pkgs,
  ...
}:
{
  programs.helix = {
  enable = true;
  defaultEditor = true;
  settings = {
    theme = "monokai_pro_octagon";
    editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
    editor.indent-guides = {
      render = true;
      character = "┆";
      skip-levels = 1;
    };
    editor ={
      auto-save = true;
      auto-format = true;
      mouse = false;
      bufferline = "multiple";
      cursorline = true;
      rulers = [80 120];
    };
  };
  languages.language = [{
    name = "nix";
    # auto-format = true;
    formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
  }];
};
}

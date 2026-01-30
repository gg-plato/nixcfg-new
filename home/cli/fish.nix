{
  pkgs,
  ...
}:

{
  programs.fish = {
      enable = true;
      interactiveShellInit = ''
        fish_config theme choose Dracula
        set -g fish_greeting

        # set -gx SSH_AUTH_SOCK "/run/user/1000/gcr/ssh"

        if test "$TERM" != "dumb"; and test "$TERM" != "linux"
          starship init fish | source
        end
      '';
    };
}

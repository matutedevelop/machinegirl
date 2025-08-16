{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.jump
      tmuxPlugins.rose-pine
    ];

    extraConfig = ''
      # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"


      # Mouse works as expected
      set-option -g mouse on
      # easy-to-remember split pane commands
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"
      # Toggle status bar visibility
      bind b run-shell "tmux setw -g status \$(tmux show -g -w status | grep -q off && echo on || echo off)"

      ##############################
      # NAVEGACIÓN DE PANELES (VIM) #
      ##############################
      bind h select-pane -L # Moverse al panel de la izquierda
      bind l select-pane -R # Moverse al panel de la derecha
      bind k select-pane -U # Moverse al panel de arriba
      bind j select-pane -D # Moverse al panel de abajo

      # Para redimensionar paneles con Vim bindings (opcional, pero muy útil)
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

          # Toggle terminal inferior con Ctrl-j
      bind -n C-j run-shell '
          if tmux list-panes -F "#{pane_title}" | grep -q "term-toggle"; then
            tmux kill-pane -t ":term-toggle"
          else
            tmux split-window -v -p 20 -c "#{pane_current_path}" bash
            tmux select-pane -T "term-toggle"
          fi

    '';
  };

  programs.tmate = {
    enable = true;
    # FIXME: This causes tmate to hang.
    # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
  };

}

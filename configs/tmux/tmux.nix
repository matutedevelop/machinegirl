{ pkgs, config, ... }:
{
  programs.tmux = {
    enable = true;
    shortcut = "Space";
    # aggressiveResize = true; -- Disabled to be iTerm-friendly
    baseIndex = 1;
    newSession = true;
    # Stop tmux+escape craziness.
    escapeTime = 0;
    # Force tmux to use /tmp for sockets (WSL2 compat)
    secureSocket = false;

    plugins = with pkgs.tmuxPlugins; [
      better-mouse-mode
      jump
      resurrect
      continuum
      tmux-fzf
      tmux-sessionx
    ];

    extraConfig = ''
              # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
              set -g default-terminal "xterm-256color"
              set -ga terminal-overrides ",*256col*:Tc"
              set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
              set-environment -g COLORTERM "truecolor"
              set -g set-clipboard on
              set -g mode-keys vi

              set -g @sessionx-bind 'o'
              set -g extended-keys on
              set -g extended-keys-format csi-u



              # Mouse works as expected
              set-option -g mouse on
              # easy-to-remember split pane commands
              bind | split-window -h -c "#{pane_current_path}"
              bind - split-window -v -c "#{pane_current_path}"
              bind c new-window -c "#{pane_current_path}"
              # Toggle status bar visibility
              bind b run-shell "tmux setw -g status \$(tmux show -g -w status | grep -q off && echo on || echo off)"

              # NAVEGACIÓN DE PANELES (VIM) #
              bind h select-pane -L # Moverse al panel de la izquierda
              bind l select-pane -R # Moverse al panel de la derecha
              bind k select-pane -U # Moverse al panel de arriba
              bind j select-pane -D # Moverse al panel de abajo

              # Para redimensionar paneles con Vim bindings (opcional, pero muy útil)
              bind -r H resize-pane -L 5
              bind -r J resize-pane -D 5
              bind -r K resize-pane -U 5
              bind -r L resize-pane -R 5





              bind-key -n 'C-\' run-shell -b "tmux-term-toggle a"
              bind-key -n 'C-/' run-shell -b "tmux-term-toggle"



              bind-key -T copy-mode-vi v send-keys -X begin-selection
              bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"



              bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
              bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
              bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
              bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"

              bind-key -n C-z resize-pane -Z


    '';
  };



  programs.tmate = {
    enable = true;
    # FIXME: This causes tmate to hang.
    # extraConfig = config.xdg.configFile."tmux/tmux.conf".text;
  };

}

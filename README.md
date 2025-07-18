# Dotfiles

Meant to be used with stow to create and manage the symbolic links

```bash
stow -v i3
stow -v bash
stow -v nvim
stow -v tmux
```

---

# TMUX

Requires `fzf` and `fd_find` for the provided scripts. The scripts are basically copies, with slight modifications, of Primagen's tmux-sessionizer and tmux-windowizer. Tmux-sessionizer expects the configuration file `$HOME/.config/tmux-sessionizer/config` which contains the folders you want to search and their depth.

Example:
```
# File: $HOME/.config/tmux-sessionizer/config
/home/name/dev/work:4
/home/name/dev/personal:1
```

Furthermore, if you want to run certain commands when starting a session then `$HOME/.config/tmux-sessionizer/*/session` the path with the `session` commands must mirror the path being opened in tmux. For example, if you are starting a tmux session with the path `$HOME/dev/work/tetris`, then the session file should be located at `$HOME/.config/tmux-sessionizer/dev/work/tetris/session`.

Example:
```
# File: $HOME/.config/tmux-sessionizer/dev/work/tetris/session

tmux-windowizer bash cd backend/tetris/
tmux-windowizer bash source ../.venv/bin/activate
tmux-windowizer bash nvim

tmux-windowizer backend cd backend/tetris/
tmux-windowizer backend uv run manage.py runserver

tmux-windowizer frontend cd frontend/tetris/
tmux-windowizer frontend npm run dev

tmux-windowizer tmp tmux join-pane -h -s frontend -t backend
tmux-windowizer tmp tmux rename-window -t backend server
tmux-windowizer tmp tmux rename-window -t bash nvim
tmux-windowizer tmp tmux kill-window -t tmp
```

The tmux-sessionizer script is for fixing the issue of running a command in a new window and then the window disappearing once the command ends. The first argument is the name of the tmux window and every argument after that is the command being run on that tmux window.

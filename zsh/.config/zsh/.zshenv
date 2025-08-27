export DOCKER_HOST="unix:///run/docker.sock"

. "$HOME/.cargo/env"

echo 'export ZDOTDIR="$HOME/.config/zsh"' > ~/.zshenv

export PATH=$PATH:/usr/local/go/bin

# fnm
FNM_PATH="/home/navaneet/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

export ZDOTDIR="$HOME/.config/zsh"



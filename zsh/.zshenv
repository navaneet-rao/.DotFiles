
export VISUAL=nvim
export EDITOR=nvim

# Created by `pipx` on 2024-09-30 17:17:56
export PATH="$PATH:/home/luke/.local/bin"
export PATH="$PATH:/home/luke/.local/share/bin"

export STARSHIP_CONFIG=~/.config/starship.toml
export STARSHIP_CACHE=~/.starship/cache

export RANGER_LOAD_DEFAULT_RC=FALSE

export DOCKER_HOST="unix:///run/docker.sock"
# export DOCKER_CONTEXT="unix:///home/luke/.docker/desktop/docker.sock"

# export QT_QPA_PLATFORM=wayland 
# export QT_STYLE_OVERRIDE=kvantum 
# export QT_SCALE_FACTOR=2.6 
# export ELM_SCALE=2.6 
# export GDK_SCALE=2.6 
# export SAL_USE_VCLPLUGIN=gtk3

export CURRENTWALL=$(swww query | grep "image" | awk -F'image: ' '{print $2}' | sed -n '2p')

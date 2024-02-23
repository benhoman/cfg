# Podman Doker
# systemctl --user enable --now podman.socket
export DOCKER_HOST=unix:///run/user/$UID/podman/podman.sock
alias docker="podman"


# Distrobox
alias db="distrobox-enter --name fedora-36"

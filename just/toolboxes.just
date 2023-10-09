# Create a Wolfi OS container | https://github.com/wolfi-dev
distrobox-wolfi:
    echo 'Creating WolfiOS distrobox ...'
    distrobox create --image ghcr.io/hirnidrin/wolfi-toolbox:latest -n wolfi

# Create a Wolfi OS container | https://github.com/wolfi-dev
distrobox-node18:
    echo 'Creating node18 distrobox ...'
    distrobox create --image ghcr.io/hirnidrin/node18-toolbox:latest -n node18

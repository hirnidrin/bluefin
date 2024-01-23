# Remove podman images with <none> in repository or tag field
podman-rmi-none:
    podman image ls | grep '<none>' | tr -s ' '  | cut --delim=' ' --fields=3 | xargs -r podman image rm

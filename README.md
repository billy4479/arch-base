# `arch-base` and `arch-base-standalone` OCI

This repo contains two images:

- `arch-base` (defined [here](./Dockerfile)) to be used with `distrobox`
- `arch-base-standalone` (defined [here](./Dockerfile.standalone)) to be as a standalone container

Use the standalone one when you don't want to share resources with the container.

## Build

- `arch-base`: build with `podman build -t arch-base .` and create distrobox container with `distrobox create <box name> -i arch-base`
- `arch-base-standalone`: build with `podman build -t arch-base-standalone . -f Dockerfile.standalone` N.B.: you still have to build `arch-base` first

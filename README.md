# zmk-config-dp [![.github/workflows/build.yml](https://github.com/howyi/zmk-config-dp/actions/workflows/build.yml/badge.svg)](https://github.com/howyi/zmk-config-dp/actions/workflows/build.yml)

## Setup project

1. Checkout this repository

   ```bash
   # run on host
   git clone https://github.com/howyi/zmk-config-dp.git /path/to/repo
   cd /path/to/repo
   ```

1. Write host UID and GID to `.env`

   ```bash
   # run on host /path/to/repo
   echo "HOST_UID=$(id -u)" >> .env
   echo "HOST_GID=$(id -g)" >> .env
   ```
1. Start devcontainer using VSCode

   > **Warning**  
   > Requires [Docker](https://www.docker.com/get-started) and [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).  
   > Check out the [VSCode documents](https://code.visualstudio.com/docs/devcontainers/containers).

1. Run setup commands on devcontainer

   ```bash
   # run on devcontainer /code
   make init
   ```

## Build firmware

> **Note**  
> Build artifacts are placed in `<PROJECT_ROOT>/artifacts/*.uf2`.

```bash
# run on devcontainer /code
make
```

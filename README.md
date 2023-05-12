# zmk-config-dp [![.github/workflows/build.yml](https://github.com/howyi/zmk-config-dp/actions/workflows/build.yml/badge.svg)](https://github.com/howyi/zmk-config-dp/actions/workflows/build.yml)

## Setup

```bash
# in Host
cp .env.example .env
echo "HOST_UID=$(id -u)" >> .env
echo "HOST_GID=$(id -g)" >> .env
```

```bash
# in Container
west init -l config
west update
west zephyr-export
```

## Build

```bash
make
```

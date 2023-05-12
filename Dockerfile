FROM zmkfirmware/zmk-build-arm:stable

ARG USER_UID=1000
ARG USER_GID=1000

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends sudo=* && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  useradd --shell /bin/bash --create-home --user-group nonroot && \
  usermod --non-unique --uid ${USER_UID} nonroot && \
  groupmod --non-unique --gid ${USER_GID} nonroot && \
  echo "nonroot ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/nonroot && \
  chmod 0440 /etc/sudoers.d/nonroot

RUN \
  install -o nonroot -g nonroot -d /code && \
  install -o nonroot -g nonroot -d /code/build && \
  install -o nonroot -g nonroot -d /code/modules && \
  install -o nonroot -g nonroot -d /code/zephyr && \
  install -o nonroot -g nonroot -d /code/zmk

USER nonroot
WORKDIR /code
ENTRYPOINT ["tail", "-F", "/dev/null"]

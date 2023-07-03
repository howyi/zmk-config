CONFIG_DIR := config
BOARD := seeeduino_xiao_ble
SHIELDS := dp1000_left dp1000_right
TARGETS := $(addprefix artifacts/, $(addsuffix .uf2, $(SHIELDS)))

.PHONY: all
all: clean $(TARGETS)

.PHONY: clean
clean:
	rm -rf artifacts

artifacts/%.uf2: artifacts
	west build -s zmk/app -b $(BOARD) -- -DZMK_CONFIG=$(PWD)/$(CONFIG_DIR) -DSHIELD=$*
	cp -f build/zephyr/zmk.uf2 $@

artifacts:
	mkdir -p artifacts

.west:
	west init -l $(CONFIG_DIR)

.PHONY: update-deps
update-deps:
	west update
	west zephyr-export

.PHONY: build_host
build_host:
	docker compose run --rm --entrypoint '' workspace make

.PHONY: init
init: .west update-deps

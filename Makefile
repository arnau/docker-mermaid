IMAGE ?= arnau/mermaid

TASK = docker run -it --rm

build:
	docker build -t $(IMAGE) .
.PHONY: build

rmi:
	docker rmi $(app_image)
.PHONY: rmi

shell:
	@$(TASK) -v $(PWD):/data \
           --entrypoint bash \
           $(IMAGE)
.PHONY: shell

help:
	@$(TASK) $(IMAGE)
.PHONY: help

IMAGE ?= arnau/mermaid

TASK = docker run -it --rm

mermaid = $(TASK) -v $(PWD)/build:/build \
                  -v $(PWD)/test:/data \
                  $(IMAGE) mermaid

build:
	docker build -t $(IMAGE) .
.PHONY: build

clean:
	docker rmi $(IMAGE)
.PHONY: clean

shell:
	@$(TASK) -v $(PWD):/data \
           $(IMAGE) bash
.PHONY: shell

help:
	@$(mermaid) mermaid --help
.PHONY: help

test:
	@$(mermaid) --png -o /data/ fixtures/sequence.mermaid
.PHONY: test

.PHONY: build rmo rmi shell

IMAGE ?= arnau/mermaid

images = `docker images -qf 'dangling=true'`

build :
	docker build -t $(IMAGE) .

rmo :
	docker rmi $$(docker images -qf 'dangling=true')

rmi :
	docker rmi $(app_image)

shell :
	docker run -it --rm \
		-w /data \
		-v $$(pwd):/data $(IMAGE) \
		bash

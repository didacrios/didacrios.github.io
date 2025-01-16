# Variables
JEKYLL_DOCKER_IMAGE = jekyll/jekyll:4.2.0

install:
	docker run --rm -v "$$(pwd):/srv/jekyll" $(JEKYLL_DOCKER_IMAGE) bundle install

serve:
	docker run --rm -v "$$(pwd):/srv/jekyll" -p 4000:4000 $(JEKYLL_DOCKER_IMAGE) jekyll serve --watch --force_polling

build:
	docker run --rm -v "$$(pwd):/srv/jekyll" $(JEKYLL_DOCKER_IMAGE) jekyll build

clean:
	docker run --rm -v "$$(pwd):/srv/jekyll" $(JEKYLL_DOCKER_IMAGE) jekyll clean

update:
	docker run --rm -v "$$(pwd):/srv/jekyll" $(JEKYLL_DOCKER_IMAGE) bundle update

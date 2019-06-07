RMD := $(shell find . -path "*/_posts/*.Rmd")
RMD += $(shell find . -path "*/_drafts/*.Rmd")
PORT ?= 4321
export GEM_HOME = ~/.gem

.PHONY: all clean

all: Gemfile.lock $(RMD:%.Rmd=%.md)
	bundle exec jekyll build --drafts --baseurl=/p/78120b81

Gemfile.lock:
	bundle install

%.md: %.Rmd | _data
	scripts/knit.R "$<" "$@"

_data:
	mkdir "$@"

clean:
	rm -rf _site

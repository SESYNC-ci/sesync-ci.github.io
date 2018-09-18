RMD := $(shell find _posts/ -name '*.Rmd')
PORT = 4321
export GEM_HOME = ~/.gem

.PHONY: all clean

all: Gemfile.lock $(RMD:%.Rmd=%.md)
	bundle exec jekyll build --drafts --baseurl=/p/$(PORT)

Gemfile.lock:
	bundle install

%.md: %.Rmd
	Rscript --vanilla -e "knitr::knit('$<', '$@')"

clean:
	rm -rf _site

REPO = https://github.com/Lysxia/coq-simple-io
TAG = master
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 -b $(TAG) $(REPO) $(WORKDIR)
	cp -r dune-files/ $(WORKDIR)


REPO = https://github.com/Lysxia/coq-simple-io
TAG = 1.3.0
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 --no-checkout -b $(TAG) $(REPO) $(WORKDIR)
	( cd $(WORKDIR) && git checkout $(TAG) )
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-simple-io

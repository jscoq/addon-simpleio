REPO = https://github.com/Lysxia/coq-simple-io
TAG = 1.6.0
WORKDIR = workdir

.PHONY: all get

CPPO=${shell cd $(WORKDIR) && find . -name '*.cppo'}

all: $(WORKDIR)
	make -C $(WORKDIR) $(CPPO:.cppo=)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --depth=1 --no-checkout -b $(TAG) $(REPO) $(WORKDIR)
	( cd $(WORKDIR) && git checkout $(TAG) )
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-simple-io

REPO = https://github.com/Lysxia/coq-simple-io
TAG = 1.7.0
COMMIT = 8c41bbe0909a1949a9f404ef964abbfeacd804ef
WORKDIR = workdir

# Git boilerplate
define GIT_CLONE_COMMIT
mkdir -p $(WORKDIR) && cd $(WORKDIR) && git init && \
git remote add origin $(REPO) && \
git fetch --depth=1 origin $(COMMIT) && git reset --hard FETCH_HEAD
endef
GIT_CLONE = ${if $(COMMIT), $(GIT_CLONE_COMMIT), git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)}

.PHONY: all get

CPPO=${shell cd $(WORKDIR) && find . -name '*.cppo'}

all: $(WORKDIR)
	make -C $(WORKDIR) $(CPPO:.cppo=)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	$(GIT_CLONE)

install:
	dune install coq-simple-io

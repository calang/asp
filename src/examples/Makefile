# Description

# variable definitions, available to all rules
#REPO_ROOT := $(shell git rev-parse --show-toplevel)  # root directory of this git repo
#BRANCH := $(shell git branch --show-current)
# BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
# Notes:
# all env variables are available
# = uses recursive substitution
# :=  uses immediate substitution


# target: help - Display callable targets.
help:
	@echo "Usage:  make <target>"
	@echo "  where <target> may be"
	@echo
	@egrep -h "^# target:" [Mm]akefile | sed -e 's/^# target: //'


# target: gcolor - solve graph coloring problem
gcolor:
	@echo
	@echo '--- Show problem grounding:'
	clingo --text g_coloring.lp || true
	@echo
	@echo '--- Show all solutions:'
	clingo g_coloring.lp 0 || true
	@echo
	@echo '--- Show 1 solution:'
	clingo g_coloring.lp || true

# target: jupl - start jupiter lab server
jupl:	ALWAYS
	#@${TF_SETENV}; jupyter lab &
	jupyter lab &


# target push - sample docker image push, asking for passwords
# push: TEMPUSR := $(shell mktemp)
# push:
#	@$$SHELL -i -c 'read -p "username: " user;  echo -n $${user} >$(TEMPUSR)'
#	@$$SHELL -i -c 'read -s -p "password: " user;  echo -n $${user} >$(TEMPUSR)1'
#	@docker login -u $$(cat $(TEMPUSR)) -p $$(cat $(TEMPUSR)1) amr-registry.caas.intel.com
#	docker image push ${APP_IMAGE}
#	@rm $(TEMPUSR)*

# 	@rm $(TEMPUSR)*

# ignore files with any of these names
# so that the rules with those as target are always executed
.PHONY: ALWAYS

# always do/refresh ALWAYS target
ALWAYS:

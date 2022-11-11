## This is the TZ new_pipeline:
## https://github.com/mac-theobio/rabiesTZ.git

current: target
-include target.mk
Ignore = target.mk

# -include makestuff/perl.def

vim_session:
	bash -cl "vmt"

######################################################################

p1:
	cp -r ../tz_pipeline $@ \
	|| git clone https://github.com/wzmli/rabies_db_pipeline $@

######################################################################

### Makestuff

Sources += Makefile README.md

Ignore += makestuff
msrepo = https://github.com/dushoff

Makefile: makestuff/00.stamp
makestuff/%.stamp:
	- $(RM) makestuff/*.stamp
	(cd makestuff && $(MAKE) pull) || git clone $(msrepo)/makestuff
	touch $@

-include makestuff/os.mk

## -include makestuff/pipeR.mk

-include makestuff/git.mk
-include makestuff/visual.mk

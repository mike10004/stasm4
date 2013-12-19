
MULTIARCH_TRIPLET = $(shell uname -m)-linux-gnu
DEB_HOST_MULTIARCH ?= $(MULTIARCH_TRIPLET)
PROJ_ROOT := projects/stasm4
DESTDIR ?= $(PROJ_ROOT)/dist/install
LIBDIR := $(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)
CONF := Release
include $(PROJ_ROOT)/nbproject/Makefile-variables.mk
INSTALL := $(shell which install)
MKDIR := mkdir
RM := rm

all:
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) build

clean:
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) clean
	rm -fr $(CURDIR)/nbproject

install: all
	$(MKDIR) -p $(LIBDIR)
	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_PATH_Release)

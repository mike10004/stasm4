#!/usr/bin/make

DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH)
PROJ_ROOT := projects/stasm4
MARKBIN_PROJ_ROOT := projects/stasmark
DESTDIR ?= $(PROJ_ROOT)/dist/install
LIBDIR := $(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)
BINDIR := $(DESTDIR)/usr/bin
MANDIR := $(DESTDIR)/usr/share/man/man1
CONF := Release
include $(PROJ_ROOT)/nbproject/Makefile-variables.mk
INSTALL := $(shell which install)
MKDIR := mkdir
RM := rm
HEADERS_DEST_DIR := $(DESTDIR)/usr/include
HERE := $(CURDIR)

all: build

build: build-libs build-markbin

build-libs:
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) build

build-markbin:
	"$(MAKE)" -C $(MARKBIN_PROJ_ROOT) CONF=$(CONF) build
	
clean-libs:	
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) clean
	$(RM) -rf $(PROJ_ROOT)/dist $(PROJ_ROOT)/build

clean-bins: clean-markbin

clean-markbin:
	"$(MAKE)" -C $(MARKBIN_PROJ_ROOT) CONF=$(CONF) clean
	$(RM) -rf $(MARKBIN_PROJ_ROOT)/dist $(MARKBIN_PROJ_ROOT)/build

clean: clean-libs clean-bins
	rm -fr $(CURDIR)/nbproject

install-headers:
	$(MKDIR) -p $(HEADERS_DEST_DIR)
	$(MKDIR) -p $(HEADERS_DEST_DIR)/MOD_1
	find stasm -type f -name "*.*h" -print0 | \
		xargs -0 cp --target $(HEADERS_DEST_DIR) --parents
	
install-shlibs: build-libs
	$(MKDIR) -p $(LIBDIR)
#	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so
	mv $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so.0
	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so.0
	ln -s libstasm4.so.0 $(LIBDIR)/libstasm4.so

install-stlibs: build-libs
	$(MKDIR) -p $(LIBDIR)
	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.a

install-markbin: build-markbin
	$(MKDIR) -p $(BINDIR)
	$(INSTALL) -t $(BINDIR) $(MARKBIN_PROJ_ROOT)/dist/Release/GNU-Linux-x86/stasmark

install-man:
	$(MKDIR) -p $(MANDIR)
	$(INSTALL) -t $(MANDIR) -m 0644 doc/stasmark.1

install-bins: install-markbin

install: all install-shlibs install-stlibs install-bins install-man install-headers
	

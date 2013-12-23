#!/usr/bin/make

DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH)
PROJ_ROOT := projects/stasm4
MARKBIN_PROJ_ROOT := projects/stasmark
DESTDIR ?= $(PROJ_ROOT)/dist/install
LIBDIR := $(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)
BINDIR := $(DESTDIR)/usr/bin
CONF := Release
include $(PROJ_ROOT)/nbproject/Makefile-variables.mk
INSTALL := $(shell which install)
MKDIR := mkdir
RM := rm
HEADERS_DEST_DIR := $(DESTDIR)/usr/include/stasm4
HERE := $(CURDIR)

all: build

build: build-libs build-markbin

build-libs:
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) build

build-markbin:
	"$(MAKE)" -C $(MARKBIN_PROJ_ROOT) CONF=$(CONF) build
	
clean-libs:	
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) clean

clean-bins: clean-markbin

clean-markbin:
	"$(MAKE)" -C $(MARKBIN_PROJ_ROOT) CONF=$(CONF) clean

clean: clean-libs clean-bins
	rm -fr $(CURDIR)/nbproject

install-headers:
	$(MKDIR) -p $(HEADERS_DEST_DIR)
	$(MKDIR) -p $(HEADERS_DEST_DIR)/MOD_1
	$(INSTALL) -t $(HEADERS_DEST_DIR) -m 0644 $(HERE)/stasm/*.h
	$(INSTALL) -t $(HEADERS_DEST_DIR)/MOD_1 -m 0644 $(HERE)/stasm/MOD_1/*.h
	
install-shlibs: build-libs
	$(MKDIR) -p $(LIBDIR)
#	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so
	cp $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so.0
	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.so.0
	ln -s libstasm4.so.0 $(LIBDIR)/libstasm4.so

install-stlibs: build-libs
	$(MKDIR) -p $(LIBDIR)
	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.a

install-markbin: build-markbin
	$(MKDIR) -p $(BINDIR)
	$(INSTALL) -t $(BINDIR) $(MARKBIN_PROJ_ROOT)/dist/Release/GNU-Linux-x86/stasmark

install-bins: install-markbin

install: all install-shlibs install-stlibs install-bins install-headers
	

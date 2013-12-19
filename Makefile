#!/usr/bin/make

DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH)
PROJ_ROOT := projects/stasm4
DESTDIR ?= $(PROJ_ROOT)/dist/install
LIBDIR := $(DESTDIR)/usr/lib/$(DEB_HOST_MULTIARCH)
CONF := Release
include $(PROJ_ROOT)/nbproject/Makefile-variables.mk
INSTALL := $(shell which install)
MKDIR := mkdir
RM := rm
HEADERS_DEST_DIR := $(DESTDIR)/usr/include/stasm4
HERE := $(CURDIR)

all: build

build:
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) build

clean:
	"$(MAKE)" -C $(PROJ_ROOT) CONF=$(CONF) clean
	rm -fr $(CURDIR)/nbproject

install-headers:
	$(MKDIR) -p $(HEADERS_DEST_DIR)
	$(MKDIR) -p $(HEADERS_DEST_DIR)/MOD_1
	$(INSTALL) -t $(HEADERS_DEST_DIR) -m 0644 $(HERE)/stasm/*.h
	$(INSTALL) -t $(HEADERS_DEST_DIR)/MOD_1 -m 0644 $(HERE)/stasm/MOD_1/*.h
	
install-shlibs:
	$(MKDIR) -p $(LIBDIR)
	$(INSTALL) -t $(LIBDIR) -m 0644 $(PROJ_ROOT)/$(CND_ARTIFACT_DIR_Release)/libstasm4.a

install-static:
	$(MKDIR) -p $(LIBDIR)
	$(INSTALL) -t $(LIBDIR) -m 0644 $(STLIBS_PROJ_ROOT)/dist/Release/GNU-Linux-x86

install: all install-shlibs install-headers
	

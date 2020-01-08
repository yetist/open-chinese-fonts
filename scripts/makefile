NAME = open-chinese-fonts

CONF =$(wildcard conf/*.conf)
CONFIG =$(notdir $(CONF))

DESTDIR := /
DEST_DIR = $(patsubst %/,%,$(DESTDIR))

all:
	@echo Please use the follow target:
	@echo make install [DEST_DIR=dir]
	@echo make uninstall [DEST_DIR=dir]

install:
	install -d $(DEST_DIR)/usr/share/doc/$(NAME)/
	install -d $(DEST_DIR)/etc/fonts/conf.avail/
	install -d $(DEST_DIR)/usr/share/fonts/$(NAME)/
	install -m644 -t $(DEST_DIR)/etc/fonts/conf.avail/ conf/$(CONFIG)
	install -m644 -t $(DEST_DIR)/usr/share/doc/$(NAME)/ licenses/*
	install -m644 -t $(DEST_DIR)/usr/share/fonts/$(NAME)/ fonts/*.ttf

uninstall:
	rm -rf $(DEST_DIR)/usr/share/doc/$(NAME)/
	rm -rf $(DEST_DIR)/usr/share/fonts/$(NAME)/
	rm -f $(DEST_DIR)/etc/fonts/conf.avail/$(CONFIG)

.PHONY: all install uninstall

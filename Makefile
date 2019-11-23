NAME = open-chinese-fonts
VERSION = $(shell date +%Y%m%d)

all: song.ttf kai.ttf fangsong.ttf hei.ttf song-bold.ttf hei-bold.ttf

song.ttf: raw/SourceHanSerifSC-Regular.otf
	ttx -o song.ttx $<
	patch -p1 -i patches/song-rename.patch
	ttx -o song.otf song.ttx
	python scripts/otf2ttf.py --overwrite song.otf

song-bold.ttf: raw/SourceHanSerifSC-Bold.otf
	ttx -o song-bold.ttx $<
	patch -p1 -i patches/song-bold-rename.patch
	ttx -o song-bold.otf song-bold.ttx
	python scripts/otf2ttf.py --overwrite song-bold.otf

kai.ttf: raw/FandolKai-Regular.otf
	ttx -o kai.ttx $<
	patch -p1 -i patches/fandolkai-rename-to-kai.patch
	ttx -o kai.otf kai.ttx
	python scripts/otf2ttf.py --overwrite kai.otf

fangsong.ttf:raw/FandolFang-Regular.otf
	ttx -o fangsong.ttx $<
	patch -p1 -i patches/fandolfang-rename-to-fangsong.patch
	ttx -o fangsong.otf fangsong.ttx
	python scripts/otf2ttf.py --overwrite fangsong.otf

hei.ttf: raw/SourceHanSansSC-Regular.otf
	ttx -o hei.ttx $<
	patch -p1 -i patches/hei-hhea.patch
	patch -p1 -i patches/hei-rename.patch
	ttx -o hei.otf hei.ttx
	python scripts/otf2ttf.py --overwrite hei.otf

hei-bold.ttf: raw/SourceHanSansSC-Bold.otf
	ttx -o hei-bold.ttx $<
	patch -p1 -i patches/hei-bold-hhea.patch
	patch -p1 -i patches/hei-bold-rename.patch
	ttx -o hei-bold.otf hei-bold.ttx
	python scripts/otf2ttf.py --overwrite hei-bold.otf

dist: song.ttf kai.ttf fangsong.ttf hei.ttf song-bold.ttf hei-bold.ttf
	rm -rf $(NAME)
	mkdir -p $(NAME)/{conf,fonts}
	cp conf/*.conf $(NAME)/conf
	cp *.ttf $(NAME)/fonts
	tar -Jcf $(NAME)-$(VERSION).tar.xz $(NAME)
	sha256sum $(NAME)-$(VERSION).tar.xz > $(NAME)-$(VERSION).tar.xz.sha256
	rm -rf $(NAME)

clean:
	rm -f *.ttx *.otf *.otf

.PHONY: all clean dist

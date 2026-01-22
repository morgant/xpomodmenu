MENUPROG = xpomodmenu
SERVERPROG = xpomodbell
TIMERPROG = xpomoinfo

PREFIX ?= /usr/local
BINDIR = $(DESTDIR)$(PREFIX)/bin
SHAREDIR = $(DESTDIR)$(PREFIX)/share
PIXMAPDIR = $(SHAREDIR)/pixmaps/$(MENUPROG)
SOUNDSDIR = $(SHAREDIR)/sounds/$(SERVERPROG)
MLVWMRCDIR = $(HOME)/.mlvwm

build: build-pixmap

build-pixmap:
	convert pixmap/control_play.{png,xpm}
	convert pixmap/control_play_blue.{png,xpm}
	convert pixmap/control_stop.{png,xpm}
	convert pixmap/control_stop_blue.{png,xpm}
	convert pixmap/error.{png,xpm}
	convert pixmap/hourglass.{png,xpm}
	convert pixmap/hourglass_go.{png,xpm}

install: build
	mkdir -p $(BINDIR)
	install -m 755 bin/$(MENUPROG) $(BINDIR)
	sed -i 's@pixmap/@$(PIXMAPDIR)/@g' $(BINDIR)/$(MENUPROG)
	install -m 755 bin/$(SERVERPROG) $(BINDIR)
	sed -i 's@sounds/@$(SOUNDSDIR)/@g' $(BINDIR)/$(SERVERPROG)
	install -m 755 bin/$(TIMERPROG) $(BINDIR)/$(TIMERPROG)
	mkdir -p $(PIXMAPDIR)
	find pixmap -type f -iname "*.xpm" -exec install -m 644 {} $(PIXMAPDIR) \;
	mkdir -p $(SOUNDSDIR)
	find sounds -type f -iname "*.wav" -exec install -m 644 {} $(SOUNDSDIR) \;

install-mlvwmrc-menuextra:
	mkdir -p $(MLVWMRCDIR)/pixmap
	cp pixmap/hourglass.xpm $(MLVWMRCDIR)/pixmap/$(TIMERPROG).xpm
	mkdir -p $(MLVWMRCDIR)/apps
	install .mlvwm/apps/$(TIMERPROG) $(MLVWMRCDIR)/apps
	mkdir -p $(MLVWMRCDIR)/MenuExtras
	install .mlvwm/MenuExtras/$(MENUPROG) $(MLVWMRCDIR)/MenuExtras
	sed -i 's@pixmap/@$(PIXMAPDIR)/@g' $(MLVWMRCDIR)/MenuExtras/$(MENUPROG)

uninstall:
	rm $(BINDIR)/$(MENUPROG)
	rm $(BINDIR)/$(SERVERPROG)
	rm $(BINDIR)/$(TIMERPROG)
	rm -r $(PIXMAPDIR)
	rm -r $(SOUNDSDIR)

uninstall-mlvwmrc-menuextra:
	rm $(MLVWMRCDIR)/pixmap/$(TIMERPROG).xpm
	rm $(MLVWMRCDIR)/apps/$(TIMERPROG)
	rm $(MLVWMRCDIR)/MenuExtras/$(MENUPROG)

clean: clean-pixmap

clean-pixmap:
	rm pixmap/*.xpm

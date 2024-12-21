MENUPROG = xpomodmenu
SERVERPROG = xpomodbell

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
	convert pixmap/time.{png,xpm}
	convert pixmap/time_go.{png,xpm}

install: build
	mkdir -p $(BINDIR)
	install -m 755 bin/$(MENUPROG) $(BINDIR)
	sed -i 's@pixmap/@$(PIXMAPDIR)/@g' $(BINDIR)/$(MENUPROG)
	install -m 755 bin/$(SERVERPROG) $(BINDIR)
	sed -i 's@sounds/@$(SOUNDSDIR)/@g' $(BINDIR)/$(SERVERPROG)
	mkdir -p $(PIXMAPDIR)
	cp -R pixmap/* $(PIXMAPDIR)/
	mkdir -p $(SOUNDSDIR)
	cp -R sounds/* $(SOUNDSDIR)/

install-mlvwmrc-menuextra:
	mkdir -p $(MLVWMRCDIR)/MenuExtras
	install .mlvwm/MenuExtras/$(MENUPROG) $(MLVWMRCDIR)/MenuExtras
	sed -i 's@pixmap/@$(PIXMAPDIR)/@g' $(MLVWMRCDIR)/MenuExtras/$(MENUPROG)

uninstall:
	rm $(BINDIR)/$(MENUPROG)
	rm $(BINDIR)/$(SERVERPROG)
	rm -r $(PIXMAPDIR)
	rm -r $(SOUNDSDIR)

uninstall-mlvwmrc-menuexra:
	rm $(MLVWMRCDIR)/MenuExtras/$(MENUPROG)

clean: clean-pixmap

clean-pixmap:
	rm pixmap/*.xpm

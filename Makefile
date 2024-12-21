PROG = xpomodmenu

PREFIX ?= /usr/local
BINDIR = $(DESTDIR)$(PREFIX)/bin
SHAREDIR = $(DESTDIR)$(PREFIX)/share
PIXMAPDIR = $(SHAREDIR)/pixmaps/$(PROG)
MLVWMRCDIR = $(HOME)/.mlvwm

build: build-pixmap

build-pixmap:
	convert pixmap/time.{png,xpm}
	convert pixmap/time_go.{png,xpm}
	convert pixmap/control_play.{png,xpm}
	convert pixmap/control_play_blue.{png,xpm}
	convert pixmap/control_stop.{png,xpm}
	convert pixmap/control_stop_blue.{png,xpm}

install: build
	mkdir -p $(BINDIR)
	install -m 755 bin/$(PROG) $(BINDIR)
	sed -i 's@pixmap/@$(PIXMAPDIR)/@g' $(BINDIR)/$(PROG)
	mkdir -p $(PIXMAPDIR)
	cp -R pixmap/* $(PIXMAPDIR)/

install-mlvwmrc-menuextra:
	mkdir -p $(MLVWMRCDIR)/MenuExtras
	install .mlvwm/MenuExtras/$(PROG) $(MLVWMRCDIR)/MenuExtras
	sed -i 's@pixmap/@$(PIXMAPDIR)/@g' $(MLVWMRCDIR)/MenuExtras/$(PROG)

uninstall:
	rm $(BINDIR)/$(PROG)
	rm -r $(PIXMAPDIR)

uninstall-mlvwmrc-menuexra:
	rm $(MLVWMRCDIR)/MenuExtras/$(PROG)

clean: clean-pixmap

clean-pixmap:
	rm pixmap/*.xpm

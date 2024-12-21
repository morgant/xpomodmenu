# xpomodmenu
by Morgan Aldridge <morgant@makkintosshu.com>

## OVERVIEW

A simple X11 menu utility to view & control Lucas de Sena's [pomod](https://github.com/phillbush/pomod/) pomodoro timer. It is powered by [wmlaunchbutton](https://github.com/phillbush/wmlaunchbutton) & [xmenu](https://github.com/phillbush/xmenu) and is intended for use with the [MLVWM](https://github.com/morgant/mlvwm) window manager, specifically the [mlvwmrc](https://github.com/morgant/mlvwmrc) configurations, as a "Menu Extra" swallowed into the menu bar.

## FEATURES

* Will launch `pomod` as a background task if not already running
* Shows the current state of `pomod` (configuration error, launching, or stopped)
* Shows the current timer cycle & elapsed time, when running
* Supports starting/stopping the current timer

## PREREQUISITES

* [pomod](https://github.com/phillbush/pomod)
* [wmlaunchbutton](https://github.com/phillbush/wmlaunchbutton)
* [xmenu](https://github.com/phillbush/xmenu)

## INSTALLATION

```
make && make install
```

### Menu Extra

Install the Menu Extra in your `~/.mlvwm/MenuExtras/` directory by running:

```
make install-mlvwmrc-menuextra
```

Then edit your `~.mlvwm/MenuBar` configuration file to add the following line in the appropriate "Menu Extras" section:

```
Read .mlvwm/MenuExtras/xpomodmenu
```

## USAGE

Run `xpomodmenu` or install the mlvwmrc Menu Extra as shown above.

## LICENSE

Mark James' [FamFamFam Silk Icons](https://github.com/markjames/famfamfam-silk-icons) licensed under the [Creative Commons Attribution 2.5 License](http://creativecommons.org/licenses/by/2.5/).

Released under the [MIT license](LICENSE).

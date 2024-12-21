# xpomodmenu
by Morgan Aldridge <morgant@makkintosshu.com>

## OVERVIEW

A minimal set of X11 utilities which interact with & control Lucas de Sena's [pomod](https://github.com/phillbush/pomod/) pomodoro timer server & client: `xpomodbell` & `xpomodmenu`. They are powered by several other tools by Lucas de Sena, including [wmlaunchbutton](https://github.com/phillbush/wmlaunchbutton) & [xmenu](https://github.com/phillbush/xmenu), plus [mpv](https://mpv.io) for audio playback. They are intended for use with the [MLVWM](https://github.com/morgant/mlvwm) window manager, specifically the [mlvwmrc](https://github.com/morgant/mlvwmrc) configurations, as a "Menu Extra" swallowed into the menu bar.

## FEATURES

* `xpomodbell`:
    * Launches `pomod` and monitors it for pomodoro cycle changes
    * Plays bell sounds at the start of a new cycle:
        * Three temple bells when beginning a pomodoro (focus)
        * A single temple bell when beginning a break (short or long)
* `xpomodmenu`:
    * Shows the current state of `pomod` (configuration error, stopped, or current pomodoro cycle)
    * Shows the elapsed time in the current pomodoro cycle
    * Supports starting/stopping the current pomodoro cycles
* mlvwmrc Menu Extra:
    * Provides an icon in the MLVWM menu bar which will show the `xpomodmenu` when clicked on

## PREREQUISITES

* [mpv](https://mpv.io)
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

### Starting the Bell Server

While you can just start the `xpomod` server directly and `xpomodmenu` will work with it, you'll want to start the bell server which will play a notification sound when starting a new pomodoro focus or break cycle. The bell server will start the `xpomod` server to monitor for pomodoro cycle changes:

```
xpomodbell
```

Since this is intended to be used with `mlvwmrc`, it's suggested that you add the following line to your `~/.mlvwm/.initrc` configuration:

```
Exec "xpomodbell" exec xpomodbell
```

### The Pomodoro Menu

You can manually execute `xpomodmenu` in any way you prefer, which will show the pomodoro menu at your cursor. These instructions assume you've installed the Menu Extra as described in the installation instructions and click on the icon in the MLVWM menu bar to open the menu.

__TBD__

## LICENSE

Mark James' [FamFamFam Silk Icons](https://github.com/markjames/famfamfam-silk-icons) licensed under the [Creative Commons Attribution 2.5 License](http://creativecommons.org/licenses/by/2.5/).

Keisu temple bell by milivolt -- https://freesound.org/s/367128/ -- License: Attribution 4.0

temple_bell_002.wav by tec_studio -- https://freesound.org/s/668647/ -- License: Creative Commons 0

Released under the [MIT license](LICENSE).

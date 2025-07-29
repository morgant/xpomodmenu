# CHANGELOG

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

_n/a_

## [0.3.1] - 2025-07-29

### Fixed:

* `xpomoinfo`:
    * Reduced flickering by using tput(1) to move cursor and write over window content instead of blanking entirely before redrawing

## [0.3.0] - 2025-01-06

### Added

* `xpomoinfo`:
    * Launches a floating showing:
        * Current pomodoro cycle in the window title
        * Elapsed time in the current cycle
* mlvwmrc Application Styles:
    * Added `xpomoinfo` application styles

### Fixed:

* `Makefile`: Corrected typo in `uninstall-mlvwmrc-menuextra` target name

### Changed:

* `xpomodmenu`:
    * Selecting the elapsed time in the current pomodor cycle now launches the new `xpomoinfo` status/timer window
* `Makefile`:
    * Installs & uninstalls new `xpomoinfo` utility
    * Installs & uninstalls `xpomoinfo` application icon & styles
* Updated README to document the new `xpomoinfo` status/timer window utility & installation
* Updated copyright years & this CHANGELOG

## [0.2.0] - 2024-12-27

### Added

* `xpomodbell`:
    * Added support for parsing arguments, including:
        * `-h` prints built-in help
        * `-v` enables verbose output (default: disabled)
        * `-V <volume>` sets audible bell playback volume (`0..100`; default: `100`)
        * `-p <minutes>` sets pomodoro work duration (default: `25`)
        * `-b <minutes>` sets short break duration (default: `5`)
        * `-B <minutes>` sets long break duration (default: `30`)
* Added CHANGELOG

### Changed

* Updated README to better format & link to licenses for included icons & sounds

## [0.1.0] - 2024-12-21

### Added

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

[unreleased]: https://github.com/morgant/xpomodmenu/compare/0.3.1...main
[0.3.1]: https://github.com/morgant/xpomodmenu/compare/0.3...0.3.1
[0.3.0]: https://github.com/morgant/xpomodmenu/compare/0.2...0.3
[0.2.0]: https://github.com/morgant/xpomodmenu/compare/0.1...0.2
[0.1.0]: https://github.com/morgant/xpomodmenu/releases/tag/0.1

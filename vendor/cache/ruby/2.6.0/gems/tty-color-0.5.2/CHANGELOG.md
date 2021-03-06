# Change log

## [v0.5.2] - 2020-08-09

### Changed
* Change gemspec and remove bundler as dev dependency
* Change TTY::Color::Support to define verbose as keyword argument

### Fix
* Fix gemspec metadata links by Igor Kapkov(@igas)

## [v0.5.1] - 2020-01-22

### Changed
* Change gemspec to add metadata and remove test artefacts

## [v0.5.0] - 2019-05-29

### Changed
* Change gemspec to load files without git
* Change to limit to Ruby >= 2.0.0

## [v0.4.3] - 2018-07-11

### Changed
* Change to use relative file paths
* Change to ensure immutable strings
* Change Color to use alias call

### Fixed
* Fix to support iTerm 2.app for 256 color mode detection by Michael Lang(@mwlang)

## [v0.4.2] - 2017-02-06

### Fixed
* Fix File namespaces

## [v0.4.1] - 2017-01-22

### Fixed
* Fix #windows? to reference top level constant

## [v0.4.0] - 2016-12-27

### Added
* Add #command? helper
* Add #windows? helper

### Changed
* Change to stop checking curses on Windows

### Fixed
* Fix Support#from_tput check to fail gracefully on non-unix systems
* Fix Mode#from_tput check to fail gracefuly on non-unix systems

## [v0.3.0] - 2016-01-13

### Fixed

* Fix #tty? check

## [v0.2.0] - 2016-01-13

### Changed

* Change ordering of color support checks by @janlelis
* Change ordering of color mode
* Change Support#from_env to check ansicon
* Ensure #tty? works for non-terminal devices
* Remove color executable

## [v0.1.0] - 2016-01-02

* Initial implementation and release

[v0.5.2]: https://github.com/piotrmurach/tty-color/compare/v0.5.1...v0.5.2
[v0.5.1]: https://github.com/piotrmurach/tty-color/compare/v0.5.0...v0.5.1
[v0.5.0]: https://github.com/piotrmurach/tty-color/compare/v0.4.3...v0.5.0
[v0.4.3]: https://github.com/piotrmurach/tty-color/compare/v0.4.2...v0.4.3
[v0.4.2]: https://github.com/piotrmurach/tty-color/compare/v0.4.1...v0.4.2
[v0.4.1]: https://github.com/piotrmurach/tty-color/compare/v0.4.0...v0.4.1
[v0.4.0]: https://github.com/piotrmurach/tty-color/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/piotrmurach/tty-color/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/piotrmurach/tty-color/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/piotrmurach/tty-color/compare/v0.1.0

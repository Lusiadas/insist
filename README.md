# insist

> A plugin for [Oh My Fish][omf-link].

[![GPL License](https://img.shields.io/badge/license-GPL-blue.svg?longCache=true&style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v2.7.1-blue.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-blue.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>

## Description

Repeat a command until it succeeds. If no command is provided, perform the previous command.

## Options

`-q/--quiet`

Suppress attempt count.

`-c/--continue`

Continue to repeat the command line input after it's successful.

`-i/--interval [seconds]`

Interval between attempts. It can be followed by a suffix: 's' for seconds (the default), 'm' for minutes, 'h' for hours and 'd' for days.

`-n/--attempts [number]`

Set a maximum number of repetitions.

`-h/--help`

Display these instructions

## Install

```fish
omf repositories add https://gitlab.com/argonautica/argonautica 
omf install insist
```

---

Ⓐ Made in Anarchy. No wage slaves were economically coerced into the making of this work.

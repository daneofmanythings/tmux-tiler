<div align='center'>

# tmux tiler

## Summary

enabling left stacking dynamic tyling for tmux

</div>

## Description

This plugin emulates a dynamic tiling window manager with the following format:

```
.____________________________________.
|          |                         |
|          |                         |
|   sub    |                         |
|          |                         |
|__________|                         |
|          |                         |
|          |                         |
|   sub    |          main           |
|          |                         |
|__________|                         |
|          |                         |
|    .     |                         |
|    .     |                         |
|    .     |                         | 

(The panes on the left auto scale height to be even)
```

It addss two commands:
- `tmux-tiler-open: <M-enter>`
- `tmux-tiler-close: <M-x>`

and one option that controls the default width of the main pane:
- `tmux-tiler-main-width: 60`

## Setup

Add this line to your tmux config file:
```
set -g @plugin 'https://github.com/daneofmanythings/tmux_tiler.git'
```

Then, reload your config with
```
<prefix>:source path/to/your/tmux.config
```
and install with `<prefix>I`

## Usage

###### NOTE: RE-BINDING THE COMMANDS AND OPTION IS CURRENTLY NOT IMPLEMENTED

Use the pane open and close commands as normal and enjoy the dynamic tiling!

## License

This project is licensed under the MiT license

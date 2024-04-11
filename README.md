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

# Tmux CPU and GPU status with nerd font support

Enables displaying CPU and GPU information in Tmux `status-right` and `status-left`.
Configurable percentage and icon display.

Based on the original tmux CPU program: https://github.com/tmux-plugins/tmux-cpu

### Manual Installation

Install Meslo LGS Nerd Font

https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/S

Clone the repo:

    $ git clone https://github.com/UltimateJupiter/tmux-cpu.git ~/.tmux-cpu

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/.tmux-cpu/cpu.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

If format strings are added to `status-right`, they should now be visible.

### Optional requirement (Linux, BSD, OSX)

`iostat` or `sar` are the best way to get an accurate CPU percentage.
A fallback is included using `ps -aux` but could be inaccurate.
`nvidia-smi` is required for GPU information.
For OSX, `cuda-smi` is required instead (but only shows GPU memory use rather
than load).

## Usage

Add any of the supported format strings (see below) to the existing `status-right` tmux option.
Example:

    # in .tmux.conf
    set -g status-right '#{cpu_fg_color} #{cpu_percentage} #{cpu_icon},'

### Supported Options

This is done by introducing 8 new format strings that can be added to
`status-right` option:

 - `#{cpu_icon}` - will display a CPU status icon
 - `#{cpu_percentage}` - will show CPU percentage (averaged across cores)
 - `#{cpu_bg_color}` - will change the background color based on the CPU percentage
 - `#{cpu_fg_color}` - will change the foreground color based on the CPU percentage

GPU equivalents also exist:

 - `#{gpu_icon}` - will display a GPU status icon
 - `#{gpu_percentage}` - will show GPU percentage (averaged across devices)
 - `#{gpu_bg_color}` - will change the background color based on the GPU percentage
 - `#{gpu_fg_color}` - will change the foreground color based on the GPU percentage

```
set -g @cpu_l0_icon "ᚋ"
set -g @cpu_l1_icon "ᚌ"
set -g @cpu_l2_icon "ᚍ"

set -g @cpu_l0_fg_color "#[fg=#00ff00]"
set -g @cpu_l1_fg_color "#[fg=#ffff00]"
set -g @cpu_l2_fg_color "#[fg=#ff0000]"
```

Don't forget to reload tmux environment (`$ tmux source-file ~/.tmux.conf`)
after you do this.

### License

[MIT](LICENSE.md)

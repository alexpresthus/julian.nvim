# julian.nvim

A personal nvim plugin for converting between Julian date and epoch timestamp.

Note that this plugin in written for me, for a custom use case, and is 
not intended for a general purpose. It is public in case it might prove helpful for 
anyone else struggling with the horrors of Julian date representations.

## Installation

- Neovim 0.7.0+ required
- Install using your favorite plugin manager
- Example using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
    "alexpresthus/julian.nvim"
}
```

## Setup (optional)

If you want to configure default keymaps, run `require'julian'.setup()`. Using [lazy.nvim](https://github.com/folke/lazy.nvim): 
```lua
{
    "alexpresthus/julian.nvim",
    opts = {}
}
```

This will configure the keymaps:
```lua
vim.keymap.set("n", "<leader>jdf", function()
    local julian_date = vim.fn.input("Enter Julian date: ")
    return M.julian_to_epoch(julian_date)
end)
vim.keymap.set("n", "<leader>jdt", function()
    local epoch_time = vim.fn.input("Enter epoch time: ")
    return M.epoch_to_julian(epoch_time)
end)
```

## Functions

### julian.julian_to_epoch
Converts a Julian date to an epoch timestamp (milliseconds).

```lua
require'julian'.julian_to_epoch(2460300)
```
```zsh
Julian: 2460300 -> Epoch: 1703160000000 
```

```lua
require'julian'.julian_to_epoch(2460368.365544)
```
```zsh
Julian: 2460368.365544 -> Epoch: 1709066783002
```

### julian.epoch_to_julian
Converts an epoch timestamp (milliseconds) to a Julian date.

```lua
require'julian'.epoch_to_julian(1709066783002)
```
```zsh
Epoch: 1709066783002 -> Julian: 2460368.365544
```


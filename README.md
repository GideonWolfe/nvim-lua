# My Neovim Config

My goal is to develop a personalized IDE like nvim experience that I can use for practically any application.

I attempted a similar thing prior to nvim 0.5, [vim.reaper](https://github.com/gideonwolfe/vim.reaper)


#  Structure

* `init.lua`: Much like the `init.vim` of my past config, this should basically "bootstrap" neovim into loading the correct configuration files with more specific settings.
* `lua/mappings.lua`: This should define **standard** vim keybinds such as window movement,navigation, etc.
* `lua/colors.lua`: Currently where I define all my highlight groups. I need to figure out a way to make themes look good consistently.
* `lua/plugins.lua`: My packer config that lists all the plugins I'm using
* `lua/settings.lua`: Basic vim settings. Tabs, numbers, etc.
* `lua/configs/*`: Configurations for a specific plugin, keybinds, etc.
* `lua/lsp/lsp-copnfig.lua`: Configuration for various LSPs.
* `lua/utils/*`: Various helper functions (like adding mapping functiions)

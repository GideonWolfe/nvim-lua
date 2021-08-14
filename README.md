# My Neovim Config

My goal is to develop a personalized IDE like nvim experience that I can use for practically any application.

I attempted a similar thing prior to nvim 0.5, [vim.reaper](https://github.com/gideonwolfe/vim.reaper)


#  Structure

* `init.lua`: Much like the `init.vim` of my past config, this should basically "bootstrap" neovim into loading the correct configuration files with more specific settings.
* `mappings.lua`: This should define **standard** vim keybinds such as window movement,navigation, etc.
* `colors.lua`: Currently where I define all my highlight groups. I need to figure out a way to make themes look good consistently.
* `plugins.lua`: My packer config that lists all the plugins I'm using
* `settings.lua`: Basic vim settings. Tabs, numbers, etc.
* `configs/*`: Configurations for a specific plugin, keybinds, etc.

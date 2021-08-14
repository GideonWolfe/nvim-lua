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


# Issues

When customizing to this extent, there's bound to be a few cracks in the cement. Here is where I plan to list the things currently bothering me and that I'd love help with!

If this gets extensive enough I might move it to "Issues" or "Project" but we'll see.
G

## error when no autocomplete is available

When I'm simply typing in insert mode, the `Pmenu` automatically pops up with suggestions as I type, which it should.

However If I **don't** select an option, and instead finish my word and press space, I get a  `Pattern not found` error.

![animation](https://user-images.githubusercontent.com/32942052/129457282-fe5031c9-f004-4721-8082-593fef102ddf.gif)

I suspect this might have something to do with my [autocomplete mappings](https://github.com/GideonWolfe/nvim-lua/blob/5f0435084fd4e36ff6a5d570b25f4740a74460ca/lua/mappings.lua#L107)

## Pmenu borders

This is something I've wanted for *ages*, but I still don't know if it's possible. Add a border around the default `Pmenu`?

I like having it the same color as the background, which *can* get a bit hard to see with lots of text around.

My function signature and documentation windows all have borders, any way I can get the pmenu to follow suite?


## Horizontal line split

I've managed to change the `VertSplit` highlight group to look semi decent and just a thin line. Can I replicate this behavior with a horizontally split window? 

![](https://i.imgur.com/CiDG6UP.png)

I know the status
bar is at the bottom of the active window, but I would like a visual separator.


## Pmenu kind labels

I'm using the `lsp-kind` plugin to declare some nice symbols for my suggestions.

I'm not sure which fonts I'm missing to make this look right, but these are the default symbols.

![](https://i.imgur.com/00Y3hFf.png)
(`lsp-config.lua`)


![](https://i.imgur.com/wGGJRbl.png)
(`compe.lua`)

It just looks really hacky. I'd like to get rid of all the extra spacing, and the unnecessary helper text like `[Spell]`.

![](https://i.imgur.com/0KPE8ni.png)

What settings do I have to change to make this look nice?


## Dashboard line numbers

![](https://i.imgur.com/pz33wnV.png)

I've looked around at many configs and tried the autocommand on the nvim.dashboard github, but I can't get line numbers to hide on the dashboard


## LSP install

I understand that the `:LspInstall` command was removed from neovim, but I don't understand why.

One of the benefits of `coc-nvim` was being able to `CocInstall` practically any language. I know that the `LspInstall` command has been re-implimented by others, but is this
recommended?

I'm unsure of the viability of relying on a bunch of random scripts, but I also don't wanna manually do it every time I need to set up a language. Stuff like python is easy but I
don't even want to try getting the `lua` language server up and running.

## Load NvimTree on directory open

I'm not sure how to accomplish this but ideally when `nvim` was called with a directory as an argument, `NvimTree` should automatically be open so I can select a file.

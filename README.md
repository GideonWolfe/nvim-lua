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


# Telescope preview line numbers

This must have something to do with the inability to disable line numbers on the dashboard. Is my autocommand overwriting or something?

![](https://i.imgur.com/2rlPDgS.png)





# mappings

For brevity, `<Leader>` has been abbreviated to `<L>`

| Action                                       | Key      |
|----------------------------------------------|----------|
| Hop to word                                  | <L>hw    |
| Hop to char                                  | <L>hc    |
| Hop to line                                  | <L>hl    |
| Wrap pair around word                        | <A>e     |
| Telescope: Next Item                         | <Ctrl>n  |
| Telescope: Prev Item                         | <Ctrl>p  |
| Telescope: Next Item (normal mode)           | j        |
| Telescope: Prev Item (normal mode)           | k        |
| Telescope: High/Mid/Low (normal mode)        | H/M/L    |
| Telescope: Top/Bottom (normal mode)          | gg/G     |
| Telescope: Open file in split                | <Ctrl>x  |
| Telescope: Open file in vsplit               | <Ctrl>v  |
| Telescope: Open file in new tab              | <Ctrl>t  |
| Telescope: Scroll up in preview              | <Ctrl>u  |
| Telescope: Scroll down in preview            | <Ctrl>d  |
| Telescope: Toggle selection and move to next | <Tab>    |
| Telescope: Close Telescope                   | <Ctrl>c  |
| Telescope: Close Telescope (normal mode)     | <Esc>    |
| Telescope: Git branches                      | <L>gbr   |
| Telescope: Git buffer commits (checkout)     | <L>gbc   |
| Telescope: Git commits (checkout)            | <L>gbo   |
| Telescope: List builtin telescope modules    | <L>tbi   |
| Telescope: Find LSP definitions              | <L>fd    |
| Telescope: Find LSP implementations          | <L>fi    |
| Telescope: Find LSP code actions             | <L>ca    |
| Telescope: Find LSP symbols in workspace     | <L>fws   |
| Telescope: Find LSP symbols in document      | <L>fs    |
| Telescope: Find LSP references under cursor  | <L>fr    |
| Telescope: Show keymaps                      | <L>fkm   |
| Telescope: Suggest spelling                  | <L>ss    |
| Telescope: List quickfixes                   | <L>qf    |
| Telescope: Find vim command                  | <L>fvc   |
| Telescope: Search vim help                   | <L>fvh   |
| Telescope: Search man pages                  | <L>fmp   |
| Telescope: Find word (live grep)             | <L>fw    |
| Telescope: File browser                      | <L>fb    |
| Telescope: File browser                      | <L>fb    |
| Telescope: Find git files                    | <L>fgf   |
| Telescope: Find media files                  | <L>fmf   |
| Telescope: Find media files                  | <L>ff    |
| Toggle table mode                            | <L>tm    |
| Enter buffer picking mode                    | <Ctrl>p  |
| Close buffer                                 | <Alt>c   |
| Goto buffer (1-9)                            | <Alt><#> |
| Move to buffer left                          | <Alt>,   |
| Move to buffer right                         | <Alt>.   |
| Move buffer left                             | <Alt>>   |
| Move buffer right                            | <Alt>.   |
| Move cursor to left pane                     | <Ctrl>h  |
| Move cursor to right pane                    | <Ctrl>l  |
| Move cursor to top pane                      | <Ctrl>k  |
| Move cursor to bottom pane                   | <Ctrl>j  |
| Comment increase level (normal mode)         | <L>cic   |
| Comment line motion (normal mode) (ci4j)     | <L>ci    |
| Comment increase level (visual mode)         | <L>cic   |
| Comment decrease level (visual mode)         | <L>cd    |
| Uncomment line motion (normal mode) (cd4j)   | <L>cd    |
| Show TODO window                             | <L>td    |
| TODO: Open TODO in new split                 | <Ctrl>x  |
| TODO: Open TODO in new vsplit                | <Ctrl>xv |
| TODO: Open TODO in new tab                   | <Ctrl>t  |
| TODO: Jump to TODO and close list            | o        |
| TODO: Bring up TODO message in popup         | K        |
| TODO: Toggle auto preview in popup           | P        |
| TODO: Manually preview                       | p        |
| TODO: Close all folds                        | zm       |
| TODO: Open all folds                         | zr       |
| TODO: Toggle folds                           | za       |
| TODO: Close TODO window                      | q        |
| Toggle Trouble window                        | <L>tr    |
| Trouble: Open trouble in new split           | <Ctrl>x  |
| Trouble: Open trouble in new vsplit          | <Ctrl>xv |
| Trouble: Open trouble in new tab             | <Ctrl>t  |
| Trouble: Jump to trouble and close list      | o        |
| Trouble: Bring up trouble message in popup   | K        |
| Trouble: Toggle auto preview in popup        | P        |
| Trouble: Manually preview                    | p        |
| Trouble: Close all folds                     | zm       |
| Trouble: Open all folds                      | zr       |
| Trouble: Toggle folds                        | za       |
| Open file tree (nvimtree)                    | <L>nt    |
| NvimTree: Open in vsplit                     | <Ctrl>v  |
| NvimTree: Open in split                      | <Ctrl>x  |
| NvimTree: Open in new tab                    | <Ctrl>t  |
| NvimTree: Copy file                          | c        |
| NvimTree: Cut file                           | c        |
| NvimTree: Paste file                         | p        |
| NvimTree: Rename file                        | r        |
| NvimTree: Copy filename                      | y        |
| NvimTree: Copy path                          | Y        |
| NvimTree: Copy absolute path                 | gy       |
| NvimTree: Close                              | q        |
| Symbol Outline: Toggle                       | `<L>so`  |


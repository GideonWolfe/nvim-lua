local present, luasnip = pcall(require, "luasnip")
if not present then
    return
end

-- https://github.com/L3MON4D3/LuaSnip/issues/103
--require'compe'.register_source('luasnip', require'compe_luasnip')

luasnip.config.set_config(
    {
        history = true,
        updateevents = "TextChanged,TextChangedI"
    }
)
require("luasnip/loaders/from_vscode").load()

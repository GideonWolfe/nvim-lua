local status, autopairs = pcall(require, "nvim-autopairs")

if not status then
	return
end

autopairs.setup({
  fast_wrap = {
    chars = { '{', '[', '(', '"', "'", "`" },
  },
})

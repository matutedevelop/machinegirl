vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

-- othr opts

vim.opt.relativenumber = true
vim.opt.number = true


-- Rust

vim.lsp.inlay_hint.enable(true, { bufnr = 0 })
vim.keymap.set("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)


vim.keymap.set("n", "<leader>rt", function()
  vim.lsp.buf.code_action({
    filter = function(action)
      return action.title:match("explicit type")
    end,
    apply = true,
  })
end)


vim.keymap.set("n", "T", vim.lsp.buf.hover)

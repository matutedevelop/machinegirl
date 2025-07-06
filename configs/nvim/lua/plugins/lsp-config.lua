return {

    "neovim/nvim-lspconfig",
    config = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})

    -- Bindings

    vim.keymap.set('n','<C-k>',vim.lsp.buf.hover,{noremap=true, silent=true})







    lspconfig.pylsp.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
        plugins = {
            black = { enabled = true },
            isort = { enabled = true },
            -- flake8 = { enabled = true }, -- Si lo tienes instalado
            -- pylint = { enabled = true }, -- Si lo tienes instalado
        },
        },
    },
    })




    lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {

    ["rust-analyzer"] = {
    check = {
    command = "clippy",
    extraArgs = { "--", "-Dwarnings" },
                },
            },
        },
    })

            
    end






}

return {

    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },

    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    -- REQUIRED - you must specify a snippet engine
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.


                        -- For `mini.snippets` users:
                        -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
                        -- insert({ body = args.body }) -- Insert at cursor
                        -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
                        -- require("cmp.config").set_onetime({ sources = {} })
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                    ["<Tab>"] = cmp.mapping.select_next_item(),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),

                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    -- { name = "vsnip" }, -- For vsnip users.
                    { name = "luasnip" }, -- For luasnip users.
                    -- { name = 'ultisnips' }, -- For ultisnips users.
                    -- { name = 'snippy' }, -- For snippy users.
                }, {
                    { name = "buffer" },
                }),
            })

            -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
            -- Set configuration for specific filetype.
            --[[ cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
     })
     require("cmp_git").setup() ]]
            --

            -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        end,
    },
}

-- source Lazy site

-- return {
--  "hrsh7th/nvim-cmp",
--  version = false, -- last release is way too old
--  event = "InsertEnter",
--  dependencies = {
--    "hrsh7th/cmp-nvim-lsp",
--    "hrsh7th/cmp-buffer",
--    "hrsh7th/cmp-path",
--  },
--  -- Not all LSP servers add brackets when completing a function.
--  -- To better deal with this, LazyVim adds a custom option to cmp,
--  -- that you can configure. For example:
--  --
--  -- ```lua
--  -- opts = {
--  --   auto_brackets = { "python" }
--  -- }
--  -- ```
--  opts = function()
--    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
--    local cmp = require("cmp")
--    local defaults = require("cmp.config.default")()
--    local auto_select = true
--    return {
--      auto_brackets = {}, -- configure any filetype to auto add brackets
--      completion = {
--        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
--      },
--      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
--      mapping = cmp.mapping.preset.insert({
--        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--        ["<C-f>"] = cmp.mapping.scroll_docs(4),
--        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
--        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
--        ["<C-Space>"] = cmp.mapping.complete(),
--        ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
--        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
--        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--        ["<C-CR>"] = function(fallback)
--          cmp.abort()
--          fallback()
--        end,
--        ["<tab>"] = function(fallback)
--          return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
--        end,
--      }),
--      sources = cmp.config.sources({
--        { name = "lazydev" },
--        { name = "nvim_lsp" },
--        { name = "path" },
--      }, {
--        { name = "buffer" },
--      }),
--      formatting = {
--        format = function(entry, item)
--          local icons = LazyVim.config.icons.kinds
--          if icons[item.kind] then
--            item.kind = icons[item.kind] .. item.kind
--          end
--
--          local widths = {
--            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
--            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
--          }
--
--          for key, width in pairs(widths) do
--            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
--              item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
--            end
--          end
--
--          return item
--        end,
--      },
--      experimental = {
--        -- only show ghost text when we show ai completions
--        ghost_text = vim.g.ai_cmp and {
--          hl_group = "CmpGhostText",
--        } or false,
--      },
--      sorting = defaults.sorting,
--    }
--  end,
--  main = "lazyvim.util.cmp",
-- }

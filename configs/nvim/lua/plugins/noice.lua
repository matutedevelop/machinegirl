return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        require("noice").setup({
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = false,
            },
        })
    end,
}

-- return {
-- 	"folke/noice.nvim",
-- 	event = "VeryLazy",
-- 	dependencies = {
-- 		"MunifTanjim/nui.nvim",
-- 		"rcarriga/nvim-notify",
-- 	},
-- 	config = function()
-- 		require("noice").setup({
--
-- 			lsp = {
-- 				override = {
-- 					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
-- 					["vim.lsp.util.stylize_markdown"] = true,
-- 					["cmp.entry.get_documentation"] = true,
-- 				},
--
-- 				hover = { enabled = true },
-- 				signature = { enabled = true },
-- 			},
--
-- 			-- views = {
-- 			-- 	hover = {
-- 			-- 		position = { row = "100%", col = 0 },
-- 			-- 		size = { width = "100%", height = "auto" },
-- 			-- 		border = { style = "none" },
-- 			-- 	},
-- 			-- },
-- 			--
--
-- 			views = {
-- 				hover = {
-- 					relative = "editor",
-- 					position = { row = "100%", col = 0 },
-- 					size = { width = "100%", height = "auto" },
-- 					border = { style = "none" },
-- 				},
-- 			},
--
-- 			presets = {
-- 				bottom_search = true,
-- 				command_palette = true,
-- 				long_message_to_split = true,
-- 				inc_rename = false,
-- 				lsp_doc_border = false,
-- 			},
-- 		})
-- 	end,
-- }

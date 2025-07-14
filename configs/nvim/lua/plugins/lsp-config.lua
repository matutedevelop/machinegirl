return {

	"neovim/nvim-lspconfig",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "Acciones LSP",
			callback = function()
				local bufmap = function(mode, lhs, rhs)
					local opts = { buffer = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- Muestra información sobre símbolo debajo del cursor
				bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.hover()<cr>")

				-- Saltar a definición
				bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")

				-- Saltar a declaración
				bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")

				-- Mostrar implementaciones
				bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")

				-- Saltar a definición de tipo
				bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")

				-- Listar referencias
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

				-- Mostrar argumentos de función
				bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

				-- Renombrar símbolo
				bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")

				-- Listar "code actions" disponibles en la posición del cursor
				bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>")

				-- Mostrar diagnósticos de la línea actual
				-- bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

				-- Saltar al diagnóstico anterior
				bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")

				-- Saltar al siguiente diagnóstico
				bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
			end,
		})
		-- Variable para saber si los diagnostics están activos o no
		local diagnostics_active = true

		vim.keymap.set("n", "<leader>td", function()
			diagnostics_active = not diagnostics_active
			if diagnostics_active then
				vim.diagnostic.enable()
				print("Diagnostics ENABLED")
			else
				vim.diagnostic.disable()
				print("Diagnostics DISABLED")
			end
		end, { desc = "Toggle diagnostics" })

		-- deprecated
		--        local function on_attach(client,bufnr)
		--	      local opts = { noremap = true, silent = true, buffer = bufnr }
		--
		--
		--
		--
		--        ---- Bindings
		--
		--        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		--        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		--        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		--        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		--        vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
		--        vim.keymap.set('n', '<C-h>', vim.lsp.buf.signature_help, opts)
		--        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
		--        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		--
		--
		--
		--        -- Diagnósticos
		--        vim.keymap.set('n', 'd', vim.diagnostic.goto_next, opts)
		--        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
		--        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)
		--    end
		-- Linter mas wonito

		-- Configuración de diagnósticos para mejor visualización
		vim.diagnostic.config({
			virtual_text = {
				prefix = "●", -- Cambia el prefijo de los diagnósticos
				source = "always",
			},
			float = {
				source = "always",
				border = "rounded",
			},
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
		})

		-- Iconos personalizados para diagnósticos
		local signs = {
			Error = "󰅚 ",
			Warn = "󰀪 ",
			Hint = "󰌶 ",
			Info = "󰋽 ",
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		lspconfig.ruff.setup({})
		lspconfig.pyright.setup({
			settings = {
				python = {
					analysis = {
						ignore = { "*" }, -- Using Ruff
					},
				},
			},
		})

		--		lspconfig.pylsp.setup({
		--			on_attach = on_attach,
		--			capabilities = capabilities,
		--			settings = {
		--				pylsp = {
		--					plugins = {
		--						-- Deshabilita Black e Isort de pylsp si Ruff o none-ls los manejan
		--						black = { enabled = false }, -- Ruff también formatea
		--						isort = { enabled = false }, -- Ruff también ordena imports
		--						-- Puedes dejar otros linters aquí si los quieres DE pylsp,
		--						-- por ejemplo si tienes 'flake8' o 'pylint' y quieres usarlos con pylsp
		--						-- flake8 = { enabled = true },
		--						-- pylint = { enabled = true },
		--					},
		--				},
		--			},
		--		})
		--
		--Para Lua (lua-language-server)
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					---- Importante para `neodev.nvim` para que Lua_LS entienda el API de Neovim
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			settings = {

				["rust-analyzer"] = {
					check = {
						command = "clippy",
						extraArgs = { "--", "-Dwarnings" },
					},
					cargo = {
						allFeatures = true,
					},
					procMacro = {
						enable = true,
					},
				},
			},
		})
	end,
}

local M = {
	"neovim/nvim-lspconfig",
	lazy = false,
	event = { "BufReadPre" },
	dependencies = {
		{
			"hrsh7th/cmp-nvim-lsp",
		},
		{
			"folke/neodev.nvim",
		},
		{
			"ray-x/lsp_signature.nvim",
			event = "VeryLazy",
			opts = {
				select_signature_key = "<M-n>",
				toggle_key = "<M-x>",
				toggle_key_flip_floatwin_setting = true,
				floating_window = true,
				floating_window_above_cur_line = true,
				floating_window_off_x = 0,
				handler_opts = {
					border = "none", -- double, rounded, single, shadow, none
				},
				doc_lines = 0,
				hint_enable = false,
				hint_prefix = " ",
			},
			config = function(_, opts)
				require("lsp_signature").setup(opts)
			end,
		},
	},
}

function normal_opts(desc)
	local opts = {
		noremap = true,
		silent = true,
		desc = desc,
	}
	return opts
end

function M.config()
	-- have to setup neodev before lspconfig
	require("neodev").setup({})

	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

	local function lsp_keymaps(bufnr)
		local keymap = vim.api.nvim_buf_set_keymap
		keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", normal_opts("Declaration"))
		keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", normal_opts("Definition"))
		keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", normal_opts("Hover"))
		keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", normal_opts("Implementation"))
		keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", normal_opts("References"))
		keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", normal_opts("Line diagnostic"))
		keymap(bufnr, "n", "<M-j>", "<cmd>lua vim.diagnostic.goto_next()<cr>", normal_opts("Next diagnostic"))
		keymap(bufnr, "n", "<M-k>", "<cmd>lua vim.diagnostic.goto_next()<cr>", normal_opts("Previous diagnostic"))
	end

	local lspconfig = require("lspconfig")
	local on_attach = function(client, bufnr)
		lsp_keymaps(bufnr)
		if client.server_capabilities.inlayHintProvider then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
		else
			local cfg = require("lsp_signature").config
			require("lsp_signature").on_attach(cfg, bufnr)
		end
	end

	local venv_path = os.getenv("VIRTUAL_ENV")
	local pyexe = nil
	if venv_path ~= nil then
		pyexe = venv_path .. "/bin/python3"
	else
		pyexe = vim.g.python3_host_prog
	end
	local servers = {
		lua_ls = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				completion = { callSnippet = "Replace" },
			},
		},
		pylsp = {
			pylsp = {
				plugins = {
					-- pylsp_mypy = {
					-- 	overrides = { "--python-executable", pyexe, true },
					-- },
					pycodestyle = {
						ignore = { "E501", "W503" },
					},
					black = {
						line_length = 80,
					},
				},
			},
		},
		gopls = {
			gopls = {
				["ui.completion.usePlaceholders"] = true,
			},
		},
		gdscript = {
			gdscript = {
				-- tcp = '127.0.0.1:6005'
			},
		},
	}

	for name, settings in pairs(servers) do
		lspconfig[name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = settings,
		})
	end

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = false,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
			-- suffix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

return M

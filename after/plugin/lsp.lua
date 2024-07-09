local lsp_zero = require("lsp-zero")
local cmp = require("cmp")
local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities.textDocument.completion.completionItem.snippetSupport = true
custom_capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
custom_capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
custom_capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
custom_capabilities.textDocument.completion.completionItem.deprecatedSupport = true
custom_capabilities.textDocument.completion.completionItem.preselectSupport = true
custom_capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
custom_capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		["<Return>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ select = true })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<C-Down>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<C-Up>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
    window = {
        completion = {
            border = "double",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
        documentation = {
            border = "double",
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            preset = "codicons",
            maxwidth = 50,
            ellipsis_char = '...',
            show_labelDetails = true,
            before = function (entry, vim_item)
                return vim_item
            end
        })
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
    callback = function(event)
		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", { buffer = event.buf })
		vim.keymap.set("n", "<C-d>", "<cmd>lua vim.lsp.buf.definition()<cr>", { buffer = event.buf })
		vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.lsp.buf.openfloat()<cr>", { buffer = event.buf })
		vim.keymap.set("n", "<leader>[d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { buffer = event.buf })
		vim.keymap.set("n", "<leader>]d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { buffer = event.buf })
	end,
})


vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
})

--[[
vim.diagnostic.config({
	signs = {
		error = "✗",
		warn = "⚠️",
		hint = "",
		info = "i",
	},
	float = {
		source = "always",
	},
})
]]--



lspconfig.pyright.setup({ capabilities = custom_capabilities })
lspconfig.rust_analyzer.setup({ capabilities = custom_capabilities })
lspconfig.clangd.setup({ capabilities = custom_capabilities })
lspconfig.eslint.setup({ capabilities = custom_capabilities })
lspconfig.markdown_oxide.setup({ capabilities = custom_capabilities })
lspconfig.vimls.setup({ capabilities = custom_capabilities })
lspconfig.fortls.setup({ capabilities = custom_capabilities })
lspconfig.gopls.setup({ capabilities = custom_capabilities })
lspconfig.lua_ls.setup({ capabilities = custom_capabilities })
lspconfig.html.setup({ capabilites = custom_capabilities })
require("typescript-tools").setup({ capabilites = custom_capabilities })


lspconfig.lua_ls.setup({
    capabilities = custom_capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

lsp_zero.setup({})


return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"python",      -- Main programming language
				"html",        -- HTML for web templates
				"css",         -- CSS for styling (optional for backend but useful for templates)
				"javascript",  -- JavaScript for client-side interactions
				"json",        -- JSON for configuration and data interchange
				"yaml",        -- YAML for configuration files
				"sql",         -- SQL for database interactions
				"markdown",    -- Markdown for documentation
				"dockerfile",  -- Dockerfile syntax for containerization
				"bash",        -- Bash for scripting and automation
				"gitignore",   -- Gitignore syntax
				"xml",         -- XML for data interchange (if needed)
				"typescript",
			},

			-- matchup = {
			-- 	enable = true,
			-- },

			-- https://github.com/nvim-treesitter/playground#query-linter
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},

			playground = {
				enable = true,
				disable = {},
				updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
				persist_queries = true, -- Whether the query persists across vim sessions
				keybindings = {
					toggle_query_editor = "o",
					toggle_hl_groups = "i",
					toggle_injected_languages = "t",
					toggle_anonymous_nodes = "a",
					toggle_language_display = "I",
					focus_language = "f",
					unfocus_language = "F",
					update = "R",
					goto_node = "<cr>",
					show_help = "?",
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			-- MDX
			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})
			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
	-- Add Pyright as a language server for Python
    	{
		"neovim/nvim-lspconfig",
		config = function()
	    	require('lspconfig').pyright.setup{}
		end,
    	},
}

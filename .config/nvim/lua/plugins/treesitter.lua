return {
	{ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
        "javascript",
        "typescript",
        "tsx",
        "html",
        "vue",
        "css",
        "scss",
        "json",
				"lua",
				"fish",
				"gitignore",
				"graphql",
				"http",
        "markdown",
        "markdown_inline",
        "vim",
        "bash",
        "yaml",
			},
			-- https://github.com/nvim-treesitter/playground#query-linter
			query_linter = {
				enable = true,
				use_virtual_text = true,
				lint_events = { "BufWrite", "CursorHold" },
			},
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-i>',
          node_incremental = '<c-i>',
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
            ['ii'] = '@conditional.inner',
            ['ai'] = '@conditional.outer',
            ['il'] = '@loop.inner',
            ['al'] = '@loop.outer',
            ['at'] = '@comment.outer',
         }
        }
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
        -- goto_next = {
        --   [']i'] = "@conditional.inner",
        -- },
        -- goto_previous = {
        --   ['[i'] = "@conditional.inner",
        -- }
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
}

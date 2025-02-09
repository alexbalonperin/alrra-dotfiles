-------------------------------------------------------------------------------
-- These are example settings to use with nvim-metals and the nvim built-in
-- LSP. Be sure to thoroughly read the `:help nvim-metals` docs to get an
-- idea of what everything does. Again, these are meant to serve as an example.
-- If you just copy pasta them, they should work, but hopefully after time
-- goes on you'll cater them to your own liking especially since some of the stuff
-- in here is just an example, not what you probably want your setup to be.
--
-- Unfamiliar with Lua and Neovim?
--  - Check out `:help lua-guide`
--
-- The below configuration also makes use of the following plugins besides
-- nvim-metals, and therefore is a bit opinionated:
--
-- - https://github.com/hrsh7th/nvim-cmp
--   - hrsh7th/cmp-nvim-lsp for lsp completion sources
--   - hrsh7th/cmp-vsnip for snippet sources
--   - hrsh7th/vim-vsnip for snippet sources
--
-- - https://github.com/folke/lazy.nvim for package management
-- - https://github.com/mfussenegger/nvim-dap (for debugging)
-------------------------------------------------------------------------------
local map = vim.keymap.set
local fn = vim.fn

----------------------------------
-- OPTIONS -----------------------
----------------------------------
-- global
vim.g.mapleader = ","       -- Character for <leader>
vim.g.encoding="utf-8"      -- The encoding displayed.
vim.g.fileencoding="utf-8"  -- The encoding written to file.
vim.opt_global.shortmess:remove("F")
vim.opt.completeopt = { "menuone", "noinsert", "noselect" }
vim.opt.hidden=true     -- Hide files when leaving them.
vim.opt.number=true     -- Show line numbers.
vim.opt.numberwidth=1   -- Minimum line number column width.
vim.opt.cmdheight=2     -- Number of screen lines to use for the commandline.
vim.opt.textwidth=0     -- Lines length limit (0 if no limit).
vim.opt.linebreak=true  -- Don't cut lines in the middle of a word .
vim.opt.showmatch=true  -- Shows matching parenthesis.
vim.opt.matchtime=2     -- Time during which the matching parenthesis is shown.
vim.opt.cursorline=true -- Highlight line cursor is currently on
vim.opt.autoread=true   -- Automatically re-read files that have been modified outside vim
vim.opt.incsearch=true  -- Incremental search.
vim.opt.ignorecase=true -- Case insensitive.
vim.opt.smartcase=true  -- Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
vim.opt.updatetime=300  -- Smaller updatetime for CursorHold & CursorHoldI
vim.opt.laststatus = 3  -- views can only be fully collapsed with the global statusline

vim.opt.formatoptions={ j = true, t = true, c = true, r = true, q = true } -- Sensible default line auto cutting and formatting.
--vim.opt.background="dark"             -- Color adapted to dark background.
vim.opt.clipboard="unnamedplus"       -- Copy/Paste to/from clipboard
vim.opt.listchars = {
  space = '',
  tab = '▶▶',
  trail = '·',
  eol = '↵'
} -- Invisible characters representation when :set list.

-- TODO: fix these
--vim.g.nowrapscan=true -- Don't go back to first match after the last match is found.
--vim.g.nofoldenable=true -- disable folding

-- Fold
--set foldmethod=syntax
--set foldlevelstart=0

-- Indentation
vim.opt.autoindent=true
vim.opt.smartindent=true

-- Tabs
vim.opt.expandtab=true -- Tab transformed in spaces
vim.opt.tabstop=2      -- Sets tab character to correspond to x columns.
-- x spaces are automatically converted to <tab>.
-- If expandtab option is on each <tab> character is converted to x spaces.
vim.opt.softtabstop=2 -- column offset when PRESSING the tab key or the backspace key.
vim.opt.shiftwidth=2  -- column offset when using keys '>' and '<' in normal mode.

-- MAPPINGS
vim.opt.timeoutlen=300 -- time in milliseconds that is waited for the next mapping key

-- Handle window actions with Meta instead of <C-w>
-- Switching
vim.keymap.set('n', '<M-h>', '<C-w>h')
vim.keymap.set('n', '<M-j>', '<C-w>j')
vim.keymap.set('n', '<M-k>', '<C-w>k')
vim.keymap.set('n', '<M-l>', '<C-w>l')

-- Moving
vim.keymap.set('n', '<M-H>', '<C-w>H')
vim.keymap.set('n', '<M-J>', '<C-w>J')
vim.keymap.set('n', '<M-K>', '<C-w>K')
vim.keymap.set('n', '<M-L>', '<C-w>L')
vim.keymap.set('n', '<M-x>', '<C-w>x')

-- Resizing
vim.keymap.set('n', '<S-=>', '<C-w>=')
vim.keymap.set('n', '<S-Up>', '<C-w>10+')
vim.keymap.set('n', '<S-Down>', '<C-w>10-')
vim.keymap.set('n', '<S-Left>', '<C-w>10<')
vim.keymap.set('n', '<S-Right>', '<C-w>10>')

-- Creating
vim.keymap.set('n', '<leader>n', '<C-w>n')
vim.keymap.set('n', '<leader>h', '<C-w>s')
vim.keymap.set('n', '<leader>v', '<C-w>v')
vim.keymap.set('n', '<M-]>', '<C-w>g<C-]>')

-- Closing
vim.keymap.set('n', '<M-c>', '<C-w>c')
vim.keymap.set('n', '<M-o>', '<C-w>o')

-- Quickfix
vim.keymap.set('n', '<M-Enter>', '<C-w><CR>')

-- Switch between buffers
vim.keymap.set('n', '<C-l>', ':bn<CR>')
vim.keymap.set('n', '<C-h>', ':bp<CR>')
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>')

-- Quickfix list
vim.keymap.set('n', '<leader>q', ':copen<CR>', { silent = true })
vim.keymap.set('n', '<S-l>', ':cprevious<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', ':cnext<CR>', { silent = true })

-- Move to next fold
vim.keymap.set('n', '<C-k>', 'zk')
vim.keymap.set('n', '<C-j>', 'zj')

-- More/Less foldlevel
vim.keymap.set('n', '<M-r>', 'zr')
vim.keymap.set('n', '<M-e>', 'zm')

-- Remove search highlighting
vim.keymap.set('n', '<leader>,', ':nohlsearch<CR>', { silent = true })

-- Clear command line
vim.keymap.set('n', '<C-\\>', ':<BS>')

-- Redraws the screen
vim.keymap.set('n', '<space>d', ':redraw!<CR>')

-- Toggle display of tabs and EOF
vim.keymap.set('n', '<leader>l', ':set list!<CR>')

-- Modify init.vim easily
vim.keymap.set('n', '<leader>ev', ':edit $MYVIMRC<CR>')
vim.keymap.set('n', '<leader>sv', ':source $MYVIMRC<CR>')

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

----------------------------------
-- INSTALL LAZY ------------------
----------------------------------
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

----------------------------------
-- PLUGINS -----------------------
----------------------------------
require("lazy").setup({
  {
    "yetone/avante.nvim",
    enabled = true,
    event = "VeryLazy",
    lazy = false,
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = "ollama",
      vendors = {
        ollama = {
          __inherited_from = "openai",
          api_key_name = "",
          endpoint = "http://127.0.0.1:11434/v1",
          model = "codellama:13b",
          disable_tools = true,
        },
      },
      -- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
      -- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
      -- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
      auto_suggestions_provider = "ollama",
      behaviour = {
        auto_suggestions = false, -- Experimental stage
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
      },
      mappings = {
        --- @class AvanteConflictMappings
        diff = {
          ours = "co",
          theirs = "ct",
          all_theirs = "ca",
          both = "cb",
          cursor = "cc",
          next = "]x",
          prev = "[x",
        },
        suggestion = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      hints = { enabled = true },
      windows = {
        ---@type "right" | "left" | "top" | "bottom"
        position = "right", -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 30, -- default % based on available width
        sidebar_header = {
          enabled = true, -- true, false to enable/disable the header
          align = "center", -- left, center, right for title
          rounded = true,
        },
        input = {
          prefix = "> ",
          height = 8, -- Height of the input window in vertical layout
        },
        edit = {
          border = "rounded",
          start_insert = true, -- Start insert mode when opening the edit window
        },
        ask = {
          floating = false, -- Open the 'AvanteAsk' prompt in a floating window
          start_insert = true, -- Start insert mode when opening the ask window
          border = "rounded",
          ---@type "ours" | "theirs"
          focus_on_apply = "ours", -- which diff to focus after applying
        },
      },
      highlights = {
        ---@type AvanteConflictHighlights
        diff = {
          current = "DiffText",
          incoming = "DiffAdd",
        },
      },
      --- @class AvanteConflictUserConfig
      diff = {
        autojump = true,
        ---@type string | fun(): any
        list_opener = "copen",
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
      },
      suggestion = {
        debounce = 600,
        throttle = 600,
      },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local mason_lsp = require('mason-lspconfig')
      mason_lsp.setup({
        ensure_installed = {
          'bashls',
          'cssls',
          'eslint',
          'html',
          'jsonls',
          'lua_ls',
          'pyright',
          'rust_analyzer',
          'sqlls',
          -- managed by typescript-tools
          'ts_ls',
        },
        automatic_installation = true,
      })
      mason_lsp.setup_handlers({
        -- default setup for all servers (without a key)
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,
       -- LSP specific handlers
        ['ts_ls'] = function()
          -- do nothing, managed by typescript-tools
        end
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" }
    },
    opts = function()
      local cmp = require("cmp")
      local conf = {
        sources = {
          { name = "nvim_lsp" },
          { name = "vsnip" },
        },
        snippet = {
          expand = function(args)
            -- Comes from vsnip
            fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          -- None of this made sense to me when first looking into this since there
          -- is no vim docs, but you can't have select = true here _unless_ you are
          -- also using the snippet stuff. So keep in mind that if you remove
          -- snippets you need to remove this select
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          -- I use tabs... some say you should stick to ins-completion but this is just here as an example
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        }),
      }
      return conf
    end
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "mfussenegger/nvim-dap",
        config = function(self, opts)
          -- Debug settings if you're using nvim-dap
          local dap = require("dap")

          dap.configurations.scala = {
            {
              type = "scala",
              request = "launch",
              name = "RunOrTest",
              metals = {
                runType = "runOrTestFile",
                --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
              },
            },
            {
              type = "scala",
              request = "launch",
              name = "Test Target",
              metals = {
                runType = "testTarget",
              },
            },
          }
        end
      },
    },
    ft = { "scala", "sbt", "java" },
    opts = function()
      local metals_config = require("metals").bare_config()

      -- Example of settings
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }

      -- *READ THIS*
      -- I *highly* recommend setting statusBarProvider to true, however if you do,
      -- you *have* to have a setting to display this in your statusline or else
      -- you'll not see any messages from metals. There is more info in the help
      -- docs about this
      metals_config.init_options.statusBarProvider = "on"

      -- Example if you are using cmp how to make sure the correct capabilities for snippets are set
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()

        -- LSP mappings
        map("n", "gd", require("fzf-lua").lsp_definitions)
        map("n", "K", require("fzf-lua").lsp_typedefs)
        map("n", "gi", require("fzf-lua").lsp_implementations)
        map("n", "gr", require("fzf-lua").lsp_references)
        map("n", "gds", require("fzf-lua").lsp_document_symbols)
        map("n", "gws", require("fzf-lua").lsp_workspace_symbols)
        map("n", "<leader>cl", vim.lsp.codelens.run)
        map("n", "<leader>sh", vim.lsp.buf.signature_help)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        map("n", "<leader>fo", vim.lsp.buf.format)
        map("n", "<leader>ca", require("fzf-lua").lsp_code_actions)

        --map("n", "<leader>ws", function()
        --  require("metals").hover_worksheet()
        --end)

        -- all workspace diagnostics
        map("n", "<space>a", vim.diagnostic.setqflist)

        -- all workspace errors
        map("n", "<leader>ae", function()
          vim.diagnostic.setqflist({ severity = "E" })
        end)

        -- all workspace warnings
        map("n", "<leader>aw", function()
          vim.diagnostic.setqflist({ severity = "W" })
        end)

        -- buffer diagnostics only
        map("n", "<leader>d", vim.diagnostic.setloclist)

        map("n", "[c", function()
          vim.diagnostic.goto_prev({ wrap = false })
        end)

        map("n", "]c", function()
          vim.diagnostic.goto_next({ wrap = false })
        end)

        -- Example mappings for usage with nvim-dap. If you don't use that, you can
        -- skip these
        map("n", "<leader>dc", function()
          require("dap").continue()
        end)

        map("n", "<leader>dr", function()
          require("dap").repl.toggle()
        end)

        map("n", "<leader>dK", function()
          require("dap.ui.widgets").hover()
        end)

        map("n", "<leader>dt", function()
          require("dap").toggle_breakpoint()
        end)

        map("n", "<leader>dso", function()
          require("dap").step_over()
        end)

        map("n", "<leader>dsi", function()
          require("dap").step_into()
        end)

        map("n", "<leader>dl", function()
          require("dap").run_last()
        end)
      end

      return metals_config
    end,
    config = function(self, metals_config)
      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = self.ft,
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end
  },
  { "junegunn/fzf", build = "./install --bin" },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})

      map('n', '<leader>ss', ':FzfLua live_grep<CR>')
      map('n', ':Ag', ':FzfLua live_grep<CR>')
      map('n', '<leader>sr', ':FzfLua live_grep_resume<CR>')
      map('n', '<leader>sf', ':FzfLua files<CR>')
    end
  },
  { "nelstrom/vim-visual-star-search" },
  {
    "scrooloose/nerdtree",
    config = function()
      map('n', '<leader>t', ':NERDTreeToggle<CR>')
      map('n', '<leader>f', ':NERDTreeFind <CR>')
    end
  },
  {'sjl/gundo.vim'},
  {
    'tpope/vim-fugitive',
    config = function()
      map('n', '<leader>d', ':Gdiffsplit<cr>')
      map('n', '<leader>v', ':Gvsplit<cr>')
      map('n', '<leader>h', ':Gsplit<cr>')
      map('n', '<leader>g', ':Git<cr>')
      map('n', '<leader>gl', ':Git l<cr>')
    end
  },
  {'tpope/vim-repeat'},
  {'tpope/vim-surround'},
  {
    'nvim-lualine/lualine.nvim',
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require('lualine').setup {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {
              statusline = {},
              winbar = {},
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = false,
            refresh = {
              statusline = 1000,
              tabline = 1000,
              winbar = 1000,
            }
          },
          sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename', 'lsp_progress'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
          tabline = {},
          winbar = {},
          inactive_winbar = {},
          extensions = {}
      }
    end
  },
  {'tpope/vim-abolish'},
  {'dense-analysis/ale'}, -- Manages js/ts linting through the .eslintrc.js or tslint.json file
  {'hashivim/vim-terraform'},
  --{'leafgarland/typescript-vim'},
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "heex", "javascript", "html", "scala", "java", "typescript", "hcl", "css", "dockerfile", "git_config", "graphql", "jq", "lua", "sql", "yaml", "json", "markdown" },
          sync_install = false,
          highlight = {
            enable = true,
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
          indent = { enable = true },
        })
    end
  },
  {
      -- See other themes at https://github.com/rockerBOO/awesome-neovim?tab=readme-ov-file#tree-sitter-supported-colorscheme
      "marko-cerovac/material.nvim",
      priority = 100,
      config = function()
          vim.cmd([[colorscheme material]])
      end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup {
        on_attach = function(client, bufnr)
          local opts = { buffer = bufnr }

          map("n", "gd", vim.lsp.buf.definition, opts)
          map("n", "K", vim.lsp.buf.hover, opts)
          map("n", "gi", vim.lsp.buf.implementation, opts)
          map("n", "gr", vim.lsp.buf.references, opts)
          map("n", "<leader>ds", vim.lsp.buf.document_symbol, opts)
          map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
          map("n", "<leader>cl", vim.lsp.codelens.run, opts)
          map("n", "<leader>sh", vim.lsp.buf.signature_help, opts)
          map("n", "<leader>rn", vim.lsp.buf.rename, opts)
          map("n", "<leader>o", vim.lsp.buf.format)
          map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          map("n", "go", ":TSToolsOrganizeImports<CR>", opts)
          --map("n", "gd", "<CMD>TSToolsGoToSourceDefinition<CR>", opts)
          --map("n", "gr", "<CMD>TSToolsFileReferences<CR>", opts)
          map("n", "gn", ":TSToolsRenameFile<CR>", opts)
          map("n", "gf", ":TSToolsFixAll<CR>", opts)
          --map("n", "gi", "<CMD>TSToolsAddMissingImports<CR>", opts)
          --map("n", "go", "<CMD>TSToolsOrganizeImports<CR>", opts)
        end,
        handlers = {
           -- List of error codes can be found here: https://github.com/microsoft/TypeScript/blob/v4.7.3/src/compiler/diagnosticMessages.json
           ["textDocument/publishDiagnostics"] = require("typescript-tools.api").filter_diagnostics(
            {
              -- 95114  -- Add all missing return statement
            }
           ),
        },
        settings = {
          -- spawn additional tsserver instance to calculate diagnostics on it
          separate_diagnostic_server = true,
          -- "change"|"insert_leave" determine when the client asks the server about diagnostic
          publish_diagnostic_on = "insert_leave",
          -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
          -- "remove_unused_imports"|"organize_imports") -- or string "all"
          -- to include all supported code actions
          -- specify commands exposed as code_actions
          expose_as_code_action = {},
          -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
          -- not exists then standard path resolution strategy is applied
          tsserver_path = nil,
          -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
          -- (see 💅 `styled-components` support section)
          tsserver_plugins = {},
          -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
          -- memory limit in megabytes or "auto"(basically no limit)
          tsserver_max_memory = "auto",
          -- described below
          tsserver_format_options = {},
          tsserver_file_preferences = {},
          -- locale of all tsserver messages, supported locales you can find here:
          -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
          tsserver_locale = "en",
          -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
          complete_function_calls = false,
          include_completions_with_insert_text = true,
          -- CodeLens
          -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
          -- possible values: ("off"|"all"|"implementations_only"|"references_only")
          code_lens = "off",
          -- by default code lenses are displayed on all referencable values and for some of you it can
          -- be too much this option reduce count of them by removing member references from lenses
          disable_member_code_lens = true,
          -- JSXCloseTag
          -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-auto-tag,
          -- that maybe have a conflict if enable this feature. )
          jsx_close_tag = {
              enable = false,
              filetypes = { "javascriptreact", "typescriptreact" },
          }
        },
      }
    end
  },
  {
    "j-hui/fidget.nvim",
    tag = "v1.2.0",
    opts = {
      -- options
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = { enabled = false },
        suggestion = { enabled = false },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 18.x
        server_opts_overrides = {},
      })
    end,
  },
  {
      "hrsh7th/nvim-cmp",
      config = function()
          local cmp = require'cmp'
          --   פּ ﯟ   some other good icons
          local kind_icons = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            Field = "",
            Variable = "",
            Class = "",
            Interface = "",
            Module = "",
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
            Copilot = "",
          }
          -- find more here: https://www.nerdfonts.com/cheat-sheet
          cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'copilot', index = 2 },
            }, {
              { name = 'buffer' },
            }),
            formatting = {
              fields = { "kind", "abbr", "menu" },
              format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
                vim_item.menu = ({
                  nvim_lsp = "[LSP]",
                  luasnip = "[Snippet]",
                  buffer = "[Buffer]",
                  path = "[Path]",
                  copilot = "[Copilot]",
                })[entry.source.name]
                return vim_item
              end,
            },
        })
      end,
  },
  {
      "zbirenbaum/copilot-cmp",
      config = function()
          require("copilot_cmp").setup({})
      end,
  },
})


vim.g.ale_lsp_show_message_severity="disabled"  -- Ale errors

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

vim.opt.formatoptions={ j = true, t = true, c = true, r = true, q = true } -- Sensible default line auto cutting and formatting.
--vim.opt.background="dark"             -- Color adapted to dark background.
vim.opt.clipboard="unnamedplus"       -- Copy/Paste to/from clipboard
vim.opt.listchars = {
  space = '',
  tab = '▶▶',
  trail = '·',
  eol = '↵'
} -- Invisible characters representation when :set list.
vim.g.nowrapscan=true -- Don't go back to first match after the last match is found.
vim.g.nofoldenable=true -- disable folding

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
vim.keymap.set('n', '<M-=>', '<C-w>=')
vim.keymap.set('n', '<M-+>', '<C-w>10+')
vim.keymap.set('n', '<M-_>', '<C-w>10-')
vim.keymap.set('n', '<M-<>', '<C-w>10<')
vim.keymap.set('n', '<M->>', '<C-w>10>')

-- Creating
vim.keymap.set('n', '<M-n>', '<C-w>n')
vim.keymap.set('n', '<M-s>', '<C-w>s')
vim.keymap.set('n', '<M-v>', '<C-w>v')
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

-- Remove trailing whitespace
-- use of '<silent>' to hide what would be output on the command line
-- use of ':silent!' to hide error message when pattern is not found

vim.keymap.set('n', '<leader>w', ":silent! execute '/\\v( )+$'<CR>")
vim.keymap.set('n', '<leader>W', ':silent! execute \'%substitute/\v( )+$//\'<CR>')

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
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "K", vim.lsp.buf.hover)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gds", vim.lsp.buf.document_symbol)
        map("n", "gws", vim.lsp.buf.workspace_symbol)
        map("n", "<leader>cl", vim.lsp.codelens.run)
        map("n", "<leader>sh", vim.lsp.buf.signature_help)
        map("n", "<leader>rn", vim.lsp.buf.rename)
        --map("n", "<leader>f", vim.lsp.buf.format)
        map("n", "<leader>ca", vim.lsp.buf.code_action)

        map("n", "<leader>ws", function()
          require("metals").hover_worksheet()
        end)

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
      --require("fzf-lua").live_grep({})
      --  cmd = "ag --ignore node_modules"
      --)

      map('n', '<leader>ss', ':FzfLua live_grep<CR>')
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
            lualine_c = {'filename'},
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
  {'dense-analysis/ale'},
  {'hashivim/vim-terraform'},
  {'leafgarland/typescript-vim'},
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "heex", "javascript", "html", "scala", "java", "typescript", "hcl", "css", "dockerfile", "git_config", "graphql", "jq", "lua", "sql", "yaml", "json" },
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
      "marko-cerovac/material.nvim",
      priority = 100,
      config = function()
          vim.cmd([[colorscheme material]])
      end,
  },
})


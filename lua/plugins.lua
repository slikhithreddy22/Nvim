return {

  -- Gruvbox theme (SpaceVim default)
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard", -- "hard", "medium", or "soft"
      })
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        window = { width = 30 },
        filesystem = {
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_current",
        },
      })
    end,
  },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Fuzzy finder (essential)
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          previewer = true,
          preview = {
            treesitter = false,  -- disable treesitter in preview
          },
        },
      })
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Buffers" },
    },
  },

  -- Statusline
  {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local function copilot_status()
  local ok, client = pcall(vim.lsp.get_clients, { name = "copilot" })
  if not ok or #client == 0 then return "󰚩 off" end

  local buf_clients = vim.lsp.get_clients({ name = "copilot", bufnr = 0 })
  if #buf_clients == 0 then return "󰚩 off" end
  return "󰚩 on"
end

    require("lualine").setup({
      options = { theme = "gruvbox" },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { copilot_status, "encoding", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
},

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup()
      vim.treesitter.language.register("python", "python")
    end,
    init = function()
      -- new API in treesitter v1+
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false
    end,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Comment with gcc / gc
  {
    "numToStr/Comment.nvim",
    config = true,
  },

  -- Git signs in gutter
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },

  -- Which-key (shows keybinds)
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup()
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>e", desc = "File Explorer" },
        { "<leader>w", desc = "Save" },
        { "<leader>q", desc = "Quit" },
        { "<leader>x", desc = "Close Buffer" },
        { "<leader>c",  group = "Copilot" },
        { "<leader>cp", desc = "Toggle Copilot" },
        { "<leader>b", group = "Buffers" },
        { "<leader>bn", desc = "Next buffer" },
        { "<leader>bp", desc = "Prev buffer" },
        { "<leader>bx", desc = "Close buffer" },
        { "<leader>bl", desc = "List all buffers" },
        { "<leader>bo", desc = "Close other buffers" },
        { "]e", desc = "Next error" },
        { "[e", desc = "Prev error" },
      })
    end,
  },

  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = "<Tab>",
            accept_word = "<C-Right>",
            accept_line = "<C-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = { enabled = false }, -- cleaner without the panel
      })
    end,
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = false,
      })

      -- auto-enable whatever you install via :Mason
      local installed = require("mason-lspconfig").get_installed_servers()
      for _, server in ipairs(installed) do
        vim.lsp.config(server, {})
        vim.lsp.enable(server)
      end
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",   -- LSP source
      "hrsh7th/cmp-buffer",     -- buffer words
      "hrsh7th/cmp-path",       -- file paths
      "L3MON4D3/LuaSnip",       -- snippets
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),   -- trigger manually
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

}

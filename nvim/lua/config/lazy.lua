local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Add LazyVim and import its default plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- Import and override with your custom plugins (loads from lua/plugins/)
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins are lazy-loaded.
    -- Your custom plugins will load during startup unless specified otherwise.
    lazy = false,
    -- It's recommended to leave version=false. Using strict versioning might
    -- break Neovim due to outdated plugin releases.
    version = false, -- Always use the latest git commit
  },
  -- Define the fallback colorscheme used DURING the initial plugin installation
  install = { colorscheme = { "nord", "habamax" } },
  checker = {
    enabled = true, -- Automatically check for plugin updates periodically
    notify = false, -- Disable update notifications to keep the UI clean
  },
  performance = {
    rtp = {
      -- Disable specific default Neovim plugins to improve startup time
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

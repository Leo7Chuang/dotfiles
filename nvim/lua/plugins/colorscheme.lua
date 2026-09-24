return {
  -- 1. Install the nord.nvim theme and set priority to ensure it loads before other plugins
  {
    "shaunsingh/nord.nvim",
    lazy = false, -- Disable lazy loading to ensure the theme loads immediately on startup
    priority = 1000,
  },
  -- 2. Override LazyVim's default settings to change the colorscheme to nord
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}

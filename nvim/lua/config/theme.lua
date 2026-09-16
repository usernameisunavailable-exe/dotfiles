return {
  -- 1. Add the ayu plugin
  {
    "shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    opts = {
      mirage = false, -- Set to false for standard dark, or true for 'mirage'
    },
  },

  -- 2. Tell LazyVim to use it
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}

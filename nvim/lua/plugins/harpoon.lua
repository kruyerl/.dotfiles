return{{
  "ThePrimeagen/harpoon",
  dependencies='nvim-lua/plenary.nvim',
  opts={},
  config = function(_, opts)
        require("harpoon").setup(opts)
    end
  }}

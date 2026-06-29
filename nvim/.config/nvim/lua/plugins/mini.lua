vim.pack.add({ "https://github.com/nvim-mini/mini.nvim" })

require("mini.notify").setup({
  content = {
    format = function(notif)
      return notif.msg
    end,
  }
})

require("mini.ai").setup({
  n_lines = 500,
})

require("mini.surround").setup()

local MiniStatusline = require("mini.statusline")
MiniStatusline.setup({
  use_icons = true,
})

MiniStatusline.section_location = function()
  return "%2l:%-2v"
end


vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
})

local MiniNotify = require("mini.notify")
MiniNotify.setup({
  content = {
    format = function(notif) return notif.msg end,
  },
})

local MiniIcons = require("mini.icons")
MiniIcons.setup({})
MiniIcons.mock_nvim_web_devicons()

local MiniAi = require("mini.ai")
MiniAi.setup({
  n_lines = 500,
})

local MiniSurround = require("mini.surround")
MiniSurround.setup({})

local MiniStatusline = require("mini.statusline")
MiniStatusline.setup({ use_icons = true })
MiniStatusline.section_location = function() return "%2l:%-2v" end

local MiniPairs = require("mini.pairs")
MiniPairs.setup({})

local MiniHipatterns = require("mini.hipatterns")
MiniHipatterns.setup({
  highlighters = {
    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
    hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },

    hex_color = MiniHipatterns.gen_highlighter.hex_color({ style = "#" }),
  },
})

local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
  lsp_completion = {
    auto_setup = true,
  },
})

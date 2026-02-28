return {
  "gen740/SmoothCursor.nvim",
  config = function()
    require("smoothcursor").setup({
      type = "matrix",
      matrix = {
        head = {
          cursor = require("smoothcursor.matrix_chars"),
          texthl = {
            "SmoothCursor",
          },
          linehl = nil,
        },
      },
    })
  end,
}

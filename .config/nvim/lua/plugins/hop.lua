return {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
        local hop = require("hop")
        local directions = require("hop.hint").HintDirection

        hop.setup({})

        vim.keymap.set("", "<leader>h", function()
            hop.hint_words()
        end, { remap = true, desc = "Hop to word" })
    end,
}

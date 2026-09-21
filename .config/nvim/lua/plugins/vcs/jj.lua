vim.api.nvim_create_autocmd("User", {
  group = require("augroup"),
  pattern = "JJDiffConflictsReady",
  desc = "Set keymap for jj-diffconflicts",
  callback = function(args)
    vim.b.disable_autoformat = true
    vim.notify("Press <c-y> or :wqa to accept conflict resolution")
    vim.keymap.set("n", "<c-y>", function()
      if vim.b.jj_diffconflicts_buftype == "conflicts" then vim.cmd("wqa") end
    end, { buffer = args.buf, desc = "Accept conflict resolution" })
  end,
})

vim.g.jjannotate_opts = {
  mappings = {
    prev_change = "<C-p>",
    next_change = "<C-n>",
  },
}

vim.keymap.set(
  "n",
  "<leader>gb",
  function() require("jjannotate").toggle() end,
  { desc = "JJ: Toggle annotate" }
)

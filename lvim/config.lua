-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
-- require('gitblame').get_current_blame_text()

-- local git_blame = require('gitblame')

vim.opt.relativenumber = true
lvim.builtin.lir.show_hidden_files = true
lvim.transparent_window = true
lvim.plugins = {
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
  -- {
  --   "f-person/git-blame.nvim",
  --   event = "BufRead",
  --   config = function()
  --     vim.cmd "highlight default link gitblame SpecialComment"
  --     vim.g.gitblame_enabled = 1 
  --     vim.g.gitblame_message_template = "<author>, <date>"
  --     vim.g.gitblame_display_virtual_text = 0
  --     vim.g.gitblame_date_format = '%r'
  --   end,
  -- },
}



-- lvim.builtin.lualine.sections.lualine_c = {
--   {
--     function()
--       local blame_text = git_blame.get_current_blame_text()
--       if blame_text == '' then
--         return '  No Blame'
--       end
--       return blame_text
--     end,
--     cond = function()
--       return git_blame.is_blame_text_available()
--     end,
--   },
-- }

vim.api.nvim_create_user_command("CopyPath", function(opts)
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg('+', file_path)
  vim.notify("File path copied to clipboard!")
end, { desc = "Copy full path of current file to clipboard" })

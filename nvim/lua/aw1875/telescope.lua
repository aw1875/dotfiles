local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      }
    },
    prompt_prefix = " 🔍️ ",
    color_devicons = true,
    previewer = true,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
	grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  },
  pickers = {
    find_files = {
      hidden = true
    }
  },
}


return {
  'stevearc/oil.nvim',
    opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function ()
    require("oil").setup({
      default_file_explorer = true,
      columns = {
        "icon",
        "size"
      },
      keymaps = {
        ["<Tab>"] = "actions.select",
        ["<S-Tab>"] = "actions.parent",
      },
      view_options = {
        show_hidden = false
      },
      preview_wim = {
        update_on_cursor_moved = true
      }
    })
  end
}


-- 呼叫lua底下的plugins.lua
require('plugins')

-- comma as leader
vim.g.mapleader = ","

-- 載入legacy.vim的設定
-- 若沒有這段命令，一直source %都沒用，並不會紀錄起來
vim.cmd([[
	so ~/.config/nvim/legacy.vim
]])




require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}


-- 原本是要呼叫nvim/after/plugin/lualine.lua，但現在直接把設定寫在這
-- require('lualine').setup()

-- 一定要有
-- 這是官方文件預設的，
-- 不過已經將兩行的separators都改成為空字串，否則lualine顯示會有bug
-- icons_enabled也設定為false，否則會出現亂碼。
-- 代替顯示的是unix，目前仍不明為何是顯示unix。
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    -- lualine_c = {'filename'},
    lualine_c = {
      'filename',
      function()
        return vim.fn['nvim_treesitter#statusline'](180)
      end},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}




-- 呼叫lua目錄下的mylsp.lua
require('mylsp')
-- 呼叫lua目錄下的nvimcmp.lua
require('nvimcmp')

-- lsp_signature.nvim
require "lsp_signature".setup({
  hint_prefix = "",
  floating_window = false,
  bind = true,
})


require('nvim-autopairs').setup {}


-- 行號設為粗體
vim.cmd('highlight LineNr gui=bold')

-- vim.cmd('highlight Normal cterm=bold')

-- vim.api.nvim_command('highlight Normal cterm=bold')






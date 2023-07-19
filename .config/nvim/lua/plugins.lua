require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'morhetz/gruvbox' 
    -- use 'rust-lang/rust.vim'        -- 支援 Rust 語言的語法高亮
    use 'luochen1990/rainbow'          -- 將括號以不同的顏色標記
    -- use 'neovimhaskell/haskell-vim' --支援 Haskell 語言的語法高亮
    use 'tpope/vim-surround'  
    use 'tpope/vim-commentary'  --press gcc to comment 
    -- use 'tpope/vim-dispatch'
    -- use 'tpope/vim-fugitive'
    -- use 'tpope/vim-abolish'
    use 'Shirk/vim-gas' 
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    -- use 'nvim-lua/plenary.nvim'
    -- use 'gfanto/fzf-lsp.nvim
    use 'zefei/vim-colortuner'  
    use { 'nvim-treesitter/nvim-treesitter' }
    use 'BurntSushi/ripgrep'   
    -- use 'nvim-pack/nvim-spectre'
    use 'DingDean/wgsl.vim'
    -- use 'alaviss/nim.nvim'
    use 'neovim/nvim-lspconfig' --與lsp_signature搭配使用
    use { 'ray-x/lsp_signature.nvim', commit = "1d96fac72eb6d74abd5b4d7883a01f58aeb4f87e" } 
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'
    -- use 'SirVer/ultisnips'   -- some bugs here
    -- use 'quangnguyen30192/cmp-nvim-ultisnips' -- some bugs here 
    -- use 'sbdchd/neoformat'  
    use 'nvim-tree/nvim-web-devicons' -- 一定要有這行
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- use 'ntpeters/vim-better-whitespace'

    use 'windwp/nvim-autopairs'
    use 'preservim/vimux'       
    

end)


-- lsp_signature.nvim  輸入函式名稱時彈出提示視窗，它顯示函式的參數和返回值資訊，幫助理解函式的使用方式。
-- cmp-nvim-lsp 與 LSP 服務和程式碼自動完成庫 cmp 配合使用。它提供了一個更全面的自動完成功能
-- cmp-buffer 從當前緩衝區（buffer）中提取單詞，並根據這些單詞提供自動完成建議。
-- 當您在編輯器中輸入文字時，nvim-cmp 會根據當前的上下文和已輸入的內容，向 cmp-buffer 插件請求自動完成建議
-- hrsh7th/cmp-cmdline 提供命令行（command-line）自動完成功能。
-- tpope/vim-fugitive 它是一個用於集成 Git 版本控制系統的插件，提供了許多有用的功能和命令，使您可以在 Vim 中輕鬆地進行 Git 操作

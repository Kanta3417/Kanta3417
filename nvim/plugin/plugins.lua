--------------------------------
-- lazy.nvim
---------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- helpの日本語化
	"vim-jp/vimdoc-ja",
	-- 細々とした機能
	"echasnovski/mini.nvim",
	-- denoを使うためのプラグイン
	"vim-denops/denops.vim",
	-- denops.vim -- 日本語入力プラグイン(SKK) denopsが必要
	"vim-skk/skkeleton",
	-- ファイラー
	"lambdalisue/fern.vim",
  -- colorscheme
  "NLKNguyen/papercolor-theme",
})

---------------------------------
-- vimdoc-ja
---------------------------------
-- 日本語の優先順位を上げる
-- vim.opt.helplang=ja,en
vim.cmd[[set helplang=ja,en]]

---------------------------------
-- mini.nvim
---------------------------------
-- 括弧を挿入、変更、削除する
require('mini.surround').setup()
-- よくわからん
-- require('mini.ai').setup()
-- 複数行のコメントアウト
require('mini.comment').setup()
-- 文章の整形
-- require('mini.align').setup()
-- 括弧の自動挿入
require('mini.pairs').setup()

---------------------------------
-- skkeleton
---------------------------------
-- 辞書を登録
vim.fn['skkeleton#config']({ globalDictionaries = { '~/.skk/SKK-JISYO.L' } })
-- <C-j>で日本語モード(挿入モード、コマンドラインモード)
vim.keymap.set('i', '<C-j>', '<Plug>(skkeleton-enable)')
vim.keymap.set('c', '<C-j>', '<Plug>(skkeleton-enable)')

---------------------------------
-- colorscheme
---------------------------------
-- vim.cmd([[set background=dark]])
-- vim.cmd([[colorscheme PaperColor]])
vim.cmd
[[
set background=dark
colorscheme PaperColor 
]]


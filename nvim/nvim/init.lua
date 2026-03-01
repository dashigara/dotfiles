-- ====================
-- 文字コード設定
-- ====================
-- 設定等
vim.scriptencoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
-- ファイル読み込み時
vim.opt.fileencodings = "UTF-8,CP932"

-- ====================
-- エディタの基本動作
-- ====================
-- クリップボード共有
vim.opt.clipboard:append({ "unnamedplus" })
-- バッファが編集中でもその他のファイルを開けるように
vim.opt.hidden = true
-- 入力中のコマンドをステータスに表示する
vim.opt.showcmd = true
-- コマンドラインの補完
vim.opt.wildmode = "list:longest"
-- スマートインデント設定
vim.opt.smartindent = true
-- ビープ音を消す
vim.opt.belloff = "all"
-- ターミナルをpwshに
if vim.loop.os_uname().sysname == "Windows_NT" then
	vim.opt.shell = "pwsh"
end

-- ====================
-- ファイル操作設定
-- ====================
-- バックアップファイルを作らない
vim.opt.backup = false
-- スワップファイルは作る(クラッシュ対策)
vim.opt.swapfile = true
-- undoファイルを作らない
vim.opt.undofile = false
-- 編集中のファイルが変更されたら自動で読み直す
vim.opt.autoread = true

-- ====================
-- インデント・タブ設定
-- ====================
-- Tab文字を半角スペースにする
vim.opt.expandtab = true
-- 行頭以外のTab文字の表示幅（スペースいくつ分）
vim.opt.tabstop = 4
-- 行頭でのTab文字の表示幅
vim.opt.shiftwidth = 4

-- ====================
-- 検索設定
-- ====================
-- 検索文字列入力時に順次対象文字列にヒットさせる
vim.opt.incsearch = true
-- 検索時に最後まで行ったら最初に戻る
vim.opt.wrapscan = true
-- 検索語をハイライト表示
vim.opt.hlsearch = true
-- 大文字小文字を区別しない
vim.opt.ignorecase = true

-- ====================
-- 折り畳み設定
-- ====================
-- 折り畳みをインデント単位に
vim.opt.foldmethod = "indent"
-- 折り畳み状態の表示領域を追加
vim.opt.foldcolumn = "0"
-- 起動時に折りたたまない
vim.opt.foldlevel = 99

-- ====================
-- 表示設定
-- ====================
-- シンタックスハイライトの有効化
vim.cmd("syntax enable")
-- 行番号表示
vim.opt.number = true
-- 不可視文字表示
vim.opt.list = true
vim.opt.listchars = "tab:»-,trail:_,eol:↲,extends:»,precedes:«,nbsp:%"
-- 現在の行を強調表示
vim.opt.cursorline = true
-- 行末の1文字先までカーソルを移動できるように
vim.opt.virtualedit = "onemore"
-- 括弧入力時の対応する括弧を表示
vim.opt.showmatch = true
-- 折り返し無
vim.opt.wrap = false

-- ====================
-- 外観設定（カラースキーム・ハイライト）
-- ====================
vim.cmd("colorscheme evening")
vim.cmd("hi clear CursorLine")
vim.cmd("highlight CursorLineNr guifg=#00ffff ctermfg=14")

-- ====================
-- プラグイン設定
-- ====================
require("plugin")

-- ====================
-- 言語サーバー
-- ====================
require("lsp")

-- ====================
-- キーマップ設定
-- ====================
require("keymap")

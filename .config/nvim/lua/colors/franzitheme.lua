local M = {}

function M.setup()
  vim.cmd("highlight Normal guifg=#ffffff guibg=#000000")
  vim.cmd("highlight Cursor guifg=#000000 guibg=#ffffff")
  vim.cmd("highlight LineNr guifg=#888888 guibg=#000000")
  vim.cmd("highlight CursorLine guibg=#415f69")
  vim.cmd("highlight Visual guibg=#5c5c42")

  vim.cmd("highlight Comment guifg=#808081 gui=italic")
  vim.cmd("highlight Keyword guifg=#f92672 gui=bold")
  vim.cmd("highlight Function guifg=#a6e22e gui=italic")
  vim.cmd("highlight String guifg=#e6db74")
  vim.cmd("highlight Type guifg=#66d9ef")
  vim.cmd("highlight Constant guifg=#4186f8")
  vim.cmd("highlight Number guifg=#ae81fe")
  vim.cmd("highlight Identifier guifg=#cbad96")
  vim.cmd("highlight StorageClass guifg=#f92672 gui=bold")
  vim.cmd("highlight PreProc guifg=#d0d0ff")
  vim.cmd("highlight Special guifg=#20999d")
  vim.cmd("highlight Tag guifg=#ffffff")
  vim.cmd("highlight Error guifg=#ff6b68")
  vim.cmd("highlight WarningMsg guifg=#ffff00")
  vim.cmd("highlight Underlined guifg=#6a8758 gui=underline")
end

vim.cmd([[augroup franzitheme]])
vim.cmd([[autocmd!]])
vim.cmd([[autocmd ColorScheme * lua require("colors.franzitheme").setup()]])
vim.cmd([[augroup END]])

M.setup()

vim.cmd([[colorscheme franzitheme]])
return M

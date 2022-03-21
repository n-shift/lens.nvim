local _2afile_2a = "fnl\\lens\\splits.fnl"
local function left_split(width, scratch)
  local bufnr = vim.api.nvim_create_buf(true, (scratch or false))
  vim.cmd(("leftabove vertical sbuffer " .. bufnr))
  local winnr = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_width(winnr, width)
  return {bufnr = bufnr, winnr = winnr}
end
local function right_split(width, scratch)
  local bufnr = vim.api.nvim_create_buf(true, (scratch or false))
  vim.cmd(("belowright vertical sbuffer " .. bufnr))
  local winnr = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_width(winnr, width)
  return {bufnr = bufnr, winnr = winnr}
end
local function up_split(height, scratch)
  local bufnr = vim.api.nvim_create_buf(true, (scratch or false))
  vim.cmd(("leftabove sbuffer " .. bufnr))
  local winnr = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_height(winnr, height)
  return {bufnr = bufnr, winnr = winnr}
end
local function down_split(height, scratch)
  local bufnr = vim.api.nvim_create_buf(true, (scratch or false))
  vim.cmd(("belowright sbuffer " .. bufnr))
  local winnr = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_height(winnr, height)
  return {bufnr = bufnr, winnr = winnr}
end
return {left = left_split, right = right_split, above = up_split, belove = down_split}
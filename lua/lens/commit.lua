local _2afile_2a = "fnl\\lens\\commit.fnl"
local i = vim.api
local s = require("lens.splits")
local storage = {}
local function create()
  return i.nvim_create_buf(false, true)
end
local function open()
  local bufnr = create()
  vim.cmd(("vertical sbuffer " .. bufnr))
  do end (storage)["bufnr"] = bufnr
  return nil
end
local function close()
  return i.nvim_buf_delete(storage.bufnr, {force = true})
end
local function get()
  return i.nvim_buf_get_lines(storage.bufnr, 0, -1, true)
end
local function strip_newline(lines)
  local out = {}
  for _, line in pairs(lines) do
    if not ("" == line) then
      table.insert(out, line)
    else
    end
  end
  return out
end
local function build(lines)
  local out = {"git", "commit"}
  for _, line in pairs(lines) do
    table.insert(out, "-m")
    table.insert(out, line)
  end
  return out
end
local function process()
  vim.fn.system(build(strip_newline(get())))
  return close()
end
return {open = open, process = process}
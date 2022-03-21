local ok, fennel = pcall(require, "aniseed.compile")
if ok then
    fennel.glob("**/*.fnl", "fnl", "lua")
else
    print("Install Olical/aniseed to compile fennel into lua")
end

vim.cmd("edit readme.norg")
local res, _ = pcall(vim.cmd, "Neorg export to-file readme.md")
if not res then
    print("Install nvim-neorg/neorg and enable core.export and core.export.markdown to compile norg into md")
end

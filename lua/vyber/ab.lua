abbrs = {
  ["W!"] = "w!",
  ["W"] = "w",
  ["Wq"] = "wq",
  ["Wa"] = "wa",
  ["wQ"] = "wQ",
  ["WQ"] = "wq",
  ["Qq"] = "q!",
  ["Qa"] = "qa",
  ["QA"] = "qa",
  ["qA"] = "qa",
  ["Q!"] = "q!",
  ["qq"] = "qa!",
  ["h"] = "tab help",
}

for k, v in pairs(abbrs) do
  vim.cmd.noreabbrev {
    "<buffer>",
    k,
    v,
  }
end

vim.cmd.noreabbrev {  "<buffer>", "W", "w"}
vim.cmd.noreabbrev {  "<buffer>", "W!", "w!"}
vim.cmd.noreabbrev {  "<buffer>", "Wq", "wq"}
vim.cmd.noreabbrev {  "<buffer>", "Wq", "wq"}
vim.cmd.noreabbrev {  "<buffer>", "wQ", "wQ"}
vim.cmd.noreabbrev {  "<buffer>", "WQ", "wq"}
vim.cmd.noreabbrev {  "<buffer>", "QQ", "q!"}
vim.cmd.noreabbrev {  "<buffer>", "Qq", "q!"}
vim.cmd.noreabbrev {  "<buffer>", "Qa", "qa"}
vim.cmd.noreabbrev {  "<buffer>", "qA", "qa"}
vim.cmd.noreabbrev {  "<buffer>", "Q!", "q!"}
vim.cmd.noreabbrev {  "<buffer>", "qq", "qa!"}
vim.cmd.noreabbrev {  "<buffer>", "h", "tab help"}


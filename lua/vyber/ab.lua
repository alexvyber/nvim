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

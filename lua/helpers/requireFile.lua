local OOOO = require('read_file')

local vimrc = "/home/alexs/.vimrc"
local fromFile = OOOO.take(vimrc)

local result = ''

for k, v in pairs(fromFile) do
  result = result .. v .. '\n'
end

print(result)

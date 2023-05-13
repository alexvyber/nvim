local M = {}

function file_exists(file)
	local f = io.open(file, "rb")
	if f then
		f:close()
	end
	return f ~= nil
end

-- get all lines from a file, returns an empty
-- list/table if the file does not exist
function lines_from(file)
	if not file_exists(file) then
		return {}
	end

	local lines = {}

	for line in io.lines(file) do
		lines[#lines + 1] = line
	end

	return lines
end

function get_file_content(filename)
	local table_from_vimrc = lines_from(filename)
	content = ""

	for k, v in pairs(table_from_vimrc) do
		content = content .. v .. "\n"
	end

	return content
end

M.take = get_file_content

return M

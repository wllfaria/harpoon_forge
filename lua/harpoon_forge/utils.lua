---@class HarpoonExtUtils
local HarpoonExtUtils = {}

--- Check if the path is absolute
--- I'm not positive this works for all cases but it works for the following
---
--- ```lua
--- local paths = {
---     "/absolute/path/to/file.txt",
---     "relative/path/to/file.txt",
---     "C:\\Windows\\System32\\file.txt",
---     "folder/file.txt"
--- }
---
--- @param path string
--- @return boolean
---```
function HarpoonExtUtils:_is_absolute_path(path)
    return path:match("^[/\\]") or path:match("^[A-Za-z]:[/\\]")
end

---Compare the `list.current_file` with the filename in the list
---appends cwd to filename if it doesn't contain a /
---
---@param filename string
---@param full_path string
---@return boolean
function HarpoonExtUtils:compare_filenames(filename, full_path)
    local cwd = vim.fn.getcwd()
    local absolute_path = filename

    if not HarpoonExtUtils:_is_absolute_path(filename) then
        local separator = package.config:sub(1, 1)
        absolute_path = cwd .. separator .. filename
    end

    if absolute_path == full_path then
        return true
    end

    return false
end

return HarpoonExtUtils

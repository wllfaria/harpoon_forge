local HarpoonExtUtils = require("harpoon_forge.utils")
---@class HarpoonList
---@field bufnr number
---@field win_id number
---@field current_file string

---@class HarpoonExtModules
local HarpoonExtModules = {}

---@param list HarpoonList
---@return nil
function HarpoonExtModules:highlight_current_file(list)
    local files = vim.api.nvim_buf_get_lines(list.bufnr, 0, -1, true)
    for i, filename in ipairs(files) do
        if HarpoonExtUtils:compare_filenames(filename, list.current_file) then
            vim.api.nvim_buf_add_highlight(
                list.bufnr,
                -1,
                "HarpoonExtCurrent",
                i - 1,
                0,
                -1
            )
            break
        end
    end
end

---@param list HarpoonList
---@return nil
function HarpoonExtModules:position_cursor_on_current_file(list)
    local files = vim.api.nvim_buf_get_lines(list.bufnr, 0, -1, true)
    for i, filename in ipairs(files) do
        if HarpoonExtUtils:compare_filenames(filename, list.current_file) then
            vim.api.nvim_win_set_cursor(list.win_id, { i, 0 })
            break
        end
    end
end

return HarpoonExtModules

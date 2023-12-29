local Harpoon = require("harpoon")
local HarpoonExtModules = require("harpoon_forge.modules")

local HarpoonExt = {
    highlight = {},
}

---@class HarpoonExtensionsConfig
---@field highlight_current_file boolean @whether to highlight the current file
---@field position_cursor_on_current_file boolean @whether to position the cursor on the current file
---@field highlight table @highlight options - check `:h nvim_set_hl` for more info
---
HarpoonExt.config = {
    highlight_current_file = true,
    position_cursor_on_current_file = true,
    highlight = {
        bg = "#353535",
        fg = "#d9d9d9",
        bold = true,
    },
}

---@param opts? HarpoonExtensionsConfig
HarpoonExt.setup = function(opts)
    HarpoonExt.config = vim.tbl_extend("force", HarpoonExt.config, opts or {})
    vim.api.nvim_set_hl(0, "HarpoonExtCurrent", HarpoonExt.config.highlight)

    local extensions = {
        ---@param list HarpoonList
        UI_CREATE = function(list)
            if HarpoonExt.config.highlight_current_file then
                HarpoonExtModules.highlight_current_file(
                    HarpoonExtModules,
                    list
                )
            end
            if HarpoonExt.config.position_cursor_on_current_file then
                HarpoonExtModules.position_cursor_on_current_file(
                    HarpoonExtModules,
                    list
                )
            end
        end,
    }

    Harpoon:extend(extensions)
end

return HarpoonExt

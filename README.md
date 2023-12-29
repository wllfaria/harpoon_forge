<div align="center">

# Harpoon Forge

</div>

> Harpoon forge is a set of extensions for [Harpoon](https://github.com/ThePrimeagen/harpoon).

## Motivation

Harpoon introduced hooks which allows users to customize behavior for specific
needs, so I began adding some functionality I wanted to see on default harpoon,
I tried to make it easy to add or remove extensions as I didn't wanted to have
many repositories for each extension.

Currently this extension only allows you to highlight the current file you're in
when you open a list, and position the cursor on the current file.

## Installation

### Requirements

- [Harpoon](https://github.com/ThePrimeagen/harpoon).
- Neovim 0.8+

#### Lazy.nvim

```lua
{
    "wllfaria/harpoon_forge",
    dependencies = {
        "theprimeagen/harpoon"
    },
    config = function()
        require("harpoon_forge").setup({})
        -- refer to `configuration` to check available settings.
    end
}
```

## Configuration

```lua
-- Default settings, you can change anything.
require("harpoon_forge").setup({
    highlight_current_file = true,
    -- idk_why_i_choose_such_a_long_name_lol
    position_cursor_on_current_file = true,
    -- see `:h nvim_set_hl` for valid customizations
    highlight = {
        bg = "#353535",
        fg = "#d9d9d9",
        bold = true,
    },
})
```

## Note

This repository was mainly created to make extensions that fit my needs,
but I'm happy to accept suggestions of new extensions aswell as contributions.
I would love someone to test wether or not this works on windows as I don't have
an easy way to test it. Also I need to write tests

## Contribution

If you want to contribute, you can either open an issue with your extension
idea or fork the repository and make the extension you want. Feel free to copy
this repository and add your own extensions if you don't want to pull request.

<div align="center">
<blockquote>Thank you prime for making harpoon.</blockquote>
</div>

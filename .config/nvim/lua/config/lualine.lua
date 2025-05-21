local theme_util = require("lib/theme")

-- Load the theme and clone it to avoid modifying the original theme
local original = require("lualine.themes." .. vim.g._lualine_theme)
local theme = vim.deepcopy(original)

for _, mode in pairs(theme) do
  mode.a.fg = mode.a.bg
  mode.a.gui = ""

  for _, section in pairs(mode) do
    section.bg = 'background'
  end
end

local config = {
  options = {
    theme = theme,
    component_separators = {left = "", right = ""},
    section_separators = {left = "", right = ""}
  },
  sections = {
    lualine_a = {{"mode", icon = ""}},
    lualine_b = {
      {"branch", icon = ""},
      "diff"
    },
    lualine_c = {
      {
        function()
          return require("nvim-navic").get_location()
        end,
        cond = function()
          return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
        end,
        color = theme_util.get_hlgroup("Comment", nil)
      }
    },
    lualine_x = {
      {
        "diagnostics",
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = "󰝶 "
        }
      },
      {
        function()
          local devicons = require("nvim-web-devicons")
          local ft = vim.bo.filetype
          local icon
          icon = devicons.get_icon(vim.fn.expand("%:t"))
          if icon == nil then
            icon = devicons.get_icon_by_filetype(ft)
          end
          if icon == nil then
            icon = " 󰈤"
          end

          return icon .. " "
        end,
        color = function()
          local _, hl = require("nvim-web-devicons").get_icon(vim.fn.expand("%:t"))
          if hl then
            return theme_util.with_transparent_bg(hl)
          end
          return theme_util.get_hlgroup("Normal")
        end,
        separator = "",
        padding = {left = 2, }
      },
      {
        "filename",
        -- padding = {left = 0, right = 0},
        fmt = function(name)
          return name
        end
      },
      {
        function()
          return require("grapple").name_or_index()
        end,
        cond = function()
          return package.loaded["grapple"] and require("grapple").exists()
        end,
        padding = { left = 0 },
        fmt = function(name)
          return "[" .. name .. "]"
        end
      }
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  }
}

require("lualine").setup(config)

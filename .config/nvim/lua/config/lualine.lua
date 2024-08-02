local utils = require("util")

local function get_theme_name()
  if vim.g._theme == "dracula" then
    return "dracula-nvim"
  elseif vim.g._theme == "rose-pine-moon" then
    return "rose-pine"
  elseif vim.g._theme == "tokyonight-night" then
    return "tokyonight"
  else
    return vim.g._theme
  end
end

-- Load the theme and clone it to avoid modifying the original theme
local original = require("lualine.themes." .. get_theme_name())
local theme = vim.deepcopy(original)

for _, mode in pairs(theme) do
  mode.a.fg = mode.a.bg
  mode.a.gui = ""

  for _, section in pairs(mode) do
    section.bg = nil
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
        color = utils.get_hlgroup("Comment", nil)
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
            return hl
          end
          return utils.get_hlgroup("Normal")
        end,
        separator = "",
        padding = {left = 2, right = 0}
      },
      {
        "filename",
        padding = {left = 0, right = 2},
        fmt = function(name)
          return name
        end
      }
    },
    lualine_y = {"progress"},
    lualine_z = {"location"}
  }
}

require("lualine").setup(config)

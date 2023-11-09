local function get_theme_name()
  if vim.g._theme == 'dracula' then
    return 'dracula-nvim'
  elseif vim.g._theme == 'rose-pine-moon' then
    return 'rose-pine'
  elseif vim.g._theme == 'tokyonight-night' then
    return 'tokyonight'
  else
    return vim.g._theme
  end
end

local config = {
  options = {
    theme = get_theme_name(),
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_c = { 'filename' },
  },
}

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- inject lsp progress indicator
ins_left {
  'lsp_progress',
  separators = {
    message = { pre = '', post = '' },
  },
  message = { commenced = 'Initializing', completed = 'Ready' },
  display_components = { 'lsp_client_name', { 'message' }, 'spinner' },
  timer = { progress_enddelay = 0, spinner = 100, lsp_client_name_enddelay = 0 },
  spinner_symbols = { '⠈', '⠐', '⠠', '⢀', '⡀', '⠄', '⠂', '⠁' },
}

require('lualine').setup(config)

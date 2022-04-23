local config = {
  sections = {
    lualine_c = {'filename'},
  }
} 

local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end


ins_left {
	'lsp_progress',
	separators = {
		message = { pre = '', post = ''},
	},
  message = { commenced = 'Initializing', completed = 'Ready' },
	display_components = { 'lsp_client_name', { 'message' }, 'spinner'},
	timer = {progress_enddelay = 0, spinner = 100, lsp_client_name_enddelay = 0 },
  spinner_symbols = {'⠈', '⠐', '⠠', '⢀', '⡀', '⠄', '⠂', '⠁'},
}

require('lualine').setup(config)


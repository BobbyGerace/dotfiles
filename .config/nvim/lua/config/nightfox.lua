require('nightfox').setup{
  options = {
    styles = {
      comments = 'italic'
    }
  }
}

local theme = vim.g._theme
if (theme == 'nightfox') then 
  vim.cmd('colorscheme ' .. theme)
end

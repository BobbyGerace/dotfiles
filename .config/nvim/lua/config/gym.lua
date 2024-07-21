local gym = require('gym')
local calc = require('gym.calc')
local telescope = require('telescope')
local map = require('util').map

gym.setup({})

map('n', '<leader>geh', function() telescope.extensions.gym.exercise_history() end, 'Exercise History')
map('n', '<leader>gel', function() telescope.extensions.gym.exercises() end, 'Exercise List')
map('n', '<leader>gwh', function() telescope.extensions.gym.workout_history() end, 'Workout History')
map('n', '<leader>gwn', function() telescope.extensions.gym.current_workout_name_history() end, 'Named Workout History')
map('n', '<leader>gep', function() telescope.extensions.gym.prs() end, 'Exercise PRs')

local fill_convert_command = function()
  vim.api.nvim_feedkeys(':GymConvertCurrent ', 'n', false)
end

map('n', '<leader>gce', calc.current_e1rm, 'Estimate 1RM')
map('n', '<leader>gcc', fill_convert_command, 'Convert Set')

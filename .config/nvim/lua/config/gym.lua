local gym = require('gym')
local telescope = require('telescope')
local map = require('util').map

gym.setup({})

map('n', '<leader>geh', function() telescope.extensions.gym.exercise_history() end, 'Exercise History')
map('n', '<leader>gel', function() telescope.extensions.gym.exercises() end, 'Exercise List')
map('n', '<leader>gwh', function() telescope.extensions.gym.workout_history() end, 'Workout History')
map('n', '<leader>gwn', function() telescope.extensions.gym.current_workout_name_history() end, 'Named Workout History')
map('n', '<leader>gep', function() telescope.extensions.gym.prs() end, 'Exercise PRs')

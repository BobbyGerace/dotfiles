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

-- Timer
local fifo = '/tmp/workout-timer.fifo'

local function timer_send(cmd)
  vim.fn.jobstart({ 'timeout', '1', 'sh', '-c', 'printf "%s\n" ' .. vim.fn.shellescape(cmd) .. ' > ' .. fifo })
end

vim.api.nvim_create_user_command('Timer', function(opts)
  timer_send(opts.args)
end, { nargs = '+' })

for i = 1, 9 do
  map('n', ',' .. i, function() timer_send('set ' .. i .. ':00') end, 'Timer: set ' .. i .. 'm')
end

map('n', ',<CR>',    function() timer_send('next')        end, 'Timer: next')
map('n', ',<Space>', function() timer_send('pause')       end, 'Timer: pause')
map('n', ',+',       function() timer_send('add 30')      end, 'Timer: add 30s')
map('n', ',-',       function() timer_send('subtract 30') end, 'Timer: subtract 30s')

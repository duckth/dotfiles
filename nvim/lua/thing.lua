vim.notify = require("notify")

local job = vim.fn.jobstart(
  'kitty help',
  {
    -- cwd = '~/dotfiles/nvim',
    -- on_exit = function(_, code, _)
    --   print('Job exited with code ' .. code)
    -- end,
    on_stdout = function(_, data, _)
      for i, line in ipairs(data) do
        vim.notify(line, { timeout = 1000 })
      end
    end,
    on_stderr = function(_, data, _)
      for i, line in ipairs(data) do
        print(line)
      end
    end
  }
)

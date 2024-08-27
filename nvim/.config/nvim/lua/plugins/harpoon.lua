return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup()

    require('which-key').add {
      { '<leader>h', group = '[H]arpoon', icon = '󰣉' },
    }

    local function map(lhs, rhs, opts)
      vim.keymap.set('n', lhs, rhs, opts or {})
    end

    map('<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon, [A]dd item' })
    map('<leader>hh', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Show [H][H]arpoon list' })
    map('<leader>h1', function()
      harpoon:list():select(1)
    end, { desc = '[H]arpoon to [1]st item' })
    map('<leader>h2', function()
      harpoon:list():select(2)
    end, { desc = '[H]arpoon to [2]nd item' })
    map('<leader>h3', function()
      harpoon:list():select(3)
    end, { desc = '[H]arpoon to [3]rd item' })
    map('<leader>h4', function()
      harpoon:list():select(4)
    end, { desc = '[H]arpoon to [4]th item' })
  end,
}

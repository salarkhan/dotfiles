-- document existing key chains
require('which-key').register({
	['<leader>c'] = { name = '[c]ustom', _ = 'which_key_ignore' },
	['<leader>f'] = { name = '[f]ind', _ = 'which_key_ignore' },
	['<leader>l'] = { name = '[l]sp', _ = 'which_key_ignore' },
})

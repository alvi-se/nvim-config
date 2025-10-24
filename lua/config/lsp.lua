require("mason").setup()

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('i', '<C-q>', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})


require("mason-lspconfig").setup({
    automatic_enable = true,
    ensure_installed = { "lua_ls", "yamlls", "helm_ls" },
})


vim.lsp.config('ts_ls', {
    init_options = {
        -- Enable Vue support
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                languages = { 'vue' },
            },
        },
    },
    filetypes = {
        'typescript',          -- TypeScript files (.ts)
        'javascript',          -- JavaScript files (.js)
        'javascriptreact',     -- React files with JavaScript (.jsx)
        'typescriptreact',     -- React files with TypeScript (.tsx)
        'vue'                  -- Vue.js single-file components (.vue)
    },
})


-- To configure GitHub Copilot
require('copilot').setup({})

require('blink.cmp').setup({
	keymap = { preset = 'default' }
})



-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'
vim.diagnostic.config({
    virtual_text = true
})


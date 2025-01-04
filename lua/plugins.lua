return {
    { 'rbong/vim-flog' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    -- Auto close pairs
    { "windwp/nvim-autopairs" },
    { 'nvim-tree/nvim-web-devicons' },
    { 'vim-airline/vim-airline' },
    { 'vim-airline/vim-airline-themes' },
    { 'patstockwell/vim-monokai-tasty' },
    -- Debugger
    { 'mfussenegger/nvim-dap' },
    -- { 'airblade/vim-gitgutter' },
    -- Git signs in editor
    { "lewis6991/gitsigns.nvim" },
    { 'github/copilot.vim' },
    -- File search
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- Project manager for telescope
    { 'ahmedkhalf/project.nvim' },
    -- Discord rich presence
    { 'andweeb/presence.nvim' },
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'nvim-lua/plenary.nvim',
        },
    },
}


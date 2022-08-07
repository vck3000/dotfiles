local M = {}

------------------------------------------------
-- Helpers -------------------------------------
------------------------------------------------
local function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}

    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force", 
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

nmap = bind("n", {noremap = false})
nnoremap = bind("n")
vnoremap = bind("v")
xnoremap = bind("x")
inoremap = bind("i")

------------------------------------------------
-- Remaps --------------------------------------
------------------------------------------------
nnoremap("<SPACE>", "<Nop>")
vim.g.mapleader = ' '

nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>c", ":noh<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")
inoremap("<C-c>", "<esc>")
nnoremap("<C-L><C-L>", ":set invrelativenumber<CR>")

nnoremap("<leader>h", ":wincmd h<CR>")
nnoremap("<leader>j", ":wincmd j<CR>")
nnoremap("<leader>k", ":wincmd k<CR>")
nnoremap("<leader>l", ":wincmd l<CR>")

-- Nvim Tree
nnoremap("<leader>pv", ":NvimTreeToggle<CR>")
nnoremap("<leader>pf", ":NvimTreeFindFile<CR>")

-- Telescope
nnoremap("<C-P>", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- LSP specific
M.lsp_config = function(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),

        on_attach = function()
            print("HIHI")
            nnoremap("gd", function() vim.lsp.buf.definition() end)
            nnoremap("K", function() vim.lsp.buf.hover() end)
            nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
            nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
            nnoremap("[d", function() vim.diagnostic.goto_next() end)
            nnoremap("]d", function() vim.diagnostic.goto_prev() end)
            nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
            nnoremap("<leader>rr", function() vim.lsp.buf.references() end)
            nnoremap("<leader>rn", function() vim.lsp.buf.rename() end)
            inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
        end,

        flags = {
            debounce_text_changes = 150
        },
    }, _config or {})
end

return M

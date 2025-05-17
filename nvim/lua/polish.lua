-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here
vim.keymap.set("t", "<leader>q", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.g.python3_host_prog = os.getenv("HOME") .. "/.local/share/nvim-venv/bin/python"

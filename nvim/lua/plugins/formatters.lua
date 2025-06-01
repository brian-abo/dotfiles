local function selene_configured(path)
  return #vim.fs.find("selene.toml", { path = path, upward = true, type = "file" }) > 0
end

---@type LazySpec
return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        lua = { "stylua" },
        yaml = { "yamlfix" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
      notify_on_error = true,
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        lua = { "selene" },
      },
      linters = {
        selene = { condition = function(ctx) return selene_configured(ctx.filename) end },
      },
      format_on_save = { timeout_ms = 500 },
    },
  },
  {
    "echasnovski/mini.icons",
    optional = true,
    opts = {
      file = {
        [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
      },
      filetype = {
        gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
      },
    },
  },
}

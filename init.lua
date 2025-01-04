-- Setup plugins
require("config.lazy")
require("config")
-- require("ibl").setup()
-- require("buftab").setup()
-- Enable telescope projects
require("project_nvim").setup({})
require("telescope").load_extension("projects")


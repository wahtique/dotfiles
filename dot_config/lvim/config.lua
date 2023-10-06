-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- make sure debugger is active
lvim.builtin.dap.active = true

-- scala
lvim.plugins = {
  {
    "scalameta/nvim-metals",
    config = function()
      require("user.metals").config()
    end,
  },
}

dap.configurations.scala = {
{
  type = "scala",
  request = "launch",
  name = "Run or Test Target",
  metals = {
    runType = "runOrTestFile",
  },
},
{
  type = "scala",
  request = "launch",
  name = "Test Target",
  metals = {
    runType = "testTarget",
  },
},
}


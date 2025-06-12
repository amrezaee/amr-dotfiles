return {
  setup = {
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        -- analysis = {
        --   unusedparams = true,
        --   qf1005 = true, -- expand call to math.pow
        -- },
      },
    },
  },
}

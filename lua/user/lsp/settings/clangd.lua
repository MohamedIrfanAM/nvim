local M = {}
  function M.setup(capabilities)
    capabilities.offsetEncoding = { "utf-16" }
    return capabilities
  end
return M

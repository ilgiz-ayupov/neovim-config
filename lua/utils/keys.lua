local M = {}

function M.opts(keys)
  local opts = {}
  for k, v in pairs(keys) do
    if type(k) ~= "number" and k ~= "mode" and k ~= "id" then
      opts[k] = v
    end
  end
  return opts
end

return M

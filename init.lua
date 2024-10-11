if vim.loader then
	vim.loader.enable()
end

_G.dd = function(...)
	require("util.debug").dump(...)
end
vim.print = _G.dd
vim.opt.clipboard:append("unnamedplus")  -- Sử dụng clipboard hệ thống

require("config.lazy")

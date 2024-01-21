local M = {}

function M.is_available(plug)
	local lazy_config_avail,lazy_config=pcall(require,"lazy.core.config")
	return lazy_config_avail and lazy_config.spec.plugins[plug] ~= nil
end

function M.event(event,delay)
	local emit_event = function() vim.api.nvim_exec_autocmds("User",{pattern = "Astro" .. event,modeline = false}) end
	if delay == false then
		emit_event()
	else
		vim.schedule(emit_event)
	end
end

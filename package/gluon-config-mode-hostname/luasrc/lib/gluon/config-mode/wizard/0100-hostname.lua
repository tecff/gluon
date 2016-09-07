local cbi = require "luci.cbi"
local i18n = require "luci.i18n"
local pretty_hostname = require "pretty_hostname"
local uci = luci.model.uci.cursor()

local M = {}

function M.section(form)
  local msg = i18n.translate('Your node should have an informative and nice name. ' ..
                   'The node will be shown on the map using this name. ' ..
                   'You may use its location (e.g. "Placeholderstreet 5", "Townname 9"), ' ..
                   'the companies name (e.g. "Some Company") ' ..
                   'or similar. If there are multiple nodes in the same building, ' ..
                   'identifying them is easier if you put something like "2nd floor" ' ..
                   'at the end of the node\'s name.')
  local s = form:section(cbi.SimpleSection, nil, msg)
  local o = s:option(cbi.Value, "_hostname", i18n.translate("Node name"))
  o.value = pretty_hostname.get(uci)
  o.rmempty = false
end

function M.handle(data)
  pretty_hostname.set(uci, data._hostname)
  uci:commit("system")
end

return M

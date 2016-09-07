--[[
LuCI - Lua Configuration Interface

Copyright 2008 Steven Barth <steven@midlink.org>
Copyright 2011 Jo-Philipp Wich <xm@subsignal.org>
Copyright 2013 Nils Schneider <nils@nilsschneider.net>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

$Id$
]]--

local fs = require "nixio.fs"

local m = Map("system", translate("SSH keys"))
m.pageaction = false
m.template = "admin/expertmode"

if fs.access("/etc/config/dropbear") then
  local s = m:section(TypedSection, "_dummy1", nil,
                      translate("You can provide your SSH keys here (one per line):"))

  s.addremove = false
  s.anonymous = true

  function s.cfgsections()
    return { "_keys" }
  end

  local keys

  keys = s:option(TextValue, "_data", "")
  keys.wrap    = "off"
  keys.rows    = 5
  keys.rmempty = true

  function keys.cfgvalue()
    return fs.readfile("/etc/dropbear/authorized_keys") or ""
  end

  function keys.write(self, section, value)
    if value then
      fs.writefile("/etc/dropbear/authorized_keys", value:gsub("\r\n", "\n"):trim() .. "\n")
    end
  end

  function keys.remove(self, section)
    if keys:formvalue("_keys") then
      fs.remove("/etc/dropbear/authorized_keys")
    end
  end
end


local c = Compound(m)
c.pageaction = false
return c

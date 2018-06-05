return function(form, uci)
	local site = require 'gluon.site_config'

	local owner = uci:get_first("gluon-node-info", "owner")

	local s = form:section(Section, nil, translate(
		'Please provide your contact information here to allow others to contact '
		.. 'you. Note that this information will be visible <em>publicly</em> on '
		.. 'the internet together with your node\'s coordinates. This means it can '
		.. 'be downloaded and processed by anyone. This information is '
		.. 'not required to operate a node. If you chose to enter data, it will be '
		.. 'stored on this node and can be deleted by yourself at any time. '
		.. 'If you don\'t want to provide public information, '
		.. 'please contact us at noc@freifunk-altdorf.de '
		.. 'so at least we know whom to contact in case of problems.'
	))

	local o = s:option(Value, "contact", translate("Contact info"), translate("e.g. E-mail, phone number, nickname, website"))
	o.default = uci:get("gluon-node-info", owner, "contact")
	o.datatype = 'minlength(1)'
	o.optional = true
	function o:write(data)
		if data then
			uci:set("gluon-node-info", owner, "contact", data)
		else
			uci:delete("gluon-node-info", owner, "contact")
		end
	end

	return {'gluon-node-info'}
end

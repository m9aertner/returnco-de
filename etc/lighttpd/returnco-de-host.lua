-- [0-9]+.returnco.de
-- (www.)?.returnco.de:[0-9]+
local host = lighty.request["Host"]
local rc = string.match(host, '^([2-9]%d+)')
if not (rc and string.len(rc) == 3) then
	rc = string.match(host, ':([2-9]%d+)$')
end
if rc and string.len(rc) == 3 then
	lighty.content = { "" }
	lighty.header["X-returnco-de"] = rc
	return tonumber(rc)
else
	return 404
end


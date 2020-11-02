-- /[0-9]+
local header=lighty.env["request.uri"]
local rc = string.match(header, '^/([2-9]%d+)')
if rc and string.len(rc) == 3 then
        lighty.content = { "" }
        lighty.header["X-returnco-de"] = rc
        return tonumber(rc)
end

return 404


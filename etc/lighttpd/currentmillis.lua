-- /1[0-9]+

local header=lighty.env["request.uri"]
local rc = string.match(header, '^/(1%d+)')
local ms = 0
if rc and string.len(rc) > 3 and string.len(rc) <= 10 then
        -- Seconds: 2017-12-15 14:54:09 <-> 1513346049
        ms = 1000 * tonumber(rc)
elseif rc and string.len(rc) > 10 and string.len(rc) <= 13 then
        -- Milliseconds: 2017-12-15 14:54:09.012 <-> 1513346049012
        ms = tonumber(rc)
end

if ms > 0 then
        -- RFC 3339 Date format with fixed-digits seconds fraction
        lighty.content = { os.date("%Y-%m-%dT%H:%M:%S.", ms // 1000) .. string.format("%03i", ms % 1000) .. "Z\n" }
        lighty.header["Content-Type"] = "text/plain"
        return 200
end

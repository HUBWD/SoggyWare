warn('\n\n\n\n\n\n\n\n\n\n')
--Bypass
getfenv().gethui=function()
	return game:GetService"CoreGui";
end;

local text = game:HttpGet("https://soggy-ware.cf/key.html")

local src_start, src_end = text:find('src="')
local key_string = "https://soggy-ware.cf/"
if src_start then
    local quote_start, quote_end = text:find('"', src_end + 1)
    if quote_start then
        key_string..=text:sub(src_end + 1, quote_start - 1)
    end
end

if key_string~="https://soggy-ware.cf/" then
	local text=game:HttpGet(key_string)
	local and_start, and_end = text:find("&&")
	if and_start then
		local quote_start, quote_end = text:find('"', and_end + 1)
		if quote_start then
			local last_quote_start, last_quote_end = text:find('"', quote_end + 1)
			if last_quote_start then
				key_string=text:sub(quote_end + 1, last_quote_start - 1)
			end
		end
	end
end

--Find the UI
local GUI
for index,value in next,game:GetService"CoreGui":GetChildren()do
	local Exec,Check=pcall(function()
		local v_1=value:FindFirstChildWhichIsA("TextBox",true);
		if v_1 then
			for index,value in pairs(v_1.Parent:GetChildren())do
				if value:IsA"TextLabel"and value.Text=="Key System"then
					return v_1;
				end;
			end;
		end;
	end)
	if Check then
		GUI=Check;
	end;
end;

return GUI
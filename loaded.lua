local Link={"https://raw.githubusercontent.com/HUBWD/SoggyWare/main/%s";
			"https://api.github.com/repos/HUBWD/SoggyWare/contents/script"};
local Version,Folder=game:HttpGet(Link[1]:format("version.txt")):gsub("[^%w%p]",""),"HUBWD\\SoggyWare"

for index,value in pairs{"HUBWD";Folder}do
	if not(isfolder(value))then makefolder(value);end;
end;Folder..="\\";
if not(isfile(Folder..'version.txt') and readfile(Folder..'version.txt'):gsub("[^%w%p]","")==Version)then
	local t={"loaded.lua","version.txt"};
	for index,value in next,game:GetService("HttpService"):JSONDecode(game:HttpGet(Link[2]))do
		t[#t+1]=value.path
	end;
	makefolder(Folder..'script')
	for index,value in next,t do
		writefile(
			Folder..value,
			game:HttpGet(Link[1]:format(value))
		);
	end;
end;
for index,value in pairs(listfiles(Folder..'script'))do
	if tostring(game.PlaceId)==value:match(".*\\(.+).lua") then
		dofile(value)
	end;
end;

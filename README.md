## Execution
Here is the code in `loadstring`:
```lua
loadstring("https://raw.githubusercontent.com/HUBWD/SoggyWare/main/loaded.lua")()
```
**If you are unsure how to install, read this first [link](https://github.com/HUBWD/Welcome/blob/main/install.md "link")** 
### Access Difficulty: 1/10
## Information
I ended up doing this script in 3 hours and I must spend 1 hour writing it, this ***cracked*** was made on 12/29/2022 at 07:06 am (Brazil Time Zone)

## Explanation
> Look, it wasn't difficult to get everything, since they try to use an *Anti-HttpSpy*, but it fails in Interface (Because for some reason it only works in standard functions for example: printuiconsole, print, warn, writefile and so on) .

After getting all the links, it was simple to separate what was important and what wasnt, I just saved all the links and the function in the folder called [codes found](https://github.com/HUBWD/SoggyWare/tree/ main/codes%20found "codes found")

##### What would this be?
I don't know if they tried to defend themselves, but they hide the script in the last line of the site, in another explanation too, they use the `--[[message]]` system so that the `loadstring` just reads the script. In the files that I saved, the way they did this.

## Bypass
It wasn't a problem, since Key's system is very weak and uses [Cesar Cipher](https://en.wikipedia.org/wiki/Caesar_cipher) for this, I ended up doing two methods, this one was faster 30 minutes. **First run the Script, otherwise nothing will happen.**

### Method 1:
Their Key system will always be the same, in case they change, the script will continue reading normally ([the original Key's website](https://soggy-ware.cf/getKey)), after that they use a Cesar Cipher that goes 1 to the left or 25 to the right, I ended up doing this Script:
```lua
local Http="https://raw.githubusercontent.com/HUBWD/SoggyWare/main/bypass/%s.lua"
local GUI=loadstring(game:HttpGet(Http:format("GetInterface"),true))();
local Keys=loadstring(game:HttpGet(Http:format("effective%20method"),true))();

if GUI then
	--[[I recommend using the second method.
	for index,value in pairs(Keys)do
		GUI.Text=value;
		wait();
	end;
	]]

	GUI.Text=Keys[25];
end
```
##### Nota: When I made this script the string was from `pdfdjksewn` to `ocecijrdvm`. So that's why there are a total of 26 possibilities, this is in case they change!

### Method 2:
This form uses their website system, capturing the source JS in the HTML and finally filtering to get the main key.
```lua
local Http="https://raw.githubusercontent.com/HUBWD/SoggyWare/main/bypass/%s.lua"
local GUI=loadstring(game:HttpGet(Http:format("GetInterface"),true))();
local Keys=loadstring(game:HttpGet(Http:format("Method%20Http"),true))();

if GUI then
	GUI.Text=Keys;
end
```
#### Nota: There is no failure, but it can happen that they change Link.

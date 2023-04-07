local patterns = { 
	-- ["Original text"] = "Change to",	
	["Middle Mouse"] = "M3",	
	["Mouse Wheel Down"] = "WD",
	["Mouse Wheel Up"] = "WU",
	["Mouse Button "] = "M", -- M4, M5
	["Num Pad "] = "N",
	["a%-"] = "A", -- alt
	["c%-"] = "C", -- ctrl
	["s%-"] = "S", -- shift
}

local bars = {
	"ActionButton",
	"MultiBarBottomLeftButton",
	"MultiBarBottomRightButton",
	"MultiBarLeftButton",
	"MultiBarRightButton",
}

local FONT_SIZE = 13
local FONT_OUTLINE = "OUTLINE"

local function UpdateHotkey(self, actionButtonType)
	local hotkey = self.HotKey
	local text = hotkey:GetText()
	for k, v in pairs(patterns) do
		local modified = text:gsub(k, v)
		if modified ~= text then
			text = modified
		end
	end
	hotkey:SetText(text)
	hotkey:SetVertexColor(1,1,1,0.8)
	hotkey:SetFont("Fonts\\FRIZQT__.TTF", FONT_SIZE, FONT_OUTLINE)
end

for _, bar in pairs(bars) do
	for i = 1, NUM_ACTIONBAR_BUTTONS do
		local button = _G[bar..i]
		hooksecurefunc(button, "UpdateHotkeys", UpdateHotkey)
	end
end
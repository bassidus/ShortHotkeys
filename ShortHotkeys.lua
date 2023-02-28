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

local function UpdateHotkey(self, actionButtonType)
	local hotkey = self.HotKey
	local text = hotkey:GetText()
	for k, v in pairs(patterns) do
		text = text:gsub(k, v)
	end
	hotkey:SetText(text)
	hotkey:SetVertexColor(1,1,1,0.8)
	hotkey:SetFont("Fonts\\FRIZQT__.TTF", 13, "OUTLINE")
end

for _, bar in pairs(bars) do
	for i = 1, NUM_ACTIONBAR_BUTTONS do
		hooksecurefunc(_G[bar..i], "UpdateHotkeys", UpdateHotkey)
	end
end
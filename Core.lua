local addonName = 'ShortHotkeys'
local addon = LibStub('AceAddon-3.0'):NewAddon(addonName, 'AceConsole-3.0', 'AceEvent-3.0')
local frame = CreateFrame('Frame')
local db = nil
local build = select(4, GetBuildInfo());
local _order = 0


local defaults = {
    profile = {
        addon = {
            keymap = _G.SHK_LOCAL
        },
    }
}

local function Description(text)
    _order = _order + 1
    if not text then
        text = '' -- useful for making new row
    end
    return {
        type = 'description', fontSize = 'medium', name = text, order = _order
    }
end

local function InputBox(_name, text)
    _order = _order + 1
    if not text then
        text = _name
    end
    return {
        type = 'input',
        name = text,
        get = function() return db.profile.addon.keymap[_name] end,
        set = function(_, value)
            db.profile.addon.keymap[_name] = value
        end,
        order = _order,
        width = 0.9
    }
end

local options = {
    name = addonName,
    handler = addon,
    type = 'group',
    args = {
        header = Description(_G.SHK_TEXT),
        ibAlt = InputBox(_G.SHK_ALT, _G.SHK_ALT_TEXT),
        ibCtrl = InputBox(_G.SHK_CTRL, _G.SHK_CTRL_TEXT),
        ibShift = InputBox(_G.SHK_SHIFT, _G.SHK_SHIFT_TEXT),
        ibNumPad = InputBox(_G.SHK_NUMPAD),
        l1 = Description(), -- new row

        ibMouse = InputBox(_G.SHK_MOUSE),
        ibM3 = InputBox(_G.KEY_BUTTON3),
        ibWheelUp = InputBox(_G.KEY_MOUSEWHEELUP),
        ibWheelDown = InputBox(_G.KEY_MOUSEWHEELDOWN),
        l2 = Description(), -- new row

        ibBackspace = InputBox(_G.KEY_BACKSPACE),
        ibDelete = InputBox(_G.KEY_DELETE),
        ibEnd = InputBox(_G.KEY_END),
        ibHome = InputBox(_G.KEY_HOME),
        ibInsert = InputBox(_G.KEY_INSERT),
        ibNumlock = InputBox(_G.KEY_NUMLOCK),
        ibPageDown = InputBox(_G.KEY_PAGEDOWN),
        ibPageUp = InputBox(_G.KEY_PAGEUP),
        ibSpace = InputBox(_G.KEY_SPACE),
        ibTab = InputBox(_G.KEY_TAB),
        l3 = Description(), -- new row

        ibUp = InputBox(_G.KEY_UP),
        ibDown = InputBox(_G.KEY_DOWN),
        ibLeft = InputBox(_G.KEY_LEFT),
        ibRight = InputBox(_G.KEY_RIGHT),
        l4 = Description(), -- new row
        tip = Description(_G.SHK_IMPORTANT),
        l5 = Description(), -- new row
        exec = {
            type = 'execute',
            name = 'Reload UI',
            func = function() ReloadUI() end
        }
    }
}

function addon:OnInitialize()
    local aceConfig = LibStub('AceConfig-3.0')
    local aceConfigDialog = LibStub('AceConfigDialog-3.0')
    db = LibStub('AceDB-3.0'):New(addonName .. 'DB', defaults, true)
    aceConfig:RegisterOptionsTable(addonName .. '_Options', options)
    addon.optionsFrame = aceConfigDialog:AddToBlizOptions(addonName .. '_Options', addonName)
    addon:RegisterChatCommand('shk', function()
        Settings.OpenToCategory(addonName)
    end)
end

function frame:OnEvent()
    local function UpdateHotkey(self)
        local hotkey = self.HotKey
        local text = hotkey:GetText()
        for k, v in pairs(db.profile.addon.keymap) do
            text = text:gsub(k, v)
        end
        hotkey:SetText(text)
    end
    if (build >= 100000) then -- Retail
        local action_bars = {
            'ActionButton',
            'MultiBarBottomRightButton',
            'MultiBarLeftButton',
            'MultiBarRightButton',
            'MultiBar5Button',
            'MultiBar6Button',
            'MultiBar7Button',
            'MultiBarBottomLeftButton',
        }
        for _, btn in ipairs(action_bars) do
            for i = 1, NUM_ACTIONBAR_BUTTONS do
                local button = _G[btn .. i]
                if button then
                    hooksecurefunc(button, 'UpdateHotkeys', UpdateHotkey)
                end
            end
        end
    else -- Classic
        hooksecurefunc('ActionButton_UpdateHotkeys', UpdateHotkey)
    end
end

frame:RegisterEvent('ADDON_LOADED')
frame:SetScript('OnEvent', frame.OnEvent)

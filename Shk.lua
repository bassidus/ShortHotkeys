local addonName = ...
local addon = LibStub('AceAddon-3.0'):NewAddon(addonName, 'AceConsole-3.0', 'AceEvent-3.0')
local frame = CreateFrame('Frame')
local isRetail = select(4, GetBuildInfo()) >= 100000
local _order = 0
local db = nil

local defaults = {
    profile = {
        addon = {
            keymap = SHK.LOCAL,
            hideMacro = false
        },
    }
}

local function Reset()
    db.profile.addon.keymap = SHK.LOCAL
    db.profile.addon.hideMacro = false
end

local function HideMacro()
    return db.profile.addon.hideMacro and 0 or 1
end

local function OrderIncrement()
    _order = _order + 1
    return _order
end

local function NewRow(text)
    return {
        type = 'description', fontSize = 'medium', name = text or '', order = OrderIncrement()
    }
end

local function InputBox(_name, text)
    return {
        type = 'input',
        name = text or _name,
        get = function() return db.profile.addon.keymap[_name] end,
        set = function(_, value)
            db.profile.addon.keymap[_name] = value
        end,
        order = OrderIncrement(),
        width = 0.9
    }
end

local options = {
    name = addonName,
    handler = addon,
    type = 'group',
    args = {
        header = NewRow(SHK.TEXT),

        ibAlt = InputBox(SHK.ALT, SHK.ALT_TEXT),
        ibCtrl = InputBox(SHK.CTRL, SHK.CTRL_TEXT),
        ibShift = InputBox(SHK.SHIFT, SHK.SHIFT_TEXT),
        ibNumPad = InputBox(SHK.NUMPAD),
        l1 = NewRow(), -- new row

        ibMouse = InputBox(SHK.MOUSE),
        ibM3 = InputBox(_G.KEY_BUTTON3),
        ibWheelUp = InputBox(_G.KEY_MOUSEWHEELUP),
        ibWheelDown = InputBox(_G.KEY_MOUSEWHEELDOWN),
        l2 = NewRow(), -- new row

        ibBackspace = InputBox(_G.KEY_BACKSPACE),
        ibCapslock = InputBox(_G.CAPSLOCK_KEY_TEXT),
        ibDelete = InputBox(_G.KEY_DELETE),
        ibEnd = InputBox(_G.KEY_END),
        ibHome = InputBox(_G.KEY_HOME),
        ibInsert = InputBox(_G.KEY_INSERT),
        ibNumlock = InputBox(_G.KEY_NUMLOCK),
        ibPageDown = InputBox(_G.KEY_PAGEDOWN),
        ibPageUp = InputBox(_G.KEY_PAGEUP),
        ibSpace = InputBox(_G.KEY_SPACE),
        ibTab = InputBox(_G.KEY_TAB),
        l3 = NewRow(), -- new row

        ibUp = InputBox(_G.KEY_UP),
        ibDown = InputBox(_G.KEY_DOWN),
        ibLeft = InputBox(_G.KEY_LEFT),
        ibRight = InputBox(_G.KEY_RIGHT),
        l4 = NewRow(), -- new row
        tip = NewRow(SHK.IMPORTANT),
        l5 = NewRow(), -- new row
        reload = {
            type = 'execute',
            name = 'Reload UI',
            func = function() ReloadUI() end,
            order = OrderIncrement()
        },
        reset = {
            type = 'execute',
            name = 'Reset to Defaults',
            func = function ()
                Reset()
                ReloadUI()
            end,
            order = OrderIncrement()
        },
        hideMacro = {
            type = "toggle",
            name = "Hide Macro Names",
            desc = 'If checked, macro names will be hidden from action bars',
            get = function() return db.profile.addon.hideMacro end,
            set = function(_, value)
                db.profile.addon.hideMacro = value
            end,
            order = OrderIncrement()
        },
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

local function UpdateHotkey(self)
    local hotkey = self.HotKey
    local text = hotkey:GetText()
    for k, v in pairs(db.profile.addon.keymap) do
        text = text:gsub(k, v)
    end
    hotkey:SetText(text)
end

function frame:OnEvent()
    if (isRetail) then -- Retail
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
            for i = 1, _G.NUM_ACTIONBAR_BUTTONS do
                local button = _G[btn .. i]
                if button then
                    hooksecurefunc(button, 'UpdateHotkeys', UpdateHotkey)
                    _G[btn .. i .. "Name"]:SetAlpha(HideMacro())
                end
            end
        end
    else -- Classic
        hooksecurefunc('ActionButton_UpdateHotkeys', UpdateHotkey)
    end
end

frame:RegisterEvent('ADDON_LOADED')
frame:SetScript('OnEvent', frame.OnEvent)

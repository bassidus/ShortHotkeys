local addonName = ...
local addon = LibStub('AceAddon-3.0'):NewAddon(addonName, 'AceConsole-3.0', 'AceEvent-3.0')
local frame = CreateFrame('Frame')
local isRetail = select(4, GetBuildInfo()) >= 100000
local _order = 0
local db = nil
local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

local defaults = {
    profile = {
        addon = {
            keymap = L.SHK_LOCAL,
            hideMacro = false
        },
    }
}

local function Reset()
    db.profile.addon.keymap = L.SHK_LOCAL
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
        header = NewRow(L.SHK_TEXT),
        hideMacro = {
            type = "toggle",
            name = "Hide Macro Text",
            desc = 'If checked, macro text will be hidden from action bars',
            get = function() return db.profile.addon.hideMacro end,
            set = function(_, value)
                db.profile.addon.hideMacro = value
            end,
            order = OrderIncrement()
        },
        l0 = NewRow(), -- new row

        ibAlt = InputBox(L.SHK_ALT, L.SHK_ALT_TEXT),
        ibCtrl = InputBox(L.SHK_CTRL, L.SHK_CTRL_TEXT),
        ibShift = InputBox(L.SHK_SHIFT, L.SHK_SHIFT_TEXT),
        ibNumPad = InputBox(L.SHK_NUMPAD),
        l1 = NewRow(), -- new row

        ibMouse = InputBox(L.SHK_MOUSE),
        ibM3 = InputBox(L.KEY_BUTTON3),
        ibWheelUp = InputBox(L.KEY_MOUSEWHEELUP),
        ibWheelDown = InputBox(L.KEY_MOUSEWHEELDOWN),
        l2 = NewRow(), -- new row

        ibBackspace = InputBox(L.KEY_BACKSPACE),
        ibCapslock = InputBox(L.CAPSLOCK_KEY_TEXT),
        ibDelete = InputBox(L.KEY_DELETE),
        ibEnd = InputBox(L.KEY_END),
        ibHome = InputBox(L.KEY_HOME),
        ibInsert = InputBox(L.KEY_INSERT),
        ibNumlock = InputBox(L.KEY_NUMLOCK),
        ibPageDown = InputBox(L.KEY_PAGEDOWN),
        ibPageUp = InputBox(L.KEY_PAGEUP),
        ibSpace = InputBox(L.KEY_SPACE),
        ibTab = InputBox(L.KEY_TAB),
        l3 = NewRow(), -- new row

        ibUp = InputBox(L.KEY_UP),
        ibDown = InputBox(L.KEY_DOWN),
        ibLeft = InputBox(L.KEY_LEFT),
        ibRight = InputBox(L.KEY_RIGHT),
        l4 = NewRow(), -- new row
        tip = NewRow(L.SHK_IMPORTANT),
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

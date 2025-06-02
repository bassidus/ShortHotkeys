local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)

L.SHK_TEXT = [[

Here you can customize the keybind text to your liking if you're not satisfied with the defaults.

Tip: If the text exceeds three characters, it will be truncated. Therefore, it's recommended to keep modifier keys to one character and other keys to a maximum of two characters.

]]

L.SHK_IMPORTANT = WrapTextInColorCode('IMPORTANT!', 'FFFF2A2A') .. [[


For every change you make, you need to hit Enter or press 'Okay' in the current text box.

When you are done, a reload of the UI is required to update the changes.

]]

L.SHK_MOUSE = 'Mouse Button ' -- important to leave space at end
L.SHK_NUMPAD = 'Num Pad '     -- important to leave space at end
L.SHK_ALT = 'a%-'
L.SHK_ALT_TEXT = 'ALT'
L.SHK_CTRL = 'c%-'
L.SHK_CTRL_TEXT = 'CTRL'
L.SHK_SHIFT = 's%-'
L.SHK_SHIFT_TEXT = 'SHIFT'

L.SHK_LOCAL = {
    [L.SHK_ALT] = "A",      -- alt
    [L.SHK_CTRL] = "C",     -- ctrl
    [L.SHK_SHIFT] = "S",    -- shift
    [L.SHK_NUMPAD] = 'N',   -- eg N1, N2, ...

    [L.SHK_MOUSE] = 'M',    -- eg M4, M5, ...
    [L.KEY_BUTTON3] = 'M3', -- middle mouse
    [L.KEY_MOUSEWHEELUP] = 'WU',
    [L.KEY_MOUSEWHEELDOWN] = 'WD',

    [L.KEY_BACKSPACE] = "BS",
    [L.CAPSLOCK_KEY_TEXT] = 'CL',
    [L.KEY_DELETE] = "DE",
    [L.KEY_END] = "EN",
    [L.KEY_HOME] = "HM",
    [L.KEY_INSERT] = "IN",
    [L.KEY_NUMLOCK] = "NL",
    [L.KEY_PAGEDOWN] = "PD",
    [L.KEY_PAGEUP] = "PU",
    [L.KEY_SPACE] = "SP",
    [L.KEY_TAB] = "TB",

    [L.KEY_UP] = "UP",    -- up arrow
    [L.KEY_DOWN] = "DN",  -- down arrow
    [L.KEY_LEFT] = "LT",  -- left arrow
    [L.KEY_RIGHT] = "RT", -- right arrow
}

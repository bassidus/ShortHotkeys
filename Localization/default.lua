SHK = {}
SHK.TEXT = [[
Here you can customize the keybind text to your liking if you're not satisfied with the defaults.

Tip: If the text exceeds three characters, it will be truncated. Therefore, it's recommended to keep modifier keys to one character and other keys to a maximum of two characters.

]]

SHK.IMPORTANT = WrapTextInColorCode('IMPORTANT! ', 'FFFF2A2A') .. 'For every change you make, you need to hit Enter or press \'Okay\' in the current text box. When you are done, a reload of the UI is required to update the changes.'

SHK.MOUSE = 'Mouse Button ' -- important to leave space at end
SHK.NUMPAD = 'Num Pad '     -- important to leave space at end
SHK.ALT = 'a%-'
SHK.ALT_TEXT = 'Alt'
SHK.CTRL = 'c%-'
SHK.CTRL_TEXT = 'Ctrl'
SHK.SHIFT = 's%-'
SHK.SHIFT_TEXT = 'Shift'

-- variable names that starts with _G is default blizzard global strings
-- and will be automatically translated

SHK.LOCAL = { -- [KEY] = replace with value
    [SHK.ALT] = "A",      -- alt
    [SHK.CTRL] = "C",     -- ctrl
    [SHK.SHIFT] = "S",    -- shift
    [SHK.NUMPAD] = 'N',   -- eg N1, N2, ...

    [SHK.MOUSE] = 'M',    -- eg M4, M5, ...
    [_G.KEY_BUTTON3] = 'M3', -- middle mouse
    [_G.KEY_MOUSEWHEELUP] = 'WU',
    [_G.KEY_MOUSEWHEELDOWN] = 'WD',

    [_G.KEY_BACKSPACE] = "BS",
    [_G.CAPSLOCK_KEY_TEXT] = 'CL',
    [_G.KEY_DELETE] = "DE",
    [_G.KEY_END] = "EN",
    [_G.KEY_HOME] = "HM",
    [_G.KEY_INSERT] = "IN",
    [_G.KEY_NUMLOCK] = "NL",
    [_G.KEY_PAGEDOWN] = "PD",
    [_G.KEY_PAGEUP] = "PU",
    [_G.KEY_SPACE] = "SP",
    [_G.KEY_TAB] = "TB",

    [_G.KEY_UP] = "UP",    -- up arrow
    [_G.KEY_DOWN] = "DN",  -- down arrow
    [_G.KEY_LEFT] = "LT",  -- left arrow
    [_G.KEY_RIGHT] = "RT", -- right arrow
}

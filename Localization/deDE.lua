-- This file is translated entirely with ChatGPT and probably needs some fixes

if (GetLocale() == "deDE") then
    _G.SHK_TEXT = [[
Hier kannst du den Tastenkürzel-Text nach deinen Wünschen anpassen, falls du mit den Standardwerten nicht zufrieden bist.

Hinweis: Wenn der Text länger als drei Zeichen ist, wird er abgeschnitten. Es wird daher empfohlen, Modifikatortasten auf ein Zeichen und andere Tasten auf maximal zwei Zeichen zu beschränken.

]]


    _G.SHK_IMPORTANT = WrapTextInColorCode('WICHTIG!', 'FFFF2A2A') .. [[ Für jede Änderung, die du vornimmst, musst du Enter drücken oder auf 'Okay' im aktuellen Textfeld klicken. Wenn du fertig bist, ist ein Neuladen der Benutzeroberfläche erforderlich, um die Änderungen zu übernehmen.

]]
    _G.SHK_MOUSE = 'Maustaste '     -- wichtig: Leerzeichen am Ende lassen
    _G.SHK_NUMPAD = 'Ziffernblock ' -- wichtig: Leerzeichen am Ende lassen
    _G.SHK_ALT = 'a%-'
    _G.SHK_ALT_TEXT = 'ALT'
    _G.SHK_CTRL = 'c%-'
    _G.SHK_CTRL_TEXT = 'STRG'
    _G.SHK_SHIFT = 's%-'
    _G.SHK_SHIFT_TEXT = 'UMSCHALT'

    _G.SHK_LOCAL = {
        [_G.SHK_ALT] = "A",      -- Alt
        [_G.SHK_CTRL] = "S",     -- Strg
        [_G.SHK_SHIFT] = "U",    -- Umschalt

        [_G.SHK_NUMPAD] = 'N',   -- z. B. N1, N2, ...
        [_G.SHK_MOUSE] = 'M',    -- z. B. M4, M5, ...
        [_G.KEY_BUTTON3] = 'M3', -- Mittlere Maustaste
        [_G.KEY_MOUSEWHEELUP] = 'MH', -- Mausrad hoch
        [_G.KEY_MOUSEWHEELDOWN] = 'MR', -- Mausrad runter

        [_G.KEY_BACKSPACE] = "RÜ", -- Rücktaste
        [_G.CAPSLOCK_KEY_TEXT] = 'FS', -- Feststelltaste
        [_G.KEY_DELETE] = "EF", -- Entfernen
        [_G.KEY_END] = "EN", -- Ende
        [_G.KEY_HOME] = "P1", -- Pos1 (Home taste)
        [_G.KEY_INSERT] = "EI", -- Einfügen
        [_G.KEY_NUMLOCK] = "NL", --Num lock
        [_G.KEY_PAGEDOWN] = "BR", -- Bild Runter
        [_G.KEY_PAGEUP] = "BH", -- Bild Hoch
        [_G.KEY_SPACE] = "LE", -- Leertaste
        [_G.KEY_TAB] = "TB", -- Tab

        [_G.KEY_UP] = "HO",    -- Hoch
        [_G.KEY_DOWN] = "RU",  -- Runter
        [_G.KEY_LEFT] = "LI",  -- Links
        [_G.KEY_RIGHT] = "RE", -- Rechts
    }
end
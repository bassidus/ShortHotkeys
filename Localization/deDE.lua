-- This file is translated to German by Larsj02 (https://github.com/Larsj02)

if (GetLocale() == "deDE") then
    SHK.TEXT = [[
Hier kannst du den Tastenkürzel-Text nach deinen Wünschen anpassen, falls du mit den Standardwerten nicht zufrieden bist.

Hinweis: Wenn der Text länger als drei Zeichen ist, wird er abgeschnitten. Es wird daher empfohlen, Modifikatortasten auf ein Zeichen und andere Tasten auf maximal zwei Zeichen zu beschränken.

]]
    SHK.IMPORTANT = WrapTextInColorCode('WICHTIG! ', 'FFFF2A2A') .. 'Für jede Änderung, die du vornimmst, musst du Enter drücken oder auf \'Okay\' im aktuellen Textfeld klicken. Wenn du fertig bist, ist ein Neuladen der Benutzeroberfläche erforderlich, um die Änderungen zu übernehmen.'

    SHK.MOUSE = 'Maustaste '     -- wichtig: Leerzeichen am Ende lassen
    SHK.NUMPAD = 'Ziffernblock ' -- wichtig: Leerzeichen am Ende lassen
    SHK.ALT = 'a%-'
    SHK.ALT_TEXT = 'Alt'
    SHK.CTRL = 'c%-'
    SHK.CTRL_TEXT = 'Strg'
    SHK.SHIFT = 's%-'
    SHK.SHIFT_TEXT = 'Umschalt'

    SHK.LOCAL = {
        [SHK.ALT] = "A",      -- Alt
        [SHK.CTRL] = "S",     -- Strg
        [SHK.SHIFT] = "U",    -- Umschalt

        [SHK.NUMPAD] = 'N',   -- z. B. N1, N2, ...
        [SHK.MOUSE] = 'M',    -- z. B. M4, M5, ...
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
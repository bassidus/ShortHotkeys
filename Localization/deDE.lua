local addonName = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "deDE")

L.SHK_TEXT = [[

Hier kannst du den Tastenkürzel-Text nach deinen Wünschen anpassen, falls du mit den Standardwerten nicht zufrieden bist.

Hinweis: Wenn der Text länger als drei Zeichen ist, wird er abgeschnitten. Es wird daher empfohlen, Modifikatortasten auf ein Zeichen und andere Tasten auf maximal zwei Zeichen zu beschränken.

]]


L.SHK_IMPORTANT = WrapTextInColorCode('WICHTIG!', 'FFFF2A2A') .. [[


Für jede Änderung, die du vornimmst, musst du Enter drücken oder auf 'Okay' im aktuellen Textfeld klicken.

Wenn du fertig bist, ist ein Neuladen der Benutzeroberfläche erforderlich, um die Änderungen zu übernehmen.

]]



L.SHK_MOUSE = 'Maustaste '     -- wichtig: Leerzeichen am Ende lassen
L.SHK_NUMPAD = 'Ziffernblock ' -- wichtig: Leerzeichen am Ende lassen
L.SHK_ALT = 'a%-'
L.SHK_ALT_TEXT = 'ALT'
L.SHK_CTRL = 'c%-'
L.SHK_CTRL_TEXT = 'STRG'
L.SHK_SHIFT = 's%-'
L.SHK_SHIFT_TEXT = 'UMSCHALT'

L.SHK_LOCAL = {
    [L.SHK_ALT] = "A",      -- Alt
    [L.SHK_CTRL] = "S",     -- Strg (C is too ambiguous in German, but left as S for "Steuerung")
    [L.SHK_SHIFT] = "U",    -- Umschalt

    [L.SHK_NUMPAD] = 'N',   -- z. B. N1, N2, ...
    [L.SHK_MOUSE] = 'M',    -- z. B. M4, M5, ...
    [L.KEY_BUTTON3] = 'M3', -- Mittlere Maustaste
    [L.KEY_MOUSEWHEELUP] = 'WU',
    [L.KEY_MOUSEWHEELDOWN] = 'WD',

    [L.KEY_BACKSPACE] = "BS",
    [L.CAPSLOCK_KEY_TEXT] = 'CL',
    [L.KEY_DELETE] = "EN", -- Entfernen
    [L.KEY_END] = "EN",
    [L.KEY_HOME] = "HM",
    [L.KEY_INSERT] = "IN",
    [L.KEY_NUMLOCK] = "NL",
    [L.KEY_PAGEDOWN] = "PD",
    [L.KEY_PAGEUP] = "PU",
    [L.KEY_SPACE] = "LE", -- Leertaste
    [L.KEY_TAB] = "TB",

    [L.KEY_UP] = "HO",    -- Hoch
    [L.KEY_DOWN] = "RU",  -- Runter
    [L.KEY_LEFT] = "LI",  -- Links
    [L.KEY_RIGHT] = "RE", -- Rechts
}


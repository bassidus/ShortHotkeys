if (GetLocale() == "ruRU") then -- Translated by ZamestoTV
SHK = {}
SHK.TEXT = 'Здесь вы можете настроить текст привязки клавиш по своему вкусу, если вас не устраивают стандартные значения.\n\n' ..
    WrapTextInColorCode('Совет: ', 'FFD9FF00') .. 'Если текст превышает три символа, он будет усечён. ' ..
    'Поэтому рекомендуется использовать для модификаторов один символ, а для других клавиш не более двух символов.'

SHK.IMPORTANT = WrapTextInColorCode('ВАЖНО! ', 'FFFF2A2A') ..
    'Для каждого изменения необходимо нажать Enter или кнопку \'ОК\' ' ..
    'в текущем текстовом поле. После завершения потребуется перезагрузка интерфейса для обновления изменений.'

SHK.MOUSE = 'Кнопка мыши ' -- important to leave space at end
SHK.NUMPAD = 'Цифровая клавиша ' -- important to leave space at end
SHK.ALT = 'a%-'
SHK.ALT_TEXT = 'Alt'
SHK.CTRL = 'c%-'
SHK.CTRL_TEXT = 'Ctrl'
SHK.SHIFT = 's%-'
SHK.SHIFT_TEXT = 'Shift'

-- variable names that starts with _G is blizzard default global strings and will be automatically translated

SHK.LOCAL = {
    -- [KEY] = replace with value
    [SHK.ALT] = "A",         -- alt
    [SHK.CTRL] = "C",        -- ctrl
    [SHK.SHIFT] = "S",       -- shift
    [SHK.NUMPAD] = 'Н',      -- eg N1, N2, ...

    [SHK.MOUSE] = 'М',       -- eg M4, M5, ...
    [_G.KEY_BUTTON3] = 'М3', -- middle mouse
    [_G.KEY_MOUSEWHEELUP] = 'ВК',
    [_G.KEY_MOUSEWHEELDOWN] = 'НК',

    [_G.KEY_BACKSPACE] = "ЗБ",
    [_G.CAPSLOCK_KEY_TEXT] = 'КЛ',
    [_G.KEY_DELETE] = "УД",
    [_G.KEY_END] = "КН",
    [_G.KEY_HOME] = "ДМ",
    [_G.KEY_INSERT] = "ВС",
    [_G.KEY_NUMLOCK] = "ЧЛ",
    [_G.KEY_PAGEDOWN] = "СВ",
    [_G.KEY_PAGEUP] = "СН",
    [_G.KEY_SPACE] = "ПР",
    [_G.KEY_TAB] = "ТБ",

    [_G.KEY_UP] = "ВВ",    -- up arrow
    [_G.KEY_DOWN] = "ВН",  -- down arrow
    [_G.KEY_LEFT] = "ВЛ",  -- left arrow
    [_G.KEY_RIGHT] = "ВП", -- right arrow
}

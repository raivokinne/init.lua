local lush = require "lush"
local hsl = lush.hsl

local theme = lush(function()
  return {
    -- The background color is dark, possibly black or very dark purple.
    Normal { bg = hsl(270, 50, 10), fg = hsl(0, 0, 80) },

    -- Keywords like "public function", "if" and "throw" are highlighted in light purple color.
    Keyword { fg = hsl(270, 50, 70) },

    -- Variables and function names are displayed in white color.
    Identifier { fg = hsl(0, 0, 100) },

    -- Strings and parameters within functions are highlighted in yellow color.
    String { fg = hsl(50, 100, 50) },

    -- Comments, visible with "//", are displayed in grey color.
    Comment { fg = hsl(0, 0, 50) },
  }
end)

-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

  s(
    { -- Table 1: snippet parameters
      trig="hi",
      dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig=false,
      priority=100,
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t("Hello, world!"), -- A single text node
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),

  s({trig=";a", snippetType="autosnippet"},
    {
      t("\\alpha"),
    }
  ),

  -- Combining text and insert nodes to create basic LaTeX commands
  s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
    {
      t("\\texttt{"), -- remember: backslashes need to be escaped
      i(1),
      t("}"),
    }
  ),
  -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
  -- there is a much better, human-readable solution: ls.fmt, described shortly.
  s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
    {
      t("\\frac{"),
      i(1),  -- insert node 1
      t("}{"),
      i(2),  -- insert node 2
      t("}")
    }
  ),
}




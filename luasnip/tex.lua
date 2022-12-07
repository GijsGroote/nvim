-- For some reason .tex files are not detected with this file here, 26 nov 2022 Gijs Groote
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
local line_begin = require("luasnip.extras.expand_conditions").line_begin
return {

  s(
  {
    trig="ci",
    dscr="citation shortcut",
    regTrig=false,
    priority=100,
  },
  {
    t("\\cite{"), -- remember: backslashes need to be escaped
    i(1),
    t("}"),
  }
  ),
  s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
  {
    t("\\texttt{"),
    i(1),
    t("}"),
  }
  ),
  s({trig="tb", dscr="Expands 'tb' into '\textbf{}'"},
  {
    t("\\textbf{"),
    i(1),
    t("}"),
  }
  ),

  s({trig="todo", dscr="Expands 'todo' into '\todo[inline]{}'"},
  {
    t("\\todo[inline]{"),
    i(1),
    t("}")
  }
  ),
  -- Examples of Greek letter snippets, autotriggered for efficiency
  s({trig=";a", snippetType="autosnippet"},
  {
    t("\\alpha"),
  }
  ),
  s({trig=";b", snippetType="autosnippet"},
  {
    t("\\beta"),
  }
  ),
  s({trig=";g", snippetType="autosnippet"},
  {
    t("\\gamma"),
  }
  ),
  -- create figure environment
  s({trig="fig"},
  {
    t({"\\begin{figure}[H]",
    "    \\centering",
    "    \\includegraphics{figures/}",
    "    \\caption{}",
    "    \\label{}",
    "\\end{figure}"
  }),
}
),

-- create environment
s({trig="env", dscr="create a new environmennt"},
fmta(
[[
\begin{<>}
<>
\end{<>}
]],
{
  i(1),
  i(2),
  rep(1),
}
),
{condition = line_begin}
),

s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
{
  t("\\frac{"),
  i(1),  -- insert node 1
  t("}{"),
  i(2),  -- insert node 2
  t("}")
}
),

s({trig="subfig", dscr="Expands 'subfig' into a subfigure environment"},
t({"\\begin{figure}[H]",
"    \\centering",
"    \\begin{subfigure}{.5\\textwidth}",
"    \\centering",
"    \\includegraphics[width=0.8\\textwidth]{}",
"    \\caption{}",
"    \\label{subfig:}",
"    \\end{subfigure}%",
"",
"    \\begin{subfigure}{.5\\textwidth}",
"    \\centering",
"    \\includegraphics[width=0.8\\textwidth]{}",
"    \\caption{}",
"    \\label{subfig:}",
"    \\end{subfigure}",
"    \\caption{}",
"    \\label{fig:}",
"\\end{figure}"
})
),

s({trig="ref", dscr="Expands 'ref' into '\\cref{}'"},
{
  t("\\cref{"),
  i(1),
  t("}"),
}
),
}


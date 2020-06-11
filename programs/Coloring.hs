{-# OPTIONS_GHC -fno-warn-overlapping-patterns -fno-warn-missing-methods #-}
{-# LANGUAGE TemplateHaskell, QuasiQuotes, FlexibleInstances, BangPatterns, MultiParamTypeClasses #-}

module Coloring where

data Color = Reverse | Bold | Underline | Red | Green | Yellow | GreenBold | Blue
           | Match | RedUnderline | RedBold | Magenta | Cyan

ansi' Reverse   str = "\x1b[7m"++str++"\x1b[0m"
ansi' Bold      str = "\x1b[1m"++str++"\x1b[0m"
ansi' Underline str = "\x1b[4m"++str++"\x1b[0m"
ansi' Red       str = "\x1b[31m"++str++"\x1b[0m"
ansi' RedBold   str = "\x1b[31m\x1b[1m"++str++"\x1b[0m"
ansi' RedUnderline str = "\x1b[31m\x1b[4m"++str++"\x1b[0m"
ansi' Green     str = "\x1b[32m"++str++"\x1b[0m"
ansi' Yellow    str = "\x1b[7m"++str++"\x1b[0m"
ansi' Blue      str = "\x1b[34m"++str++"\x1b[0m"
ansi' Magenta   str = "\x1b[35m"++str++"\x1b[0m"
ansi' Cyan      str = "\x1b[36m"++str++"\x1b[0m"
ansi' GreenBold str = "\x1b[32m\x1b[1m"++str++"\x1b[0m"
ansi' co        str = str

html' Reverse   str = "<u>"++str++"</u>"
html' Bold      str = "<b>"++str++"</b>"
html' Underline str = "<u>"++str++"</u>"
html' Red       str = "<font color=\"orangered\">"++str++"</font>"
html' Green     str = "<font color=\"mediumseagreen\">"++str++"</font>"
html' Yellow    str = "<font color=\"greenyellow\">"++str++"</font>"
html' Blue      str = "<font color=\"royalblue\">"++str++"</font>"
html' Magenta   str = "<font color=\"magenta\">"++str++"</font>"
html' Cyan      str = "<font color=\"darkturquoise\">"++str++"</font>"
html' co        str = str

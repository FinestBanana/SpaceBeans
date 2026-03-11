" -----------------------------------------------------------------------------
" File: spacebeans.vim
" Description: A really dark color scheme based on coffee and fruit colors
" Author: FinestBanana <feinstebanane@gmail.com>
" Source: https://github.com/FinestBanana/SpaceBeans
" Last Modified: 11 Mar 2026
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='spacebeans'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:spacebeans_bold')
  let g:spacebeans_bold=1
endif
if !exists('g:spacebeans_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:spacebeans_italic=1
  else
    let g:spacebeans_italic=0
  endif
endif
if !exists('g:spacebeans_undercurl')
  let g:spacebeans_undercurl=1
endif
if !exists('g:spacebeans_underline')
  let g:spacebeans_underline=1
endif
if !exists('g:spacebeans_inverse')
  let g:spacebeans_inverse=1
endif

if !exists('g:spacebeans_guisp_fallback') || index(['fg', 'bg'], g:spacebeans_guisp_fallback) == -1
  let g:spacebeans_guisp_fallback='NONE'
endif

if !exists('g:spacebeans_improved_strings')
  let g:spacebeans_improved_strings=0
endif

if !exists('g:spacebeans_improved_warnings')
  let g:spacebeans_improved_warnings=0
endif

if !exists('g:spacebeans_termcolors')
  let g:spacebeans_termcolors=256
endif

if !exists('g:spacebeans_invert_indent_guides')
  let g:spacebeans_invert_indent_guides=0
endif

if exists('g:spacebeans_contrast')
  echo 'g:spacebeans_contrast is deprecated; use g:spacebeans_contrast_light and g:spacebeans_contrast_dark instead'
endif

if !exists('g:spacebeans_contrast_dark')
  let g:spacebeans_contrast_dark='regular'
endif

if !exists('g:spacebeans_contrast_light')
  let g:spacebeans_contrast_light='regular'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:sb = {}

" fill it with absolute colors
let s:sb.dark0_hard  = ['#0d0402', 0]       " 13, 4, 2
let s:sb.dark0       = ['#140603', 232]     " 20, 6, 3
let s:sb.dark0_soft  = ['#1d0b05', 233]     " 29, 11, 5
let s:sb.dark1       = ['#250f08', 234]     " 37, 15, 8
let s:sb.dark2       = ['#2e140b', 235]     " 46, 20, 11
let s:sb.dark3       = ['#371a0f', 236]     " 55, 26, 15
let s:sb.dark4       = ['#401f13', 237]     " 64, 31, 19
let s:sb.dark4_256   = ['#401f13', 237]     " 64, 31, 19

let s:sb.gray_248    = ['#a08d83', 248]     " 160, 141, 131
let s:sb.gray_242    = ['#84746c', 242]     " 132, 116, 108

let s:sb.light0_hard = ['#bea287', 180]     " 190, 162, 135
let s:sb.light0      = ['#b79c82', 144]     " 183, 156, 130
let s:sb.light0_soft = ['#ae947b', 138]     " 174, 148, 123
let s:sb.light1      = ['#a58c75', 95]      " 165, 140, 117
let s:sb.light2      = ['#9c856f', 137]     " 156, 133, 111
let s:sb.light3      = ['#937d68', 102]     " 147, 125, 104
let s:sb.light4      = ['#8b7662', 101]     " 139, 118, 98
let s:sb.light4_256  = ['#8b7662', 101]     " 139, 118, 98

let s:sb.bright_red     = ['#eb666a', 167]     " 235, 102, 106
let s:sb.bright_green   = ['#83ae65', 107]     " 131, 174, 101
let s:sb.bright_yellow  = ['#eed455', 228]     " 238, 212, 85
let s:sb.bright_blue    = ['#7f9ff9', 111]     " 127, 159, 249
let s:sb.bright_purple  = ['#c78cad', 175]     " 199, 140, 173
let s:sb.bright_cyan    = ['#4cccba', 80]      " 76, 204, 186
let s:sb.bright_orange  = ['#e68e32', 215]     " 230, 142, 50

let s:sb.neutral_red    = ['#e22e37', 161]     " 226, 46, 55
let s:sb.neutral_green  = ['#5f8049', 65]      " 95, 128, 73
let s:sb.neutral_yellow = ['#ffe24c', 221]     " 255, 226, 76
let s:sb.neutral_blue   = ['#5387f7', 69]      " 83, 135, 247
let s:sb.neutral_purple = ['#533045', 96]      " 83, 48, 69
let s:sb.neutral_cyan   = ['#00fee4', 50]      " 0, 254, 228
let s:sb.neutral_orange = ['#ff9800', 208]     " 255, 152, 0

let s:sb.faded_red      = ['#66060c', 52]      " 102, 6, 12
let s:sb.faded_green    = ['#25351b', 22]      " 37, 53, 27
let s:sb.faded_yellow   = ['#383000', 136]     " 56, 48, 0
let s:sb.faded_blue     = ['#0a2e66', 17]      " 10, 46, 102
let s:sb.faded_purple   = ['#452639', 53]      " 69, 38, 57
let s:sb.faded_cyan     = ['#003731', 23]      " 0, 55, 49
let s:sb.faded_orange   = ['#4a2800', 94]      " 74, 40, 0

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:spacebeans_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:spacebeans_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:spacebeans_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:spacebeans_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:spacebeans_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:sb.dark0
  if g:spacebeans_contrast_dark == 'pastel'
    let s:bg0  = s:sb.dark0_soft
  elseif g:spacebeans_contrast_dark == 'intense'
    let s:bg0  = s:sb.dark0_hard
  endif

  let s:bg1  = s:sb.dark1
  let s:bg2  = s:sb.dark2
  let s:bg3  = s:sb.dark3
  let s:bg4  = s:sb.dark4

  let s:gray = s:sb.gray_248

  let s:fg0 = s:sb.light0
  let s:fg1 = s:sb.light1
  let s:fg2 = s:sb.light2
  let s:fg3 = s:sb.light3
  let s:fg4 = s:sb.light4

  let s:fg4_256 = s:sb.light4_256

  let s:red    = s:sb.bright_red
  let s:green  = s:sb.bright_green
  let s:yellow = s:sb.bright_yellow
  let s:blue   = s:sb.bright_blue
  let s:purple = s:sb.bright_purple
  let s:cyan   = s:sb.bright_cyan
  let s:orange = s:sb.bright_orange
else
  let s:bg0  = s:sb.light0
  if g:spacebeans_contrast_light == 'pastel'
    let s:bg0  = s:sb.light0_soft
  elseif g:spacebeans_contrast_light == 'intense'
    let s:bg0  = s:sb.light0_hard
  endif

  let s:bg1  = s:sb.light1
  let s:bg2  = s:sb.light2
  let s:bg3  = s:sb.light3
  let s:bg4  = s:sb.light4

  let s:gray = s:sb.gray_242

  let s:fg0 = s:sb.dark0
  let s:fg1 = s:sb.dark1
  let s:fg2 = s:sb.dark2
  let s:fg3 = s:sb.dark3
  let s:fg4 = s:sb.dark4

  let s:fg4_256 = s:sb.dark4_256

  let s:red    = s:sb.faded_red
  let s:green  = s:sb.faded_green
  let s:yellow = s:sb.faded_yellow
  let s:blue   = s:sb.faded_blue
  let s:purple = s:sb.faded_purple
  let s:cyan   = s:sb.faded_cyan
  let s:orange = s:sb.faded_orange
endif

" reset to 16 colors fallback
if g:spacebeans_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:cyan[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:sb.bg0 = s:bg0
let s:sb.bg1 = s:bg1
let s:sb.bg2 = s:bg2
let s:sb.bg3 = s:bg3
let s:sb.bg4 = s:bg4

let s:sb.gray = s:gray

let s:sb.fg0 = s:fg0
let s:sb.fg1 = s:fg1
let s:sb.fg2 = s:fg2
let s:sb.fg3 = s:fg3
let s:sb.fg4 = s:fg4

let s:sb.fg4_256 = s:fg4_256

let s:sb.red    = s:red
let s:sb.green  = s:green
let s:sb.yellow = s:yellow
let s:sb.blue   = s:blue
let s:sb.purple = s:purple
let s:sb.cyan   = s:cyan
let s:sb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:sb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:sb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:sb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:sb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:sb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:sb.neutral_cyan[0]
  let g:terminal_color_14 = s:cyan[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:spacebeans_hls_cursor')
  let s:hls_cursor = get(s:sb, g:spacebeans_hls_cursor)
endif

let s:number_column = s:none
if exists('g:spacebeans_number_column')
  let s:number_column = get(s:sb, g:spacebeans_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:spacebeans_sign_column')
    let s:sign_column = get(s:sb, g:spacebeans_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:spacebeans_color_column')
  let s:color_column = get(s:sb, g:spacebeans_color_column)
endif

let s:vert_split = s:bg0
if exists('g:spacebeans_vert_split')
  let s:vert_split = get(s:sb, g:spacebeans_vert_split)
endif

let s:invert_signs = ''
if exists('g:spacebeans_invert_signs')
  if g:spacebeans_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:spacebeans_invert_selection')
  if g:spacebeans_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:spacebeans_invert_tabline')
  if g:spacebeans_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:spacebeans_italicize_comments')
  if g:spacebeans_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:spacebeans_italicize_strings')
  if g:spacebeans_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:spacebeans_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:spacebeans_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Spacebeans Hi Groups: {{{

" memoize common hi groups
call s:HL('SpacebeansFg0', s:fg0)
call s:HL('SpacebeansFg1', s:fg1)
call s:HL('SpacebeansFg2', s:fg2)
call s:HL('SpacebeansFg3', s:fg3)
call s:HL('SpacebeansFg4', s:fg4)
call s:HL('SpacebeansGray', s:gray)
call s:HL('SpacebeansBg0', s:bg0)
call s:HL('SpacebeansBg1', s:bg1)
call s:HL('SpacebeansBg2', s:bg2)
call s:HL('SpacebeansBg3', s:bg3)
call s:HL('SpacebeansBg4', s:bg4)

call s:HL('SpacebeansRed', s:red)
call s:HL('SpacebeansRedBold', s:red, s:none, s:bold)
call s:HL('SpacebeansGreen', s:green)
call s:HL('SpacebeansGreenBold', s:green, s:none, s:bold)
call s:HL('SpacebeansYellow', s:yellow)
call s:HL('SpacebeansYellowBold', s:yellow, s:none, s:bold)
call s:HL('SpacebeansBlue', s:blue)
call s:HL('SpacebeansBlueBold', s:blue, s:none, s:bold)
call s:HL('SpacebeansPurple', s:purple)
call s:HL('SpacebeansPurpleBold', s:purple, s:none, s:bold)
call s:HL('SpacebeansCyan', s:cyan)
call s:HL('SpacebeansCyanBold', s:cyan, s:none, s:bold)
call s:HL('SpacebeansOrange', s:orange)
call s:HL('SpacebeansOrangeBold', s:orange, s:none, s:bold)

call s:HL('SpacebeansRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('SpacebeansGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('SpacebeansYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('SpacebeansBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('SpacebeansPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('SpacebeansCyanSign', s:cyan, s:sign_column, s:invert_signs)
call s:HL('SpacebeansOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background:
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:fg0, s:bg1)
endif

hi! link NonText SpacebeansBg2
hi! link SpecialKey SpacebeansBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory SpacebeansGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title SpacebeansGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg SpacebeansYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg SpacebeansYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question SpacebeansOrangeBold
" Warning messages
hi! link WarningMsg SpacebeansRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:spacebeans_improved_strings == 0
  hi! link Special SpacebeansOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement SpacebeansRed
" if, then, else, endif, swicth, etc.
hi! link Conditional SpacebeansRed
" for, do, while, etc.
hi! link Repeat SpacebeansRed
" case, default, etc.
hi! link Label SpacebeansRed
" try, catch, throw
hi! link Exception SpacebeansRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword SpacebeansRed

" Variable name
hi! link Identifier SpacebeansBlue
" Function name
hi! link Function SpacebeansGreenBold

" Generic preprocessor
hi! link PreProc SpacebeansCyan
" Preprocessor #include
hi! link Include SpacebeansCyan
" Preprocessor #define
hi! link Define SpacebeansCyan
" Same as Define
hi! link Macro SpacebeansCyan
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit SpacebeansCyan

" Generic constant
hi! link Constant SpacebeansPurple
" Character constant: 'c', '/n'
hi! link Character SpacebeansPurple
" String constant: "this is a string"
if g:spacebeans_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean SpacebeansPurple
" Number constant: 233, 0xff
hi! link Number SpacebeansPurple
" Floating point constant: 2.3e10
hi! link Float SpacebeansPurple

" Generic type
hi! link Type SpacebeansYellow
" static, register, volatile, etc
hi! link StorageClass SpacebeansOrange
" struct, union, enum, etc.
hi! link Structure SpacebeansCyan
" typedef
hi! link Typedef SpacebeansYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:cyan, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:spacebeans_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:cyan)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:spacebeans_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#5387f7'], ['magenta', '#533045'],
      \ ['red',  '#e22e37'], ['172',     '#ff9800']
    \ ]
endif

let g:rainbow_guifgs = [ '#ff9800', '#e22e37', '#533045', '#5387f7' ]
let g:rainbow_ctermfgs = [ '172', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd SpacebeansGreenSign
hi! link GitGutterChange SpacebeansCyanSign
hi! link GitGutterDelete SpacebeansRedSign
hi! link GitGutterChangeDelete SpacebeansCyanSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile SpacebeansGreen
hi! link gitcommitDiscardedFile SpacebeansRed

" }}}
" Signify: {{{

hi! link SignifySignAdd SpacebeansGreenSign
hi! link SignifySignChange SpacebeansCyanSign
hi! link SignifySignDelete SpacebeansRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign SpacebeansRedSign
hi! link SyntasticWarningSign SpacebeansYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   SpacebeansBlueSign
hi! link SignatureMarkerText SpacebeansPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl SpacebeansBlueSign
hi! link ShowMarksHLu SpacebeansBlueSign
hi! link ShowMarksHLo SpacebeansBlueSign
hi! link ShowMarksHLm SpacebeansBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch SpacebeansYellow
hi! link CtrlPNoEntries SpacebeansRed
hi! link CtrlPPrtBase SpacebeansBg2
hi! link CtrlPPrtCursor SpacebeansBlue
hi! link CtrlPLinePre SpacebeansBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket SpacebeansFg3
hi! link StartifyFile SpacebeansFg1
hi! link StartifyNumber SpacebeansBlue
hi! link StartifyPath SpacebeansGray
hi! link StartifySlash SpacebeansGray
hi! link StartifySection SpacebeansYellow
hi! link StartifySpecial SpacebeansBg2
hi! link StartifyHeader SpacebeansOrange
hi! link StartifyFooter SpacebeansBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:cyan[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:cyan[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign SpacebeansRedSign
hi! link ALEWarningSign SpacebeansYellowSign
hi! link ALEInfoSign SpacebeansBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail SpacebeansCyan
hi! link DirvishArg SpacebeansYellow

" }}}
" Netrw: {{{

hi! link netrwDir SpacebeansCyan
hi! link netrwClassify SpacebeansCyan
hi! link netrwLink SpacebeansGray
hi! link netrwSymLink SpacebeansFg1
hi! link netrwExe SpacebeansYellow
hi! link netrwComment SpacebeansGray
hi! link netrwList SpacebeansBlue
hi! link netrwHelpCmd SpacebeansCyan
hi! link netrwCmdSep SpacebeansFg3
hi! link netrwVersion SpacebeansGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir SpacebeansCyan
hi! link NERDTreeDirSlash SpacebeansCyan

hi! link NERDTreeOpenable SpacebeansOrange
hi! link NERDTreeClosable SpacebeansOrange

hi! link NERDTreeFile SpacebeansFg1
hi! link NERDTreeExecFile SpacebeansYellow

hi! link NERDTreeUp SpacebeansGray
hi! link NERDTreeCWD SpacebeansGreen
hi! link NERDTreeHelp SpacebeansFg1

hi! link NERDTreeToggleOn SpacebeansGreen
hi! link NERDTreeToggleOff SpacebeansRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign SpacebeansRedSign
hi! link CocWarningSign SpacebeansOrangeSign
hi! link CocInfoSign SpacebeansYellowSign
hi! link CocHintSign SpacebeansBlueSign
hi! link CocErrorFloat SpacebeansRed
hi! link CocWarningFloat SpacebeansOrange
hi! link CocInfoFloat SpacebeansYellow
hi! link CocHintFloat SpacebeansBlue
hi! link CocDiagnosticsError SpacebeansRed
hi! link CocDiagnosticsWarning SpacebeansOrange
hi! link CocDiagnosticsInfo SpacebeansYellow
hi! link CocDiagnosticsHint SpacebeansBlue

hi! link CocSelectedText SpacebeansRed
hi! link CocCodeLens SpacebeansGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded SpacebeansGreen
hi! link diffRemoved SpacebeansRed
hi! link diffChanged SpacebeansCyan

hi! link diffFile SpacebeansOrange
hi! link diffNewFile SpacebeansYellow

hi! link diffLine SpacebeansBlue

" }}}
" Html: {{{

hi! link htmlTag SpacebeansBlue
hi! link htmlEndTag SpacebeansBlue

hi! link htmlTagName SpacebeansCyanBold
hi! link htmlArg SpacebeansCyan

hi! link htmlScriptTag SpacebeansPurple
hi! link htmlTagN SpacebeansFg1
hi! link htmlSpecialTagName SpacebeansCyanBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar SpacebeansOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag SpacebeansBlue
hi! link xmlEndTag SpacebeansBlue
hi! link xmlTagName SpacebeansBlue
hi! link xmlEqual SpacebeansBlue
hi! link docbkKeyword SpacebeansCyanBold

hi! link xmlDocTypeDecl SpacebeansGray
hi! link xmlDocTypeKeyword SpacebeansPurple
hi! link xmlCdataStart SpacebeansGray
hi! link xmlCdataCdata SpacebeansPurple
hi! link dtdFunction SpacebeansGray
hi! link dtdTagName SpacebeansPurple

hi! link xmlAttrib SpacebeansCyan
hi! link xmlProcessingDelim SpacebeansGray
hi! link dtdParamEntityPunct SpacebeansGray
hi! link dtdParamEntityDPunct SpacebeansGray
hi! link xmlAttribPunct SpacebeansGray

hi! link xmlEntity SpacebeansOrange
hi! link xmlEntityPunct SpacebeansOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation SpacebeansOrange
hi! link vimBracket SpacebeansOrange
hi! link vimMapModKey SpacebeansOrange
hi! link vimFuncSID SpacebeansFg3
hi! link vimSetSep SpacebeansFg3
hi! link vimSep SpacebeansFg3
hi! link vimContinue SpacebeansFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword SpacebeansBlue
hi! link clojureCond SpacebeansOrange
hi! link clojureSpecial SpacebeansOrange
hi! link clojureDefine SpacebeansOrange

hi! link clojureFunc SpacebeansYellow
hi! link clojureRepeat SpacebeansYellow
hi! link clojureCharacter SpacebeansCyan
hi! link clojureStringEscape SpacebeansCyan
hi! link clojureException SpacebeansRed

hi! link clojureRegexp SpacebeansCyan
hi! link clojureRegexpEscape SpacebeansCyan
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen SpacebeansFg3
hi! link clojureAnonArg SpacebeansYellow
hi! link clojureVariable SpacebeansBlue
hi! link clojureMacro SpacebeansOrange

hi! link clojureMeta SpacebeansYellow
hi! link clojureDeref SpacebeansYellow
hi! link clojureQuote SpacebeansYellow
hi! link clojureUnquote SpacebeansYellow

" }}}
" C: {{{

hi! link cOperator SpacebeansPurple
hi! link cStructure SpacebeansOrange

" }}}
" Python: {{{

hi! link pythonBuiltin SpacebeansOrange
hi! link pythonBuiltinObj SpacebeansOrange
hi! link pythonBuiltinFunc SpacebeansOrange
hi! link pythonFunction SpacebeansCyan
hi! link pythonDecorator SpacebeansRed
hi! link pythonInclude SpacebeansBlue
hi! link pythonImport SpacebeansBlue
hi! link pythonRun SpacebeansBlue
hi! link pythonCoding SpacebeansBlue
hi! link pythonOperator SpacebeansRed
hi! link pythonException SpacebeansRed
hi! link pythonExceptions SpacebeansPurple
hi! link pythonBoolean SpacebeansPurple
hi! link pythonDot SpacebeansFg3
hi! link pythonConditional SpacebeansRed
hi! link pythonRepeat SpacebeansRed
hi! link pythonDottedName SpacebeansGreenBold

" }}}
" CSS: {{{

hi! link cssBraces SpacebeansBlue
hi! link cssFunctionName SpacebeansYellow
hi! link cssIdentifier SpacebeansOrange
hi! link cssClassName SpacebeansGreen
hi! link cssColor SpacebeansBlue
hi! link cssSelectorOp SpacebeansBlue
hi! link cssSelectorOp2 SpacebeansBlue
hi! link cssImportant SpacebeansGreen
hi! link cssVendor SpacebeansFg1

hi! link cssTextProp SpacebeansCyan
hi! link cssAnimationProp SpacebeansCyan
hi! link cssUIProp SpacebeansYellow
hi! link cssTransformProp SpacebeansCyan
hi! link cssTransitionProp SpacebeansCyan
hi! link cssPrintProp SpacebeansCyan
hi! link cssPositioningProp SpacebeansYellow
hi! link cssBoxProp SpacebeansCyan
hi! link cssFontDescriptorProp SpacebeansCyan
hi! link cssFlexibleBoxProp SpacebeansCyan
hi! link cssBorderOutlineProp SpacebeansCyan
hi! link cssBackgroundProp SpacebeansCyan
hi! link cssMarginProp SpacebeansCyan
hi! link cssListProp SpacebeansCyan
hi! link cssTableProp SpacebeansCyan
hi! link cssFontProp SpacebeansCyan
hi! link cssPaddingProp SpacebeansCyan
hi! link cssDimensionProp SpacebeansCyan
hi! link cssRenderProp SpacebeansCyan
hi! link cssColorProp SpacebeansCyan
hi! link cssGeneratedContentProp SpacebeansCyan

" }}}
" JavaScript: {{{

hi! link javaScriptBraces SpacebeansFg1
hi! link javaScriptFunction SpacebeansCyan
hi! link javaScriptIdentifier SpacebeansRed
hi! link javaScriptMember SpacebeansBlue
hi! link javaScriptNumber SpacebeansPurple
hi! link javaScriptNull SpacebeansPurple
hi! link javaScriptParens SpacebeansFg3

" }}}
" YAJS: {{{

hi! link javascriptImport SpacebeansCyan
hi! link javascriptExport SpacebeansCyan
hi! link javascriptClassKeyword SpacebeansCyan
hi! link javascriptClassExtends SpacebeansCyan
hi! link javascriptDefault SpacebeansCyan

hi! link javascriptClassName SpacebeansYellow
hi! link javascriptClassSuperName SpacebeansYellow
hi! link javascriptGlobal SpacebeansYellow

hi! link javascriptEndColons SpacebeansFg1
hi! link javascriptFuncArg SpacebeansFg1
hi! link javascriptGlobalMethod SpacebeansFg1
hi! link javascriptNodeGlobal SpacebeansFg1
hi! link javascriptBOMWindowProp SpacebeansFg1
hi! link javascriptArrayMethod SpacebeansFg1
hi! link javascriptArrayStaticMethod SpacebeansFg1
hi! link javascriptCacheMethod SpacebeansFg1
hi! link javascriptDateMethod SpacebeansFg1
hi! link javascriptMathStaticMethod SpacebeansFg1

" hi! link javascriptProp SpacebeansFg1
hi! link javascriptURLUtilsProp SpacebeansFg1
hi! link javascriptBOMNavigatorProp SpacebeansFg1
hi! link javascriptDOMDocMethod SpacebeansFg1
hi! link javascriptDOMDocProp SpacebeansFg1
hi! link javascriptBOMLocationMethod SpacebeansFg1
hi! link javascriptBOMWindowMethod SpacebeansFg1
hi! link javascriptStringMethod SpacebeansFg1

hi! link javascriptVariable SpacebeansOrange
" hi! link javascriptVariable SpacebeansRed
" hi! link javascriptIdentifier SpacebeansOrange
" hi! link javascriptClassSuper SpacebeansOrange
hi! link javascriptIdentifier SpacebeansOrange
hi! link javascriptClassSuper SpacebeansOrange

" hi! link javascriptFuncKeyword SpacebeansOrange
" hi! link javascriptAsyncFunc SpacebeansOrange
hi! link javascriptFuncKeyword SpacebeansCyan
hi! link javascriptAsyncFunc SpacebeansCyan
hi! link javascriptClassStatic SpacebeansOrange

hi! link javascriptOperator SpacebeansRed
hi! link javascriptForOperator SpacebeansRed
hi! link javascriptYield SpacebeansRed
hi! link javascriptExceptions SpacebeansRed
hi! link javascriptMessage SpacebeansRed

hi! link javascriptTemplateSB SpacebeansCyan
hi! link javascriptTemplateSubstitution SpacebeansFg1

" hi! link javascriptLabel SpacebeansBlue
" hi! link javascriptObjectLabel SpacebeansBlue
" hi! link javascriptPropertyName SpacebeansBlue
hi! link javascriptLabel SpacebeansFg1
hi! link javascriptObjectLabel SpacebeansFg1
hi! link javascriptPropertyName SpacebeansFg1

hi! link javascriptLogicSymbols SpacebeansFg1
hi! link javascriptArrowFunc SpacebeansYellow

hi! link javascriptDocParamName SpacebeansFg4
hi! link javascriptDocTags SpacebeansFg4
hi! link javascriptDocNotation SpacebeansFg4
hi! link javascriptDocParamType SpacebeansFg4
hi! link javascriptDocNamedParamType SpacebeansFg4

hi! link javascriptBrackets SpacebeansFg1
hi! link javascriptDOMElemAttrs SpacebeansFg1
hi! link javascriptDOMEventMethod SpacebeansFg1
hi! link javascriptDOMNodeMethod SpacebeansFg1
hi! link javascriptDOMStorageMethod SpacebeansFg1
hi! link javascriptHeadersMethod SpacebeansFg1

hi! link javascriptAsyncFuncKeyword SpacebeansRed
hi! link javascriptAwaitFuncKeyword SpacebeansRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword SpacebeansCyan
hi! link jsExtendsKeyword SpacebeansCyan
hi! link jsExportDefault SpacebeansCyan
hi! link jsTemplateBraces SpacebeansCyan
hi! link jsGlobalNodeObjects SpacebeansFg1
hi! link jsGlobalObjects SpacebeansFg1
hi! link jsFunction SpacebeansCyan
hi! link jsFuncParens SpacebeansFg3
hi! link jsParens SpacebeansFg3
hi! link jsNull SpacebeansPurple
hi! link jsUndefined SpacebeansPurple
hi! link jsClassDefinition SpacebeansYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved SpacebeansCyan
hi! link typeScriptLabel SpacebeansCyan
hi! link typeScriptFuncKeyword SpacebeansCyan
hi! link typeScriptIdentifier SpacebeansOrange
hi! link typeScriptBraces SpacebeansFg1
hi! link typeScriptEndColons SpacebeansFg1
hi! link typeScriptDOMObjects SpacebeansFg1
hi! link typeScriptAjaxMethods SpacebeansFg1
hi! link typeScriptLogicSymbols SpacebeansFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects SpacebeansFg1
hi! link typeScriptParens SpacebeansFg3
hi! link typeScriptOpSymbols SpacebeansFg3
hi! link typeScriptHtmlElemProperties SpacebeansFg1
hi! link typeScriptNull SpacebeansPurple
hi! link typeScriptInterpolationDelimiter SpacebeansCyan

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword SpacebeansCyan
hi! link purescriptModuleName SpacebeansFg1
hi! link purescriptWhere SpacebeansCyan
hi! link purescriptDelimiter SpacebeansFg4
hi! link purescriptType SpacebeansFg1
hi! link purescriptImportKeyword SpacebeansCyan
hi! link purescriptHidingKeyword SpacebeansCyan
hi! link purescriptAsKeyword SpacebeansCyan
hi! link purescriptStructure SpacebeansCyan
hi! link purescriptOperator SpacebeansBlue

hi! link purescriptTypeVar SpacebeansFg1
hi! link purescriptConstructor SpacebeansFg1
hi! link purescriptFunction SpacebeansFg1
hi! link purescriptConditional SpacebeansOrange
hi! link purescriptBacktick SpacebeansOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp SpacebeansFg3
hi! link coffeeSpecialOp SpacebeansFg3
hi! link coffeeCurly SpacebeansOrange
hi! link coffeeParen SpacebeansFg3
hi! link coffeeBracket SpacebeansOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter SpacebeansGreen
hi! link rubyInterpolationDelimiter SpacebeansCyan

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier SpacebeansRed
hi! link objcDirective SpacebeansBlue

" }}}
" Go: {{{

hi! link goDirective SpacebeansCyan
hi! link goConstants SpacebeansPurple
hi! link goDeclaration SpacebeansRed
hi! link goDeclType SpacebeansBlue
hi! link goBuiltins SpacebeansOrange

" }}}
" Lua: {{{

hi! link luaIn SpacebeansRed
hi! link luaFunction SpacebeansCyan
hi! link luaTable SpacebeansOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp SpacebeansFg3
hi! link moonExtendedOp SpacebeansFg3
hi! link moonFunction SpacebeansFg3
hi! link moonObject SpacebeansYellow

" }}}
" Java: {{{

hi! link javaAnnotation SpacebeansBlue
hi! link javaDocTags SpacebeansCyan
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen SpacebeansFg3
hi! link javaParen1 SpacebeansFg3
hi! link javaParen2 SpacebeansFg3
hi! link javaParen3 SpacebeansFg3
hi! link javaParen4 SpacebeansFg3
hi! link javaParen5 SpacebeansFg3
hi! link javaOperator SpacebeansOrange

hi! link javaVarArg SpacebeansGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter SpacebeansGreen
hi! link elixirInterpolationDelimiter SpacebeansCyan

hi! link elixirModuleDeclaration SpacebeansYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition SpacebeansFg1
hi! link scalaCaseFollowing SpacebeansFg1
hi! link scalaCapitalWord SpacebeansFg1
hi! link scalaTypeExtension SpacebeansFg1

hi! link scalaKeyword SpacebeansRed
hi! link scalaKeywordModifier SpacebeansRed

hi! link scalaSpecial SpacebeansCyan
hi! link scalaOperator SpacebeansFg1

hi! link scalaTypeDeclaration SpacebeansYellow
hi! link scalaTypeTypePostDeclaration SpacebeansYellow

hi! link scalaInstanceDeclaration SpacebeansFg1
hi! link scalaInterpolation SpacebeansCyan

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 SpacebeansGreenBold
hi! link markdownH2 SpacebeansGreenBold
hi! link markdownH3 SpacebeansYellowBold
hi! link markdownH4 SpacebeansYellowBold
hi! link markdownH5 SpacebeansYellow
hi! link markdownH6 SpacebeansYellow

hi! link markdownCode SpacebeansCyan
hi! link markdownCodeBlock SpacebeansCyan
hi! link markdownCodeDelimiter SpacebeansCyan

hi! link markdownBlockquote SpacebeansGray
hi! link markdownListMarker SpacebeansGray
hi! link markdownOrderedListMarker SpacebeansGray
hi! link markdownRule SpacebeansGray
hi! link markdownHeadingRule SpacebeansGray

hi! link markdownUrlDelimiter SpacebeansFg3
hi! link markdownLinkDelimiter SpacebeansFg3
hi! link markdownLinkTextDelimiter SpacebeansFg3

hi! link markdownHeadingDelimiter SpacebeansOrange
hi! link markdownUrl SpacebeansPurple
hi! link markdownUrlTitleDelimiter SpacebeansGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType SpacebeansYellow
" hi! link haskellOperators SpacebeansOrange
" hi! link haskellConditional SpacebeansCyan
" hi! link haskellLet SpacebeansOrange
"
hi! link haskellType SpacebeansFg1
hi! link haskellIdentifier SpacebeansFg1
hi! link haskellSeparator SpacebeansFg1
hi! link haskellDelimiter SpacebeansFg4
hi! link haskellOperators SpacebeansBlue
"
hi! link haskellBacktick SpacebeansOrange
hi! link haskellStatement SpacebeansOrange
hi! link haskellConditional SpacebeansOrange

hi! link haskellLet SpacebeansCyan
hi! link haskellDefault SpacebeansCyan
hi! link haskellWhere SpacebeansCyan
hi! link haskellBottom SpacebeansCyan
hi! link haskellBlockKeywords SpacebeansCyan
hi! link haskellImportKeywords SpacebeansCyan
hi! link haskellDeclKeyword SpacebeansCyan
hi! link haskellDeriving SpacebeansCyan
hi! link haskellAssocType SpacebeansCyan

hi! link haskellNumber SpacebeansPurple
hi! link haskellPragma SpacebeansPurple

hi! link haskellString SpacebeansGreen
hi! link haskellChar SpacebeansGreen

" }}}
" Json: {{{

hi! link jsonKeyword SpacebeansGreen
hi! link jsonQuote SpacebeansGreen
hi! link jsonBraces SpacebeansFg1
hi! link jsonString SpacebeansFg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! SpacebeansHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! SpacebeansHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:

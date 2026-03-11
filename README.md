# Space Beans
A really dark color scheme based on coffee and fruit colors.

## Install
Simply copy the respective spacebeans.vim file to<br>
.config/nvim/colors/<br>
and<br>
.config/nvim/autoload/<br>
.

## Dark/Light
The default mode is dark. If you want to set light mode as standard you can define it in your .vimrc, init.lua or whatever your config file name is. :information_desk_person::laughing:<br>
For vimscript set:
```
set background=light
```
For lua set:
```
vim.opt.background="light"
```

To toggle between dark and light just execute the following commands in your running vim session.
Dark mode vim command:
```
:set background=dark
```
Light mode vim command:
```
:set background=light
```

## Modes
In order to select a specific mode (regular, intense or pastel) add the following command to your .vimrc or init.lua.<br>
vimscript:
```
let g:spacebeans_contrast_dark='intense'
```
lua:
```
vim.api.nvim_set_var('spacebeans_contrast_dark', 'intense')
```

## Credit
The code of the .vim files is forked from Gruvbox [MIT/X11][]. :neckbeard:

## License
[MIT/X11][]

   [MIT/X11]: https://en.wikipedia.org/wiki/MIT_License

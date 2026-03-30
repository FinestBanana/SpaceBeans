<h1><img src="assets/spacebeans_logo_512.png" alt="Space Beans"/><p align="center">Space Beans 🌌🫘</p></h1>

<p align="center"><b>Prolly the best theme in the Milky Way. 🌌</b><br>
<i>A really dark color scheme based on ☕ coffee and 🍌 fruit colors.</i><br><br>

<ul>
   <li>dark/less dark theme ✔️</li>
   <li>contrast ratio of at least 4.5:1 ✔️</li>
   <li>HSLuv grading ✔️</li>
   <li>distinguishable colors ✔️</li>
</ul>
</p>
<br>


<h2 align="center">📦 Installation</h2>
Simply copy the <b>spacebeans.vim</b> file to<br>
<b>.vim/colors/</b><br>
or<br>
<b>.config/nvim/colors/</b><br>
or<br>
use your preferred <b>plugin manager</b>.
<br><br>

<h2 align="center">💻 Usage</h2>
For <b>Vim</b> add the following line to your <b>.vimrc</b>.

```vim
colorscheme spacebeans
```
<br>
For <b>Neovim</b> add following line to your <b>init.lua</b>.

```lua
vim.cmd.colorscheme("spacebeans")
```
<br>

<h2 align="center">🌓 Switch Modes</h2>
<h3 align="center">⬇️ Set default</h3>
If you want to set a specific mode as default you can define it in your .vimrc, init.lua or whatever your config file name is. 💁😆<br>
<br>
For <b>vimscript</b> set:

```vim
set background=light
```
For <b>lua</b> set:
```lua
vim.opt.background="light"
```
<br>

<h3 align="center">🔁 Manually switch during session</h3>
You can manually toggle between dark and light mode by executing the following commands in your running vim session.

```vim
:set background=dark
```
```vim
:set background=light
```
<br>

<h3 align="center">💣 Ultimate Toggle Switch</h3>
For the ultimate experience use the no bloat one-liner toggle switch <b>keybind</b> below. It sets up a dark/light toggle switch on <b>F12</b>.
<br>

<b>vimscript:</b>
```vim
nnoremap <F12> :let &background = (&background == "dark" ? "light" : "dark")<CR>
```

<b>lua:</b>
```lua
vim.keymap.set("n", "<F12>", "<cmd>let &background = (&background == 'dark' ? 'light' : 'dark')<CR>")
```
<br><br><br>

## Credit
The code of the .vim files is forked from Gruvbox [MIT/X11][]. :neckbeard:

## License
[MIT/X11][]

   [MIT/X11]: https://en.wikipedia.org/wiki/MIT_License

---
title: neovim_complete
date: 2017-09-12 22:14:33 +04:30
categories:
comment: https://github.com/MCSH/MCSH.github.io/issues/
---


در این پست میخواهیم autocomplete را در neovim اضافه کنیم و محیط توسعه خود را بهبود ببخشیم.

فایل `~/.config/nvim/init.vim` را باز کرده و در بخش plug خط زیر را اضافه می‌کنیم:
```
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
```

سپس برای فعال شدن deoplete در ابتدای اجرای نئوویم، به انتهای فایل این خط را اضافه می‌کنیم:

```
let g:deoplete#enable_at_startup = 1
```

پس از باز و بسته کردن neovim دستور `:PlugInstall` را اجرا می‌کنیم. در حال حاضر پس از تایپ ۲ کاراکتر منوی autocomplete باز شده و سپس با دکمه های C-n و C-p میتوانیم بین انتخاب ها جابه‌جا شویم. دکمه‌های فوق مخفف next و previous هستند.

از آنجایی که در حال حاضر بر روی یک پروژه JavaScript کار می‌کنم، tern را نصب می‌کنم.

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'ternjs/tern_for_vim'

در نهایت برای شناختن tern توسط tern_for_vim خط زیر را به انتهای کانفیگ اضافه می‌کنیم:
let g:tern#command = ['/usr/bin/tern']
let g:tern#arguments = ["--persistent"]

سیستم autocomplete کامل شد!
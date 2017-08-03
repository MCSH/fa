---
title: pip-upgrade-all
date: 2017-08-04 00:53:41 +04:30
categories: بررسی_کد
comment: https://github.com/MCSH/MCSH.github.io/issues/9
---

"علی" از من خواست تا یکی از اسکریپت هایی که نوشته رو بررسی کنم و بهش نظر بدم. منم از فرصت استفاده کردم و با اجازه خودش این پست رو در باره [pip-upgrade-all](https://github.com/Alimirlou/pip-upgrade-all) می‌نویسم. این اسکریپت وظیفه آپدیت کردن پکیج‌های پایتونی شما رو داره و به صورت اتوماتیک تمام آن‌ها را آپدیت می‌کند.

برای بررسی کردن این پروژه از کامیت ها شروع می‌کنیم:
```

```
$ glog
* 9e10150 (HEAD -> master, origin/master, origin/HEAD) tried to follow Unix philosophy because friends asked :)
* 1d5bb9f changed the app from executing terminal commands to calling pip function
* d4ce709 app source added
* 90b7697 Initial commit
```
#کامیت اول
۴ کامیت مختلف. [کامیت اول](https://github.com/Alimirlou/pip-upgrade-all/commit/90b769742c1d5b7e57ccc72640e1b08448a2cbba) صرفا یک فایل README.md ساده تولید کرده. چیزی برای بررسی نیست.

# کامیت دوم
[کامیت دوم](https://github.com/Alimirlou/pip-upgrade-all/commit/d4ce709ceeaca60cb8043d398ae57bac14f84df7) نسخه اولیه اسکریپت رو شامل میشه. از چند جنبه مختلف به بررسی این کامیت می‌پردازیم:

## بخش اول: Python Zen

```
[~]$ python
Python 3.6.2 (default, Jul 20 2017, 03:52:27) 
[GCC 7.1.1 20170630] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import this
The Zen of Python, by Tim Peters

Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!
>>> 
```

خط ششم کد نوشته 

```
if package in ['numpy', 'scipy']
```

که با *Special cases aren't special enough to break the rules* در تضاد است. 

خط ۳۵م از `while True:` استفاده شده که کاربردش رو متوجه نشدم. درون این بخش از کاربر دستور می‌گیره و اجراش میکنه -- که با این مشکلاتی دارم که در ادامه مطرح می‌کنم -- اما به نظرم بهتر بود ورودی از کاربر اخذ می‌شد و سپس تابع اجرا می‌شد.

خط ۳۱م هم (مثل خیلی از خطوط دیگه)که به کلی Readablitiy را نابود کرده! از هیچ جایی نمیشه متوجه شد چه چیزی در حال پرینت شدن است و یا این که چرا ۳ بار تب خورده هنگام پرینت شدن:
```
print('%d) %s\t\t\t%s --> %s (%s)' % (index, package[0], package[1], package[2], package[3]))
```

## بخش دوم: فلسفه یونیکس

[فلسفه یونیکس](https://en.wikipedia.org/wiki/Unix_philosophy) چند قانون ساده برای طراحی برنامه‌ها و اسکریپت‌هایی است که بتوانند به راحتی در محیط یونیکس استفاده شوند. این فلسفه نویسه‌های گوناگونی دارد و افراد مختلف به روش‌های مختلف آن را بیان کرده‌اند. این اسکریپت چندین مشکل با فلسفه یونیکس دارد که مختصر به اشاره آن‌ها می‌پردازیم:

### دریافت اطلاعات به روش تعاملی
روش تعاملی خوب است، اما برای برنامه هایی که قرار باشد در محیط یونیکس استفاده شوند چندان مناسب نیست. تصور کنید شخصی بخواهد این اسکریپت را هفتگی اجرا کند. چگونه به برنامه ورودی دهد؟

### خروجی بیش از حد
در یونیکس برنامه ها باید کم سخن باشند - مگر هنگامی که کاربر صراحتا به آن‌ها بگوید که اطلاعات دیباگ را نمایش دهند

### تنظیمات
هیچ فایلی یا روشی برای ارائه تنظیمات در این اسکریپت وجود ندارد.

### خروجی ناصحیح
چنانچه هنگام آپدیت یک پکیج خطایی پیش بیاید این اسکریپت همچنان پیام Update Complete را ارسال می‌کند.

### محدودیت در رابطه کاربری
چه نیازی هست که برنامه در انتهای فرایند از من Enter بخواهد؟

مشکلات جزئی دیگری هم هست اما باید یک نکته اساسی را در نظر گرفت:

**این کد کار می‌کند.**

با توجه به این که در این مرحله کد منتشر شده است عدم وجود LISENCE خطرناک است. فایلی که در اینترنت منتشر می‌شود -- حتی اگر به صورت فایل JS که در سایتتان از آن استفاده کرده‌اید، فایل های منتشر شده در گیتهاب بماند -- بهتر است لایسنس داشته باشند تا کاربر بداند شرایط استفاده از آن چیست و حقوقش در قبال کد شما چیست.

# کامیت سوم
[کامیت سوم](https://github.com/Alimirlou/pip-upgrade-all/commit/1d5bb9f1c8ab9fa9d6d555713082579f9753036a) تغییرات خوبی را در جهت مثبت اعمال کرده است.

* افزودن شرط در خط ۲۵م کمک به import کردن این اسکریپت در دیگر برنامه‌ها می‌کند.
* استفاده از تابع پایتون به جای فراخوانی یک زیرپروسه نیز به سرعت بیشتر برنامه و مصرف کمتر ریسورس کمک می‌‌کند - هر چند در اینجا چشمگیر نیست.

# کامیت چهارم
[کامیت چهارم](https://github.com/Alimirlou/pip-upgrade-all/commit/9e101508c6d35812587b0c47dac10343649daa29) تلاش کرده که فلسفه یونیکس را پیاده سازی کند اما یک مشکل اساسی مواجه شده: **وجود پوشه اضافه .idea**

بهتر بود در gitignore تنها یک سطر باشد و آن سطر `.idea/*` باشد. این پوشه اطلاعات اضافی‌ای در اختیار کاربر قرار می‌دهد که وجودشان اصلا احتیاج نیست و تنها حجم ریپو را بالا می‌برد.


دو فلگ به برنامه اضافه شده که امکان interactive بودن و non-interactive بودن را به کاربر می‌دهد. گام مثبتی است اما بهتر است برای تحلیل کردن فلگ ها از کتاب‌خوانه های این کار استفاده شود. مانند کتاب‌خوانه `argparse` که هسته اصلی پایتون نیز موجود است. ایرادات قبلی هم‌چنان برجاست.

# پیشنهادات

پیشنهادات من به "علی" و دیگر افرادی که بخواهند روی این پروژه کار کنند این است:

* استفاده از فلگ های مناسب برای ignore کردن پکیج ها. برای مثال وجود فلگ -g که با استفاده از آن بتوان از آپدیت شدن یک پکیج جلوگیری کرد:
./update-all -g scipy -g numpy -g django

* استفاده از فلگ برای پذیرفتن تمامی آپدیت ها. برای مثال فلگ -a
* استفاده از فایل کانفیگی که در مکان `$XDG_CONFIG_HOME/pip_upgrade_all.conf` ذخیره شده باشد. این فایل می‌تواند شامل پکیج هایی باشد که کاربر هیچ‌گاه نباید به دنبال آن‌ها بگردد.
* اعمال واقعی فلگ ignore-stdout که با استفاده از آن **هیچ** پیامی برای کاربر ارسال نشود مگر اطلاعات ضروری.
*‌اعمال فلگ -v که با استفاده از آن اطلاعات debug چاپ شود.
* افزودن فایل LISENCE
* حذف پوشه .idea
* افزودن shebang در ابتدای فایل
```
#!/bin/python3
```

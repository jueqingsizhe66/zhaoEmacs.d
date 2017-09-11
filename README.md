Okay , it comes from flyingmchine,
I have test in the two systems windows10
and ubuntu, all valid for newer.


### 1.为了引入clj-refactor(一个好用的补全包的工具)

click [clj-refactor][2]

1. M-X package-install clj-refactor(感觉每次得装上2遍)
然后在setup-clojure.el添加配置代码

```
(require 'clj-refactor)

(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import statements
    ;; This choice of keybinding leaves cider-macroexpand-1 unbound
    (cljr-add-keybindings-with-prefix "C-c C-m"))

```

### 2.为了使用类似nerdtree的neotree(ui.el)

click [neotree][3]

click [all-the-icons][4]
1. 在init.el添加了 
```
     neotree
     all-the-icons   ;;;you need to download fonts
```
2. 并且在ui.el添加了
```

(require 'neotree)
(global-set-key [f6] 'neotree-toggle)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


```
3. 额外增加了git配置

click [magit][5]
```

;; set up some useful mode
(which-key-mode)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)


```

### 3.增加了一些其他插件

放在了init.el
[auto-complete][10]
[dracula-theme][11]
[hlinum][7]
[which-key][6]
[restclient][8]
[browse-kill-ring][9]


对应的auto-complete(editing.el)配置如下

```
;; init auto-complete
(require 'auto-complete-config)
(ac-config-default)


```
对应的dracula-theme(ui.el)配置如下
```
(load-theme 'dracula t)
;; workaround blue problem https://github.com/bbatsov/solarized-emacs/issues/18
(custom-set-faces
(if (not window-system)
  '(default ((t (:background "nil"))))))

```

对应的which-key(ui.el)和hlinum(editing.el)配置如下
```
;; set up some useful mode
(which-key-mode)


(require 'hlinum)
(hlinum-activate)
(set-face-attribute 'linum nil :background nil)
(set-face-foreground 'linum "#f8f8f2")
(setq linum-format "%d ")
;; (set-face-attribute 'hl-line nil :foreground nil :background "#330")
(set-face-attribute 'hl-line nil :foreground nil :background "#353535")

;; 2017/7/13
(browse-kill-ring-default-keybindings)

 
```

### 4. 修正rainbow(editing.el)

```
;; yay rainbows!
;;(global-rainbow-delimiters-mode t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

```

### 5. expand-region(editing.el)

click [expand-region][12]
```
;; init expand-region
(require 'expand-region)
(global-unset-key (kbd "M--"))
(global-set-key (kbd "M-=") 'er/expand-region)
(global-set-key (kbd "M--") 'er/contract-region)


```

可以快选择。

### 6. bookmark

click [bookmark+][15]

快捷键
```
c-x r l : 查询bookmark
c-x r m : 添加
c-x r b : 跳转
```

### 7. org-mode
[特详细的org-mode教程][13]

[GTD Workflow][14]

常用快捷键：

```
Tab打开标题
c-c c-n 光标沿标题方向向下移动
c-c c-p 光标沿标题方向向上移动
c-c c-q 添加标题的tag
c-c a 打开agender
c-c c-t 添加当前标题的todo
c-c c-d 添加当前标题deadline
c-c c-s 添加当前标题的schedule
<s Tab 添加src块
<e Tab  添加example快

c-c shift-< 打开calendar
c-c shift-> 添加calendar鼠标下的日期



M-RET 插入同级列表项
M-S-RET 插入有 checkbox的同级列表项
C-c C-c 改变 checkbox状态
M-left/right 改变列表项层级关系
M-up/dowm 上下移动列表项

输入C-c . 会出现一个日历，我们点选相应的时间即可插入。

```

### 8. chez-scheme的集成(scheme-editing.el)

注意你的scheme路径，参考 [emacs][16]
```

(require 'cmuscheme)
(setq scheme-program-name "E:\\ChezScheme\\a6nt\\bin\\a6nt\\scheme")         ;; 如果用 Petite 就改成 "petite"

```

打开ss,scm,rkt结尾的文件即可执行F5和F7(其他文件未绑定)


Okey, below is the new interface,

![image][1]
# this is a Clojure-friendly emacs config

If you're new to emacs, check out
[this introductory tutorial](http://www.braveclojure.com/basic-emacs/)!

## WARNING

This project uses an outdated version of
[CIDER](https://github.com/clojure-emacs/cider), the package that
provides much of the functionality for Clojure development. If you run
into issues, try upgrading (instructions below).

Why not just update this package to use the latest CIDER, you ask?
This project uses CIDER 0.8.1 so that
[Clojure for the Brave and True](http://www.braveclojure.com/basic-emacs/)
readers are less likely to get confused as they use Emacs for the
first time.

## Installing

1. Close Emacs.
2. Delete `~/.emacs` or `~/.emacs.d` if they exist. (Windows users, your
   emacs files will probably live in
   `C:\Users\your_user_name\AppData\Roaming\`. So, for example, you
   would delete `C:\Users\jason\AppData\Roaming\.emacs.d`.) This is
   where Emacs looks for configuration files, and deleting these files
   and directories will ensure that you start with a clean slate.
3. Download the Emacs
   [configuration zip file](https://github.com/flyingmachine/emacs-for-clojure/archive/book1.zip)
   and unzip it. Its contents should be a folder,
   `emacs-for-clojure-book1`. Run `mv path/to/emacs-for-clojure-book1
   ~/.emacs.d`.
4. Create the file `~/.lein/profiles.clj` (Windows users, this is
   probably `C:\Users\your_user_name\.lein\profiles.clj`) and add this
   line to it:

```clojure
{:user {:plugins [[cider/cider-nrepl "0.8.1"]]}} 
```

Then open Emacs.

## Upgrading

Before upgrading, ensure that your `.emacs.d` directory is under
version control so that you can always revert to a known good state.

To upgrade:

1. Edit `.emacs.d/init.el`, adding these lines after line 12:

   ```elisp
   (add-to-list 'package-archives
                '("melpa-stable" . "http://stable.melpa.org/packages/") t)
   
   (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
   ```

2. Close Emacs.
3. Run `rm -Rf .emacs.d/elpa/cider-*`
4. Open Emacs. You'll probably see some errors and your theme won't
   load. That's ok.
5. In Emacs, run `M-x package-refresh contents`.
6. In Emacs, run `M-x package-install cider`.
7. Close and re-open Emacs.
8. Open `.lein/profiles.clj` and remove `[cider/cider-nrepl "0.8.1"]` from it.

That should install the latest version. Enjoy!

## Organization

I've tried to separate everything logically and document the purpose
of every line. [`init.el`](./init.el) acts as a kind of table of
contents.  It's a good idea to eventually go through `init.el` and the
files under the `customizations` directory so that you know exactly
what's going on.

## Supporting CSS, HTML, JS, etc.

Emacs has decent support for CSS, HTML, JS, and many other file types out of the box, but if you want better support, then have a look at [my personal emacs config's init.el](https://github.com/flyingmachine/emacs.d/blob/master/init.el). It's meant to read as a table of contents. The emacs.d as a whole adds the following:

* [Customizes js-mode and html editing](https://github.com/flyingmachine/emacs.d/blob/master/customizations/setup-js.el)
    * Sets indentation level to 2 spaces for JS
    * enables subword-mode so that M-f and M-b break on capitalization changes
    * Uses `tagedit` to give you paredit-like functionality when editing html
    * adds support for coffee mode
* [Uses enh-ruby-mode for ruby editing](https://github.com/flyingmachine/emacs.d/blob/master/customizations/setup-ruby.el). enh-ruby-mode is a little nicer than the built-in ruby-mode, in my opinion.
    * Associates many filenames and extensions with enh-ruby-mode (.rb, .rake, Rakefile, etc)
    * Adds keybindings for running specs
* Adds support for YAML and SCSS using the yaml-mode and scss-mode packages

In general, if you want to add support for a language then you should be able to find good instructions for it through Google. Most of the time, you'll just need to install the "x-lang-mode" package for it.

[1]:https://github.com/jueqingsizhe66/zhaoEmacs.d/blob/develop/customizations/new.jpg
[2]:https://github.com/clojure-emacs/clj-refactor.el 
[3]:https://github.com/jaypei/emacs-neotree 
[4]:https://github.com/domtronn/all-the-icons.el 
[5]:https://github.com/magit/magit 
[6]:https://github.com/justbur/emacs-which-key 
[7]:https://github.com/tom-tan/hlinum-mode 
[8]:https://github.com/pashky/restclient.el 
[9]:https://github.com/T-J-Teru/browse-kill-ring 
[10]:https://github.com/auto-complete/auto-complete 
[11]:https://github.com/dracula/dracula-theme 
[12]:https://github.com/magnars/expand-region.el 
[13]:http://doc.norang.ca/org-mode.html#HowToUseThisDocument 
[14]:http://members.optusnet.com.au/~charles57/GTD/gtd_workflow.html#sec-1 
[15]:https://www.emacswiki.org/emacs/BookmarkPlus 
[16]:http://www.yinwang.org/blog-cn/2013/04/11/scheme-setup 

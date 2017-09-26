Okay , it comes from flyingmchine,
I have test in the two systems windows10
and ubuntu, all valid for newer.

参考我写的[emacs安装教程 for ubuntu and windows][39]


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

注意，在第一次使用时候，执行`M-x  all-the-icons-install-fonts`,会提示安装字体，不然
打开neotree会出现部分无法显示。


2. 并且在ui.el添加了
```

(require 'neotree)
(global-set-key [f6] 'neotree-toggle)
(require 'all-the-icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


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

Seen from [emacs-rocks-9][40]

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


### 9. cua mode(deleted)
本来想着配置[cua(Common User Access) mode][18],后来想着ctrl-v和传统的kill-ring 冲突，于是就把它删掉，
而且传统的[kill-ring][17] 队列的风格也是不错。

当前的配置文档使用M-y就可以调用(注意ctrl+y表示黏贴 M-W表示添加到黏贴板)
(browse-kill-ring-default-keybindings),这样可以看到所有删除和剪切的历史，
通过多次摁M-y可以切换不同的历史(还得多熟练),查看editing.el最后一行。

### 10. 想着安装上markdown-mode+(major-mode)

```
M-x package-install  markdown-mode+
```

在init.el的my-package list 增加markdown-mode+，这样每次打开markdown的md后缀结尾的后缀名就会自动渲染，这也是emacs的[mode][18]的一种运用.

### 11. server+clinet

emacs经常地使用方式是
   
     长时间打开server(通过runemacs daemon，并敲入M-x server-start)
     然后就可以在ubuntu系统的命令行使用emacsclient 文件名
     或者 windows系统的TotalCommander通过emacsclientw(相比于emacsclient,他能够直接跳转到serve断)查看文件，这样打开的文件
     就会出现在server端的屏幕上，使用ctrl+x #来关闭

这样启动emacs方便些。

现在在配置文件init.el增加了(server start) 这样就不需要每次runemacs daemon的时候还需要启动server。

<hr/>
<hr/>
到目前位置，ubuntu和windows的配置能够同时使用！！！Excellent!

![new Pic][19]


### 12. info window

类似于vim的help系统，emacs的info系统也做得很强大，

使用 `C-h i` 可以得到一个info window, 一个不错的帮助平台

1. 使用space键执行翻屏(scroll one screen at a time)
2. [ and ] Previous /Next node
3. 使用n和p跳转上下章节(同级目录跳转）(Previous/next sibling node)
4. l and r可以返回和向前跳转(in history)(l and r go back /forward in history)
类似于浏览器的回退和前进
5. Tab 表示在links之间跳转
6. Enter进入链接, m 弹出一个prompt minibuffer, for a menu item name to choose it.
7. q 推出info browser

        Everyday reading
        For everyday reading, you want SPACE for browsing and reading 
        as it "does what you want". It thumbs through a page until it
        reaches the end. Then, it either picks the next sub node or the
        next chapter. For browsing ,use [ and ] to cycle back and forth
        through nodes.


在`c-h i` 具有menu的文档下，可以输入`m` 命令得到menu菜单，执行定义到某个manual下，
常用的组合过程`c-h i m`

`C-h F` 函数说明`M-x describe-function`

`C-h V` 变量说明`M-x describe-variable`

`C-h a` 打开apropos symbol的regex字符关联的系统说明

`C-h d` 类似于apropos的regex字符关联的系统文档

`C-h k` 查看绑定快捷键的说明，比如你想查看`C-x #`表示什么意思，就可以执行该命令

### 13. mode helper system

使用`C-h m`等效于`M-x describe-mode` 可以很方便打开当前的buffer后缀对应的major-mode的帮助信息(一般一个
文件后缀对应一个major-mode和多个minor-modes)

比如在打开的markdown md后缀文件下，会打开markdown major-mode的帮助信息，有相关的
快捷键等帮助信息


### 14. 多窗口

C-x 5 2 打开当前window相同的frame
如果关掉当前frame，执行`C-x 5 0` 
如果关掉其他frame，执行`C-x 5 1` 

`C-x 1` delete other windows.
`C-x 2` split window below.
`C-x 3` split window right.
`C-x 0` delete the actie window right.


### 15. 括号相关的跳转

`C-M-d`  Move down into a  list

`C-M-u`  Move up   out  of a list

`C-M-n`  Move forward to the next list

`C-M-p`  Move backward to the previous list

`C-M-a`  Move to beginning of defun

`C-M-e`  Move to end       of defun


### 16. multiple-cursors(editiing.el)

Seen from [emacs-rocks-13][37]

#### 函数名

1. mc/mark-next-like-this （C->)
2. mc/edit-lines (C-S-c C-S-c 标记M-h区域)
3. mc/mark-previous-like-this(C-<)
4. mc/mark-all-like-this (C-c C-<)

按照官网简单配置

在没有[multiple-cursors][21]的前提下，你也可以使用`C-x r t` 来标记当前
光标前的所有行，当作一个矩形区域，然后可以多行编辑

当然你也可以使用`C-x Space Esc Down Down `等操作来标记多行

而有了multiple-cursors, 你现在可以配合`M-h` 选择一个段落，然后`C-S-c C-S-c`

或者你可以使用`C->` 来mark当前光标下单词，并查找下一处出现的地方，最终摁下`Enter`
键，表示确认
。

较常用的命令，`M-x mc/mark-all-words-like-this`

### 17. vim-surround to evil-surround

有时候需要给单词或者字段组合增加个双引号或者单引号， 亦或者括号，
在emcas可以使用[evil-surround][22](vim中使用[vim-surround][23])

add `(global-evil-surround-mode 1)` in the editing.el

add `evil-surround` into my-package list

### 18. mo-git-blame and ivy

#### 函数名

1. ivy-resume
2. counsel-M-x
3. counsel-find-file
4. counsel-describe-variable
5. counsel-find-library
6. counsel-info-lookup-symbol
7. counsel-unicode-char
8. counsel-ag
9. counsel-locate
10. counsel-rhythmbox
11. counsel-expression-history
12. counsel-git-grep
13. swiper


git配置

*注意，默认的windows git 目录是在 c:/users/username/AppData/Roaming/.gitconfig *

click [magit][5]
```

;; set up some useful mode
(which-key-mode)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)


```


阅读[emacs教程][25]安装了git blame
git blame 安装
ivy ivy-dired-history all-the-icons-ivy ivy-rich

[ivy][27]是一个类似[emacs helm][28]的东西，可以方便查找buffer和file，

```
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c g") 'counsel-git)
(global-set-key (kbd "C-c j") 'counsel-git-grep)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
```

我现在都是使用`M-x swiper` `M-x-git` `M-x counsel-find-file`

`M-x counsel-find-library` `M-x counsel-git` 来做实验，看看速度怎么样，
发现`M-x counsel-git-grep`速度很慢，没必要用~ `M-x swiper` 搜索buffer，vim的
对应功能是[vimfiler][25],挺好用的!

[ivy使用手册][26]

于是现在也在navigation.el增加了ivy-mode.

### 19. 改进org-mode配置

在.orgConf.el中添加的正确org-capture-templates，使用快捷键`C-c c`来捕捉你的想法并进行记录。 org-remember打算删掉。

有趣的大纲查看命令 
`C-c \`

有趣的添加当前日期命令
`C-c .`

在查看org-agenda 的时候可以使用`v`来选择你要看的日、月、年视图等

有趣的org帮助 `LINK:info:org:Top`.

为了显示clean的org文档，在.org.conf添加了
`(setq org-startup-indented t)`

为了显示图片，在.org.conf 添加了
`(setq auto-image-fill-mode t)`

### 20. add calendar and bookmark shortkey

##### 函数名:

1. calendar
2. list-bookmarks



edit the ui.el, and add the below information,and also add the
cal-china-x农历信息

```

;; in the digital keyboard add calendar and bookmark
(global-set-key [kp-7] 'calendar)
(global-set-key [kp-8] 'list-bookmarks)
(setq bookmark-save-flag 1) ;; everytime bookmark is changed, automatically save it
(setq bookmark-save-flag t) ;; save bookmark when emacs quit


```

注意，有可能第一次按下7和8没有反应，得emacs启动之后，就会有效果了

农历的效果。(按下S 可以查看cursor所在的日出日落时间)
![calendar][29]


### 21. 使用21世纪产品complte替换autocomplete

##### 函数名:


[company][32]

1. 增加company in the my-packages @ init.el
2. write code below in the editing.el

```
(add-hook 'after-init-hook 'global-company-mode)
```

3. comment out关于auto-complete的配置@editing.el
```
;; subsititude by compltee
;; init auto-complete
;;(require 'auto-complete-config)
;;(ac-config-default)
```

可以进一步阅读[company-mode官网][35]


### 22. 添加了evil-surround(但是得有evil，所以暂时搁置)


[evil-surround][31]

1. 增加evil-surround in the my-packages @init.el
2. add the setting code for evil-surround
```

(require 'evil-surround)
(global-evil-surround-mode 1)

```


### 23. 为了使用iy-go-to-char结合key-chord

##### 函数名:

1.iy-go-to-char
2. 宏名 key-chord-define-global


[iy-go-to-char][33]

[key-chord][34]


1. 增加iy-go-to-char and key-chord in the my-package @init.el
2. add the key-chord setting code @editing.el

```

(require 'key-chord)
(key-chord-mode 1)
;; Move to char similar to "f" in vim, f+g forward  d+f backward
(key-chord-define-global "ff" 'iy-go-to-char)
(key-chord-define-global "aa" 'iy-go-to-char-backward)

```

3. so 你可以快速的摁下ff(俩字母跳转)跳转到一个输入框让你输入一个char
或者 aa向后全局跳转(进入重复查找模式，反复摁下搜索字符，逐步向前或者
向后查找)

key-chord设置的是两个相同的key是最长0.2s延迟输入，若是两个不同的key则是
0.1s延迟输入,见[keychord.el][36]。

### 24. ace-jump-mode

Seen from [emacs-rocks-10][38]
#### 函数名

1. ace-jump-mode

[ace-jump-mode][30]

1. add the ace-jump-mode in the my-packags @init.el
2. add the setting code for the ace-jump-mode @navigation.el

```
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
```
3. when you input "C-c SPC" , the minibuffer will prompt you to input
the character you wana jump.

![ace][44]

### 25. emacs标记

有时候写着东西，你需要跳转到文内其他地方，查完之后，又想跳回来，vim比较简单(C-o)

emacs对应的先标记
`C-x SPC a`, a代表标记键，可以为a-z
然后调回来使用，
`C-x r j` ,输入a即可
 
 有些人也说可以用C-SPC，然后C-x c-x跳转即可(进一步可以参考标题16)。
 
 
### 26. transpose character and words

Seen from [emacs-rocks-2 and 3][41]

```
C-t transpose two chars

M-t transpose two words

C-x C-t transpose lines

M-u make letters uppercase in word from cursor position to end

M-c simply make first letter in word uppercase

M-l opposite to M-u
```


### 27. Dired details

1. add dired-details+ and dired+ to mypackages @init.el

2. add the below code @ui.el

```
(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)


;;Move files between split panes
(setq dired-dwim-target t)

```

3. when you `M-x dired`
you can see the clean info in the directory, then you can
use right parenthesis to get the detail info(user,priviliedge,dates etc) ,you can use left parenthesis to hide the details of file.

so

a. use m to mark the files, use u to unmark the files

b. use D to delete the files in prepare, and execute with x

c. when you finish m  , you can move(with command R) ,you can
   copy(with command C), you can delete(with command d)
   
d. Funny place. Emacs can simultaneously open two directory by
    open two buffers in the left-right zones, so you can use left
    zones as source directory, the right zones as target directory
    for copying and moving files.
    
![dired][43]

<hr/>

<hr/>



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
[17]:http://www.cnblogs.com/robertzml/archive/2010/02/19/1669204.html
[18]: https://www.masteringemacs.org/article/beginners-guide-to-emacs
[19]:https://github.com/jueqingsizhe66/zhaoEmacs.d/blob/develop/customizations/holyshit.jpg
[20]:https://www.braveclojure.com/basic-emacs/
[21]:https://github.com/magnars/multiple-cursors.el
[22]:https://github.com/tpope/vim-surround
[23]:https://github.com/emacs-evil/evil-surround
[24]:http://blog.csdn.net/redguardtoo/article/details/7222501/
[25]:https://github.com/Shougo/vimfiler.vim
[26]:http://oremacs.com/swiper/
[27]:https://github.com/abo-abo/swiper
[28]:https://github.com/emacs-helm/helm
[29]:https://github.com/jueqingsizhe66/zhaoEmacs.d/blob/develop/customizations/calenar.jpg
[30]:https://github.com/winterTTr/ace-jump-mode
[31]:https://github.com/emacs-evil/evil-surround
[32]:https://github.com/company-mode/company-mode
[33]:https://github.com/doitian/iy-go-to-char
[34]:https://github.com/emacsorphanage/key-chord
[35]:http://company-mode.github.io/
[36]:https://github.com/emacsorphanage/key-chord/blob/master/key-chord.el
[37]:http://emacsrocks.com/e13.html
[38]:http://emacsrocks.com/e10.html
[39]:https://segmentfault.com/a/1190000011000873
[40]:http://emacsrocks.com/e09.html
[41]:http://emacsrocks.com/e02.html
[42]:http://emacsrocks.com/e16.html
[43]:https://github.com/jueqingsizhe66/zhaoEmacs.d/blob/develop/customizations/dired.jpg
[44]:https://github.com/jueqingsizhe66/zhaoEmacs.d/blob/develop/customizations/ace.png

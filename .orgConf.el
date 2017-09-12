;;;org开始设置
(setq load-path (cons "~/.emacs.d/lisp" load-path))
(setq load-path (cons "~/.emacs.d/contrib/lisp" load-path))
(require 'org-install)
(require 'org)
;(require 'org-mouse) ;;加载这个包报错 muse变量未定义
;把下面几行加到 .emacs 文件里。后三行是为命令定义全局快捷键――请改成适合你自己的。 
;设置之后，打开 .org 扩展的文件会自动进入 org 模式;
;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;(global-set-key "\C-c l" 'org-store-link) ;;有问题
;(global-set-key "\C-c a" 'org-agenda) ;; 有问题
;(global-set-key "\C-c b" 'org-iswitchb)  ;; 有问题
(global-set-key "\C-cl" 'org-store-link) ;;
(global-set-key "\C-ca" 'org-agenda) ;; 
(global-set-key "\C-cb" 'org-iswitchb)  ;; 原来是因为多了一个空格

(setq org-hide-leading-starts t)
(setq org-log-done t)

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subTodo Entries are done,to TODO otherwise."
  (let (org-log-done org-log-states) ;; turn-off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;(if (boundp 'org-user-agenda-files)
;  (setq org-agenda-files org-user-agenda-files)
 (setq org-agenda-files (list
                       "~/.emacs.d/GTD/newgtd.org" 
                       "~/.emacs.d/GTD/orgBoss/Book/book.org"
                       "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org"
                       "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org"
                       "~/.emacs.d/GTD/orgBoss/Financial/finances.org"
                       "~/.emacs.d/GTD/orgBoss/Film/film.org"
                       "~/.emacs.d/GTD/orgBoss/Journal/journal.org"
                       "~/.emacs.d/GTD/orgBoss/Private/privnotes.org"
                       "~/.emacs.d/GTD/orgBoss/Someday/someday.org"
                       "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org"
                        ))  
;  )

;
;(add-to-list 'load-path "~/.emacs.d/chinese-pyim/")
;(require 'chinese-pyim)
;; activate the chinise-pyim

;(setq default-input-method "chinese-pyim")
;先凑合着用  直接内置的  可以使用
;(setq default-input-method "chinese-py-punct")
;(setq pyim-use-tooltop t)
;(global-set-key [C-f11] 'toggle-input-method)
;(global-set-key [C-SPC] 'toggle-input-method) ;;又一次报错提醒
;(global-set-key [C-f12] 'pyim-toggle-full-width-punctuation)

;(defun pyim-use-dict:bigdict ()
;  (interactive)
;  (setq pyim-dicts
;        '((:name "BigDict"
;                 :file "~/.emacs.d/chinese-pyim/pyim-bigdict.txt"
;                 :coding utf-8-unix)))
;  (pyim-restart-1 t))

;(require 'chinese-pyim-company)
;(setq pyi-company-predict-words-number 10)
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)

;;; 注意路径得写对了
;(add-to-list 'load-path "/usr/share/emacs/24.3/lisp/org/")
 (add-to-list 'load-path "~/.emacs.d/GTD/muse-3.20/lisp")
 (add-to-list 'load-path "~/.emacs.d/GTD/planner-3.42")
 (add-to-list 'load-path "~/.emacs.d/GTD/remember-2.0")


 (setq planner-project "WikiPlanner")
     (setq muse-project-alist
           '(("WikiPlanner"
             ("~/.emacs.d/GTD/myPlan/"   ;; Or wherever you want your planner files to be
             :default "index"
             :major-mode planner-mode
	     :visit-link planner-visit-link))))
     (require 'planner)
;(org-remember-insinuate) 
;; You cannot use ctrl+alt+f12 ubuntu  terminal global key
 ;(setq org-default-notes-file  "~/.emacs.d/GTD/.notes.org") 
 ;(define-key global-map [f12] 'org-remember) 
 ;(setq org-remember-templates 
 ;      '(("TODO" ?t "* TODOS %^{TO DO What(Briefly)} \n %?" "~/.emacs.d/GTD/.notes.org" "TODO") 
 ;    ("IDEA" ?i "* TODO %^{What's your IDEA (Briefly)} \n %?" "~/.emacs.d/GTD/.notes.org" "IDEA") 
 ;    ("MOVIE" ?m "* TODO %^{Enter the Movie Name}\n %?" "~/.emacs.d/GTD/.notes.org" "MOVIE") 
 ;    ("SITES" ?s "* %^{Enter the Name of the Site}\n %?" "~/.emacs.d/GTD/.notes.org" "SITES") 
 ;   ("BlogToPublish" ?b "* %^{Enter the Name of the Blog}\n %a %?" "~/.emacs.d/GTD/.notes.org" "BlogToPublish")))
 
;接下来我对Remember的配置如下:
;实现规划好 几个文件的地方
 (setq org-directory "~/.emacs.d/GTD/orgBoss/")
 (setq org-default-notes-file "~/.emacs.d/GTD/orgBoss/.notes")
 (setq remember-annotation-functions '(org-remember-annotation))
 (setq remember-handler-functions '(org-remember-handler))
 (add-hook 'remember-mode-hook 'org-remember-apply-template)
 (define-key global-map "\C-cr" 'org-remember)
 (define-key global-map "\C-cc" 'org-capture)


(setq org-remember-templates
    '(("Todo" ?t "* TODOS %^{To Do What?(Brief Description)} %^g\n%?\nAdded: %U" "~/.emacs.d/GTD/newgtd.org" "Tasks")
    ("IDEA" ?i "* TODO %^{What's your IDEA (Briefly)} \n %?" "~/.emacs.d/GTD/orgBoss/IDEA/idea.org" "IDEA")
      ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  "~/.emacs.d/GTD/orgBoss/Journal/journal.org")
      ("Clipboard" ?c "** %^{Head Line} %U %^g\n%c\n%?"  "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org")
      ("Receipt"   ?r "** %^{BriefDesc} %U %^g\n%?"   "~/.emacs.d/GTD/orgBoss/Financial/finances.org")
      ("Book" ?b "** %^{Enter the Book Name} %t :BOOK: \n%[~/.emacs.d/GTD/orgTemplate/.book_template.txt]\n" 
         "~/.emacs.d/GTD/orgBoss/Book/book.org")
      ("Film" ?f "** %^{Enter the Film Name} %t :FILM: \n%[~/.emacs.d/GTD/orgTemplate/.film_template.txt]\n" 
         "~/.emacs.d/GTD/orgBoss/Film/film.org")
      ("Daily Review" ?d "** %t :COACH: \n%[~/.emacs.d/GTD/orgTemplate/.daily_review.txt]\n" 
         "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org")
    ("SITES" ?w "* %^{Enter the Name of the Site}\n %?" "~/.emacs.d/GTD/orgBoss/Site/www.site.org" "SITES") 
      ("Someday"   ?s "** %^{Someday Heading} %U\n%?\n"  "~/.emacs.d/GTD/orgBoss/Someday/someday.org")
      ("Vocab"   ?v "** %^{Word?}\n%?\n"  "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org")
     ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "~/.emacs.d/GTD/orgBoss/Private/privnotes.org")
     ("Contact" ?p "\n* %^{Name} :CONTACT:\n%[l:/contemp.txt]\n" 
               "F:/gtd/privnotes.org")
        
     )
   )
(setq org-capture-templates
    '(("Todo" ?t "* TODOS %^{To Do What?(Brief Description)} %^g\n%?\nAdded: %U" "~/.emacs.d/GTD/newgtd.org" "Tasks")
    ("IDEA" ?i "* TODO %^{What's your IDEA (Briefly)} \n %?" "~/.emacs.d/GTD/orgBoss/IDEA/idea.org" "IDEA")
      ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  "~/.emacs.d/GTD/orgBoss/Journal/journal.org")
      ("Clipboard" ?c "** %^{Head Line} %U %^g\n%c\n%?"  "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org")
      ("Receipt"   ?r "** %^{BriefDesc} %U %^g\n%?"   "~/.emacs.d/GTD/orgBoss/Financial/finances.org")
      ("Book" ?b "** %^{Enter the Book Name} %t :BOOK: \n%[~/.emacs.d/GTD/orgTemplate/.book_template.txt]\n" 
         "~/.emacs.d/GTD/orgBoss/Book/book.org")
      ("Film" ?f "** %^{Enter the Film Name} %t :FILM: \n%[~/.emacs.d/GTD/orgTemplate/.film_template.txt]\n" 
         "~/.emacs.d/GTD/orgBoss/Film/film.org")
      ("Daily Review" ?d "** %t :COACH: \n%[~/.emacs.d/GTD/orgTemplate/.daily_review.txt]\n" 
         "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org")
    ("SITES" ?w "* %^{Enter the Name of the Site}\n %?" "~/.emacs.d/GTD/orgBoss/Site/www.site.org" "SITES") 
      ("Someday"   ?s "** %^{Someday Heading} %U\n%?\n"  "~/.emacs.d/GTD/orgBoss/Someday/someday.org")
      ("Vocab"   ?v "** %^{Word?}\n%?\n"  "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org")
     ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "~/.emacs.d/GTD/orgBoss/Private/privnotes.org")
     ("Contact" ?p "\n* %^{Name} :CONTACT:\n%[l:/contemp.txt]\n" 
               "F:/gtd/privnotes.org")
        
     )
   )

; “|”用来分隔“未完成”和“完成”两种状态的关键词，前面为未完成项，后面为完成项。如果没有“|”符号，最后一个关键词将被设为完成项，其余为未完成项。
; ! 表示时间
; 所有的TODO都只有 两种类  Undo and  done 用 |分隔
; type 相当于 #+TYP_TODO  也有两种类型
; sequence 相当于 #+SEQ_TODO   也有两种类型
; 可以写出多个sequence 等你工作 学习 继续进行修改 但是注意无论是type还是sequence都得有|
(setq org-todo-keywords
  '((type "REPORT(r!)" "BUG(b!)" "KNOWNCAUSE(k!)" "|" "FIXED(f!)")
    (sequence "PENDING(p!)" "TODO(t!)"  "|" "DONE(d!)" "ABORT(a@/!)")
))
(setq org-todo-keyword-faces
  '(("REPORT" .      (:background "red" :foreground "white" :weight bold))
    ("BUG" .      (:background "white" :foreground "red" :weight bold))
    ("KNOWNCAUSE" .      (:foreground "MediumBlue" :weight bold)) 
    ("FIXED" .      (:foreground "yellow" :weight bold)) 
    ("PENDING" .   (:background "LightGreen" :foreground "gray" :weight bold))
    ("TODO" .      (:background "DarkOrange" :foreground "black" :weight bold))
    ("DONE" .      (:background "azure" :foreground "Darkgreen" :weight bold)) 
    ("ABORT" .     (:background "gray" :foreground "black"))
))

;;相当于设置  #+tags:  在每一个org文件中
(setq org-tag-alist '((:startgroup . nil)
                      ("@work" . ?w) 
                      ("@tennisclub" . ?t)
                        ("@errand" . ?e)
                        ("@office" . ?o)
                        ("@home" . ?H)
                        ("@farm" . ?f)
                        ("@NCEPU" . ?n)
                        ("@F708" . ?f)

                      (:endgroup . nil)
                      ("laptop" . ?l) 
                      ("pc" . ?p)
                       ("WAITING" . ?w)
                        ("HOLD" . ?h)
                        ("PERSONAL" . ?P)
                        ("WORK" . ?W)
                        ("FARM" . ?F)
                        ("ORG" . ?O)
                        ("NORANG" . ?N)
                        ("crypt" . ?E)
                        ("NOTE" . ?n)
                        ("CANCELLED" . ?c)
                        ("FLAGGED" . ??)
                      ))



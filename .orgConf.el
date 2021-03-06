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
(global-set-key (kbd "C-c l") 'org-store-link)    ;;
(global-set-key (kbd "C-c a")  'org-agenda)           ;; 
(global-set-key (kbd "C-c b") 'org-iswitchb) ;; 原来是因为多了一个空格

(setq org-hide-leading-starts t)
(setq org-log-done t)

(setq org-startup-indented t)  ;; or M-x org-indent-mode  to clean the org file 
(setq auto-image-file-mode t)  ;;  let emacs show image

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
                       "~/.emacs.d/GTD/orgBoss/IDEA/idea.org"
                       "~/.emacs.d/GTD/orgBoss/Journal/journal.org"
                       "~/.emacs.d/GTD/orgBoss/Private/privnotes.org"
                       "~/.emacs.d/GTD/orgBoss/Someday/someday.org"
                       "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org"
                       "~/.emacs.d/GTD/orgBoss/Site/www.site.org"
                       "~/.emacs.d/GTD/writing.org"
                       "~/.emacs.d/GTD/orgBoss/Habit/habits.org"
                        ))  
;  )

;;C-c C-w to redefine terms to different files
; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))

; Use IDO for both buffer and file completion and ido-everywhere to t
(setq org-completion-use-ido t)
(setq ido-everywhere t)
(setq ido-max-directory-size 100000)
(ido-mode (quote both))


(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
; Use the current window for indirect buffer display
(setq org-indirect-buffer-display 'current-window)

;;;; Refile settings
; Exclude DONE state tasks from refile targets
(defun bh/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function 'bh/verify-refile-target)

;;;refile done!!!
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
(require 'remember)
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
;; (define-key global-map (kbd "C-c r") 'org-remember)
 (define-key global-map (kbd "C-c c") 'org-capture)

;("j" "Journal"   "~/.emacs.d/GTD/orgBoss/Journal/journal.org" "** %^{Head Line} %U %^g\n%i%?"  )

(defvar my/org-basic-task-template
"* TODO %^{Task}
:PROPERTIES:
:Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
:END:
Captured %<%Y-%m-%d %H:%M>
%?

%i
")

(setq org-capture-templates 
      '(("l" "灵感" entry (file+headline "~/.emacs.d/GTD/writing.org" "创意") 
                        "* %?\n %i\n %a") 
        ("j" "Journal" entry (file+datetree "~/.emacs.d/GTD/orgBoss/Journal/journal.org" ) 
                        "* %? [#B] \n输入于： %U\n %i\n %a"
                        :clock-in t :clock-resume t)
        ("t" "Todo" entry  (file+headline "~/.emacs.d/GTD/newgtd.org" "Tasks")
                    "* TODO [#B] %^{Task} %^g
                    :PROPERTIES:
                    :Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|4:00}
                    :END:
                    Captured %<%Y-%m-%d %H:%M>
                    %?

                    %i
                    " )
        ("T" "QuickTask" entry  (file+headline "~/.emacs.d/GTD/newgtd.org" "Tasks")  
                        "* TODO [#C] %^{Task}\nSCHEDULED:%t\n"
                        :immediate-finish t)
        ("r" "Interrupted Task" entry  (file+headline "~/.emacs.d/GTD/newgtd.org" "Tasks")  
                        "* STARTED %^{Task}"
                        :clock-in :clock-resume)
        ("i" "IDEA" entry  (file+headline "~/.emacs.d/GTD/orgBoss/IDEA/idea.org" "IDEA")  
                        "* TODO [#A] %^{What's your IDEA (Briefly)}  \n %?" 
                        :immediate-finish t)
          ("c" "Clipboard" entry (file+datetree  "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org")  
                        "** %^{Head Line} %U %^g\n%c\n%?"  
                        :immediate-finish t)
          ("R" "Receipt" entry  (file+datetree  "~/.emacs.d/GTD/orgBoss/Financial/finances.org" ) 
                        "** %^{BriefDesc} %U %^g\n%?"   )
          ("b" "Book" entry  (file+datetree "~/.emacs.d/GTD/orgBoss/Book/book.org")   
                        "** %^{Enter the Book Name} %t :BOOK: \n%[~/.emacs.d/GTD/orgTemplate/.book_template.txt]\n")
          ("f" "Film" entry (  file+datetree "~/.emacs.d/GTD/orgBoss/Film/film.org")  
                        "** %^{Enter the Film Name} %t :FILM: \n%[~/.emacs.d/GTD/orgTemplate/.film_template.txt]\n")
          ("d" "Daily Review" entry   (file+datetree "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org")  
                        "** %t :COACH: \n%[~/.emacs.d/GTD/orgTemplate/.daily_review.txt]\n")
          ("a" "Appointment Or Meeting" entry (file+headline "~/.emacs.d/CalendarDairy/diary.org")
                        "** APP [#B] %^{Description} %^g
                        %?
                        Added: %U" 
                        :clock-in :clock-resume)
        ("w" "SITES" entry  (file+headline "~/.emacs.d/GTD/orgBoss/Site/www.site.org" "SITES")  
                        "* %^{Enter the Name of the Site}\n %?" )
          ("s" "Someday"  entry   (file+datetree "~/.emacs.d/GTD/orgBoss/Someday/someday.org") 
                        "** %^{Someday Heading} [#B] %U\n%?\n"  )
          ("v" "Vocab"  entry (file+datetree  "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org" ) 
                        "** %^{Word?}\n%?\n"  )
          ( "p" "Private" entry (file+datetree "~/.emacs.d/GTD/orgBoss/Private/privnotes.org")  
                         "\n* %^{topic} [#A] %T \n%i%?\n")
         ("o" "contact"  entry  (file+datetree "~/.emacs.d/gtd/phone.org" ) 
                        "\n* %^{name} :contact:\n\n")
         ("q" "Quick note" item
          (file+headline "~/.emacs.d/GTD/orgBoss/Note/notes.org" "Quick notes")
                        "** %^{Keyword?} [#B]  %^g
                         Added: %U
                         %?"
                        :clock-in t :clock-resume t                    
          )
         ("h" "Habit" entry (file "~/.emacs.d/GTD/orgBoss/Habit/habits.org")
          "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")

    ))

;; Custom agenda command definitions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq org-agenda-custom-commands                               ;;
;;       (quote (("N" "Notes" tags "NOTE"                         ;;
;;                ((org-agenda-overriding-header "Notes")         ;;
;;                 (org-tags-match-list-sublevels t)))            ;;
;;               ("h" "Habits" tags-todo "STYLE=\"habit\""        ;;
;;                ((org-agenda-overriding-header "Habits")        ;;
;;                 (org-agenda-sorting-strategy                   ;;
;;                  '(todo-state-down effort-up category-keep)))) ;;
;; )))                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq org-agenda-custom-commands
      '(("O" "Office block agenda"
         ((agenda "" ((org-agenda-ndays 1))) 
                      ;; limits the agenda display to a single day
          (tags-todo "+PRIORITY=\"A\"")
          (tags-todo "computer|office|phone")
          (tags "project+CATEGORY=\"elephants\"")
          ;(tags "review" ((org-agenda-files '("~/org/circuspeanuts.org"))))
                          ;; limits the tag search to the file circuspeanuts.org
          (todo "WAITING"))
         ((org-agenda-compact-blocks t))) ;; options set here apply to the entire block
        ;; ...other commands here
        ("go" "Office" 
         (tags-todo "@F708")
         (tags-todo "@work"))
        ("gc" "Computer" tags-todo "computer")
        ("gp" "Phone" tags-todo "phone")
        ("gh" "Home" tags-todo "home")
        ("gm" "Projects" tags-todo "+multiAxis")

        ("p" . "Priorities")
        ("pa" "A items" tags-todo "+PRIORITY=\"A\"")
        ("pb" "B items" tags-todo "+PRIORITY=\"B\"")
        ("pc" "C items" tags-todo "+PRIORITY=\"C\"")
        ))
; (setq org-capture-templates
;     '(("Todo" ?t "* TODOS %^{To Do What?(Brief Description)} %^g\n%?\nAdded: %U" "~/.emacs.d/GTD/newgtd.org" "Tasks")
;     ("IDEA" ?i "* TODO %^{What's your IDEA (Briefly)} \n %?" "~/.emacs.d/GTD/orgBoss/IDEA/idea.org" "IDEA")
;       ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  "~/.emacs.d/GTD/orgBoss/Journal/journal.org")
;       ("Clipboard" ?c "** %^{Head Line} %U %^g\n%c\n%?"  "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org")
;       ("Receipt"   ?r "** %^{BriefDesc} %U %^g\n%?"   "~/.emacs.d/GTD/orgBoss/Financial/finances.org")
;       ("Book" ?b "** %^{Enter the Book Name} %t :BOOK: \n%[~/.emacs.d/GTD/orgTemplate/.book_template.txt]\n"
;          "~/.emacs.d/GTD/orgBoss/Book/book.org")
;       ("Film" ?f "** %^{Enter the Film Name} %t :FILM: \n%[~/.emacs.d/GTD/orgTemplate/.film_template.txt]\n"
;          "~/.emacs.d/GTD/orgBoss/Film/film.org")
;       ("Daily Review" ?d "** %t :COACH: \n%[~/.emacs.d/GTD/orgTemplate/.daily_review.txt]\n"
;          "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org")
;     ("SITES" ?w "* %^{Enter the Name of the Site}\n %?" "~/.emacs.d/GTD/orgBoss/Site/www.site.org" "SITES")
;       ("Someday"   ?s "** %^{Someday Heading} %U\n%?\n"  "~/.emacs.d/GTD/orgBoss/Someday/someday.org")
;       ("Vocab"   ?v "** %^{Word?}\n%?\n"  "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org")
;      ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "~/.emacs.d/GTD/orgBoss/Private/privnotes.org")
;      ("Contact" ?p "\n* %^{Name} :CONTACT:\n%[l:/contemp.txt]\n"
;                "F:/gtd/privnotes.org")
;      )
;    )
;
;
; (setq org-remember-templates
;       '(("l" "灵感" entry (file+headline "~/.emacs.d/GTD/writing.org" "创意")
;                         "* %?\n %i\n %a")
;         ("j" "Journal" entry (file+datetree "~/.emacs.d/GTD/orgBoss/Journal/journal.org" )
;                         "* %?\n输入于： %U\n %i\n %a")
;         ("t" "Todo" entry  (file+headline "~/.emacs.d/GTD/newgtd.org" "Tasks")
;                         "* TODOS %^{To Do What?(Brief Description)} %^g\n%?\nAdded: %U" )
;         ("i" "IDEA" entry  (file+headline "~/.emacs.d/GTD/orgBoss/IDEA/idea.org" "IDEA")
;                         "* TODO %^{What's your IDEA (Briefly)} \n %?" )
;           ("c" "Clipboard" entry (file+datetree  "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org")
;                         "** %^{Head Line} %U %^g\n%c\n%?"  )
;           ("r" "Receipt" entry  (file+datetree  "~/.emacs.d/GTD/orgBoss/Financial/finances.org" )
;                         "** %^{BriefDesc} %U %^g\n%?"   )
;           ("b" "Book" entry  (file+datetree "~/.emacs.d/GTD/orgBoss/Book/book.org")
;                         "** %^{Enter the Book Name} %t :BOOK: \n%[~/.emacs.d/GTD/orgTemplate/.book_template.txt]\n")
;           ("f" "Film" entry (  file+datetree "~/.emacs.d/GTD/orgBoss/Film/film.org")
;                         "** %^{Enter the Film Name} %t :FILM: \n%[~/.emacs.d/GTD/orgTemplate/.film_template.txt]\n")
;           ("d" "Daily Review" entry   (file+datetree "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org")
;                         "** %t :COACH: \n%[~/.emacs.d/GTD/orgTemplate/.daily_review.txt]\n")
;         ("w" "SITES" entry  (file+headline "~/.emacs.d/GTD/orgBoss/Site/www.site.org" "SITES")
;                         "* %^{Enter the Name of the Site}\n %?" )
;           ("s" "Someday"  entry   (file+datetree "~/.emacs.d/GTD/orgBoss/Someday/someday.org")
;                         "** %^{Someday Heading} %U\n%?\n"  )
;           ("v" "Vocab"  entry (file+datetree  "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org" )
;                         "** %^{Word?}\n%?\n"  )
;           ( "p" "Private" entry (file+datetree "~/.emacs.d/GTD/orgBoss/Private/privnotes.org")
;                          "\n* %^{topic} %T \n%i%?\n")
;          ("a" "contact"  entry  (file+datetree "~/.emacs.d/gtd/phone.org" )
;                         "\n* %^{name} :contact:\n\n")
;     ))
;
; (setq org-remember-templates
;     '(("Todo" ?t "* TODOS %^{To Do What?(Brief Description)} %^g\n%?\nAdded: %U" "~/.emacs.d/GTD/newgtd.org" "Tasks")
;     ("IDEA" ?i "* TODO %^{What's your IDEA (Briefly)} \n %?" "~/.emacs.d/GTD/orgBoss/IDEA/idea.org" "IDEA")
;       ("Journal"   ?j "** %^{Head Line} %U %^g\n%i%?"  "~/.emacs.d/GTD/orgBoss/Journal/journal.org")
;       ("Clipboard" ?c "** %^{Head Line} %U %^g\n%c\n%?"  "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org")
;       ("Receipt"   ?r "** %^{BriefDesc} %U %^g\n%?"   "~/.emacs.d/GTD/orgBoss/Financial/finances.org")
;       ("Book" ?b "** %^{Enter the Book Name} %t :BOOK: \n%[~/.emacs.d/GTD/orgTemplate/.book_template.txt]\n"
;          "~/.emacs.d/GTD/orgBoss/Book/book.org")
;       ("Film" ?f "** %^{Enter the Film Name} %t :FILM: \n%[~/.emacs.d/GTD/orgTemplate/.film_template.txt]\n"
;          "~/.emacs.d/GTD/orgBoss/Film/film.org")
;       ("Daily Review" ?d "** %t :COACH: \n%[~/.emacs.d/GTD/orgTemplate/.daily_review.txt]\n"
;          "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org")
;     ("SITES" ?w "* %^{Enter the Name of the Site}\n %?" "~/.emacs.d/GTD/orgBoss/Site/www.site.org" "SITES")
;       ("Someday"   ?s "** %^{Someday Heading} %U\n%?\n"  "~/.emacs.d/GTD/orgBoss/Someday/someday.org")
;       ("Vocab"   ?v "** %^{Word?}\n%?\n"  "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org")
;      ("Private" ?p "\n* %^{topic} %T \n%i%?\n" "~/.emacs.d/GTD/orgBoss/Private/privnotes.org")
;      ("Contact" ?p "\n* %^{Name} :CONTACT:\n%[l:/contemp.txt]\n"
;                "F:/gtd/privnotes.org")
;      )
;    )
;
;
; “|”用来分隔“未完成”和“完成”两种状态的关键词，前面为未完成项，后面为完成项。如果没有“|”符号，最后一个关键词将被设为完成项，其余为未完成项。
; ! 表示时间
; 所有的TODO都只有 两种类  Undo and  done 用 |分隔
; type 相当于 #+TYP_TODO  也有两种类型
; sequence 相当于 #+SEQ_TODO   也有两种类型
; 可以写出多个sequence 等你工作 学习 继续进行修改 但是注意无论是type还是sequence都得有|
(setq org-todo-keywords
  '((type "工作(w!)" "学习(s!)" "休闲(l!)" "|")
    (type "REPORT(r!)" "BUG(b!)" "KNOWNCAUSE(k!)" "|" "FIXED(f!)")
    (sequence "PENDING(p!)" "TODO(t!)"  "|" "DONE(d!)" "ABORT(a@/!)")
))
(setq org-todo-keyword-faces
  '(("工作" .      (:background "red" :foreground "white" :weight bold))
    ("学习" .      (:background "white" :foreground "red" :weight bold))
    ("休闲" .      (:foreground "MediumBlue" :weight bold)) 
    ("REPORT" .      (:background "red" :foreground "white" :weight bold))
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

                      ("@errand" . ?e)
                      ("@office" . ?o)
                      ("@home" . ?H)
                      ("@Dormitry" . ?D)
                      ("@NCEPU" . ?n)
                      ("@F708" . ?f)
                      (:endgroup . nil)
                      (:newline)
                      (:startgroup . nil)
                      ("laptop" . ?l) 
                      ("java" . ?j)
                      ("perl" . ?p)
                      ("matlab" . ?m)
                      ("clojure" . ?c)
                      ("scheme" . ?s)
                      ("WAITING" . ?w)
                      ("HOLD" . ?h)
                      ("PERSONAL" . ?P)
                      ("WORK" . ?W)
                      ("ORG" . ?O)
                      ("crypt" . ?E)
                      ("NOTE" . ?n)
                      ("CANCELLED" . ?C)
                      ("FLAGGED" . ??)
                      (:endgroup . nil)
                      (:newline)
                      (:startgroup . nil)
                      ("++multiAxis" . ?t)
                      ("++the-parens-of-dead" . ?z)
                      ("++graduation" . ?g)
                      (:endgroup . nil)
                      (:newline)
                      (:startgroup . nil)
                      ("紧急重要" . ?a)
                      ("紧急不重要" . ?b)
                      ("不紧急重要" . ?c)
                      ("不紧急不重要" . ?d)
                      (:endgroup . nil)
                      ))


;;; privilege
;; 优先级范围和默认任务的优先级
(setq org-highest-priority ?A)
(setq org-lowest-priority  ?E)
(setq org-default-priority ?E) 
;; 优先级醒目外观
(setq org-priority-faces
  '((?A . (:background "red" :foreground "white" :weight bold))
    (?B . (:background "DarkOrange" :foreground "white" :weight bold))
    (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
    (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
    (?E . (:background "SkyBlue" :foreground "black" :weight bold))
))



;; for idle time
(defun jump-to-org-agenda ()
  (interactive)
  (let ((buf (get-buffer "*Org Agenda*"))
        wind)
    (if buf
        (if (setq wind (get-buffer-window buf))
            (select-window wind)
          (if (called-interactively-p)
              (progn
                (select-window (display-buffer buf t t))
                (org-fit-window-to-buffer)
                ;; (org-agenda-redo)
                )
            (with-selected-window (display-buffer buf)
              (org-fit-window-to-buffer)
              ;; (org-agenda-redo)
              )))
      (call-interactively 'org-agenda-list)))
  ;;(let ((buf (get-buffer "*Calendar*")))
  ;;  (unless (get-buffer-window buf)
  ;;    (org-agenda-goto-calendar)))
  )

;; 300s =5min
(run-with-idle-timer 300 t 'jump-to-org-agenda)


;; change "DONE" keyword style
(setq org-fontify-done-headline t)
(custom-set-faces
 '(org-done ((t (:foreground "PaleGreen"   
                 :weight normal
                 :strike-through t))))
 '(org-headline-done 
            ((((class color) (min-colors 16) (background dark)) 
               (:foreground "LightSalmon" :strike-through t)))))

(defun my/org-review-month (start-date)
  "Review the month's clocked tasks and time."
  (interactive (list (org-read-date)))
  ;; Set to the beginning of the month
  (setq start-date (concat (substring start-date 0 8) "01"))
  (let ((org-agenda-show-log t)
        (org-agenda-start-with-log-mode t)
        (org-agenda-start-with-clockreport-mode t)
        (org-agenda-clockreport-parameter-plist '(:link t :maxlevel 3)))
    (org-agenda-list nil start-date 'month)))

;; http://pages.sachachua.com/.emacs.d/Sacha.html
;; Registers allow you to jump to a file or other location quickly. To jump to a register, use C-x r j followed by the letter of the register. Using registers for all these file shortcuts is probably a bit of a waste since I can easily define my own keymap, but since I rarely go beyond register A anyway. Also, I might as well add shortcuts for refiling.
(defvar my/refile-map (make-sparse-keymap))

(defmacro my/defshortcut (key file)
  `(progn
     (set-register ,key (cons 'file ,file))
     (define-key my/refile-map
       (char-to-string ,key)
       (lambda (prefix)
         (interactive "p")
         (let ((org-refile-targets '(((,file) :maxlevel . 6)))
               (current-prefix-arg (or current-prefix-arg '(4))))
           (call-interactively 'org-refile))))))


  (define-key my/refile-map "," 'my/org-refile-to-previous-in-file)

(my/defshortcut ?i "~/.emacs.d/GTD/newgtd.org")
(my/defshortcut ?f "~/.emacs.d/GTD/orgBoss/Film/film.org")
(my/defshortcut ?v "~/.emacs.d/GTD/orgBoss/Vocab/vocab.org")
(my/defshortcut ?s "~/.emacs.d/GTD/orgBoss/Someday/someday.org")
(my/defshortcut ?S "~/.emacs.d/GTD/orgBoss/Site/www.site.org")
(my/defshortcut ?B "~/.emacs.d/GTD/orgBoss/Book/book.org")
(my/defshortcut ?c "~/.emacs.d/GTD/orgBoss/Clipboard/clipboard.org")
(my/defshortcut ?b "~/.emacs.d/GTD/orgBoss/business/business.org")
(my/defshortcut ?e "~/.emacs.d/GTD/orgBoss/code/codes.org")
(my/defshortcut ?W "~/.emacs.d/GTD/orgBoss/Site/blog.org")
(my/defshortcut ?j "~/.emacs.d/GTD/orgBoss/Journal/journal.org")
(my/defshortcut ?I "~/.emacs.d/GTD/orgBoss/IDEA/idea.org")
(my/defshortcut ?d "~/.emacs.d/GTD/orgBoss/DailyReview/daily.org")
(my/defshortcut ?l "~/.emacs.d/GTD/orgBoss/learning.org")
(my/defshortcut ?q "~/.emacs.d/GTD/orgBoss/questions.org")
(my/defshortcut ?w "~/.emacs.d/GTD/writing.org")




(add-to-list 'org-global-properties
      '("Effort_ALL". "0:05 0:15 0:30 1:00 2:00 3:00 4:00"))



(defvar my/weekly-review-line-regexp
  "^  \\([^:]+\\): +\\(Sched[^:]+: +\\)?TODO \\(.*?\\)\\(?:[      ]+\\(:[[:alnum:]_@#%:]+:\\)\\)?[        ]*$"
  "Regular expression matching lines to include.")
(defvar my/weekly-done-line-regexp
  "^  \\([^:]+\\): +.*?\\(?:Clocked\\|Closed\\):.*?\\(TODO\\|DONE\\) \\(.*?\\)\\(?:[       ]+\\(:[[:alnum:]_@#%:]+:\\)\\)?[        ]*$"
  "Regular expression matching lines to include as completed tasks.")

(defun my/quantified-get-hours (category time-summary)
  "Return the number of hours based on the time summary."
  (if (stringp category)
      (if (assoc category time-summary) (/ (cdr (assoc category time-summary)) 3600.0) 0)
    (apply '+ (mapcar (lambda (x) (my/quantified-get-hours x time-summary)) category))))

(defun _my/extract-tasks-from-agenda (string matchers prefix line-re)
  (with-temp-buffer
    (insert string)
    (goto-char (point-min))
    (while (re-search-forward line-re nil t)
      (let ((temp-list matchers))
        (while temp-list
          (if (save-match-data
                (string-match (car (car temp-list)) (match-string 1)))
              (progn
                (add-to-list (cdr (car temp-list)) (concat prefix (match-string 3)) t)
                (setq temp-list nil)))
          (setq temp-list (cdr temp-list)))))))

(ert-deftest _my/extract-tasks-from-agenda ()
  (let (list-a list-b (line-re "\\([^:]+\\):\\( \\)\\(.*\\)"))
    (_my/extract-tasks-from-agenda
     "listA: Task 1\nother: Task 2\nlistA: Task 3"
     '(("listA" . list-a)
       ("." . list-b))
     "- [ ] "
     line-re)
    (should (equal list-a '("- [ ] Task 1" "- [ ] Task 3")))
    (should (equal list-b '("- [ ] Task 2")))))

(defun _my/get-upcoming-tasks ()
  (save-window-excursion
      (org-agenda nil "W")
      (_my/extract-tasks-from-agenda (buffer-string)
                                        '(("routines" . ignore)
                                          ("business" . business-next)
                                          ("people" . relationships-next)
                                          ("tasks" . emacs-next)
                                          ("." . life-next))
                                        "  - [ ] "
                                        my/weekly-review-line-regexp)))
(defun _my/get-previous-tasks ()
  (let (string)
    (save-window-excursion
      (org-agenda nil "W")
      (org-agenda-later -1)
      (org-agenda-log-mode 16)
      (setq string (buffer-string))
      ;; Get any completed tasks from the current week as well
      (org-agenda-later 1)
      (org-agenda-log-mode 16)
      (setq string (concat string "\n" (buffer-string)))
      (_my/extract-tasks-from-agenda string
                                        '(("routines" . ignore)
                                          ("business" . business)
                                          ("people" . relationships)
                                          ("tasks" . emacs)
                                          ("." . life))
                                        "  - [X] "
                                        my/weekly-done-line-regexp))))

(defun my/org-summarize-focus-areas (date)
  "Summarize previous and upcoming tasks as a list."
  (interactive (list (org-read-date-analyze (if current-prefix-arg (org-read-date) "-fri") nil '(0 0 0))))
  (let (business relationships life business-next relationships-next life-next string emacs emacs-next
                 start end time-summary biz-time ignore base-date)
    (setq base-date (apply 'encode-time date))
    (setq start (format-time-string "%Y-%m-%d" (days-to-time (- (time-to-number-of-days base-date) 6))))
    (setq end (format-time-string "%Y-%m-%d" (days-to-time (1+ (time-to-number-of-days base-date)))))
    (setq time-summary (quantified-summarize-time start end))
    (setq biz-time (my/quantified-get-hours "Business" time-summary))
    (_my/get-upcoming-tasks)
    (_my/get-previous-tasks)
    (setq string
          (concat
           (format "- *Business* (%.1fh - %d%%)\n" biz-time (/ biz-time 1.68))
           (mapconcat 'identity business "\n") "\n"
           (mapconcat 'identity business-next "\n")
           "\n"
           (format "  - *Earn* (%.1fh - %d%% of Business)\n"
                   (my/quantified-get-hours "Business - Earn" time-summary)
                   (/ (my/quantified-get-hours "Business - Earn" time-summary) (* 0.01 biz-time)))
           (format "  - *Build* (%.1fh - %d%% of Business)\n"
                   (my/quantified-get-hours "Business - Build" time-summary)
                   (/ (my/quantified-get-hours "Business - Build" time-summary) (* 0.01 biz-time)))
           (format "  - *Connect* (%.1fh - %d%% of Business)\n"
                   (my/quantified-get-hours "Business - Connect" time-summary)
                   (/ (my/quantified-get-hours "Business - Connect" time-summary) (* 0.01 biz-time)))
           (format "- *Relationships* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours '("Discretionary - Social"
                                                 "Discretionary - Family") time-summary)
                   (/ (my/quantified-get-hours '("Discretionary - Social"
                                                    "Discretionary - Family") time-summary) 1.68))
           (mapconcat 'identity relationships "\n") "\n"
           (mapconcat 'identity relationships-next "\n") "\n"
           "\n"
           (format "- *Discretionary - Productive* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Discretionary - Productive" time-summary)
                   (/ (my/quantified-get-hours "Discretionary - Productive" time-summary) 1.68))
           (format "  - *Drawing* (%.1fh)\n"
                   (my/quantified-get-hours '("Discretionary - Productive - Drawing")  time-summary))
           (format "  - *Emacs* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Emacs" time-summary))
           (mapconcat 'identity emacs "\n") "\n"
           (mapconcat 'identity emacs-next "\n") "\n"
           (format "  - *Coding* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Coding" time-summary))
           (mapconcat 'identity life "\n") "\n"
           (mapconcat 'identity life-next "\n") "\n"
           (format "  - *Sewing* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Sewing" time-summary))
           (format "  - *Writing* (%.1fh)\n"
                   (my/quantified-get-hours "Discretionary - Productive - Writing" time-summary))
           (format "- *Discretionary - Play* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Discretionary - Play" time-summary)
                   (/ (my/quantified-get-hours "Discretionary - Play" time-summary) 1.68))
           (format "- *Personal routines* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Personal" time-summary)
                   (/ (my/quantified-get-hours "Personal" time-summary) 1.68))
           (format "- *Unpaid work* (%.1fh - %d%%)\n"
                   (my/quantified-get-hours "Unpaid work" time-summary)
                   (/ (my/quantified-get-hours "Unpaid work" time-summary) 1.68))
           (format "- *A- (Childcare)* (%.1fh - %d%% of total)\n"
                   (my/quantified-get-hours '("A-") time-summary)
                   (/ (my/quantified-get-hours '("A-") time-summary) 1.68))
           (format "- *Sleep* (%.1fh - %d%% - average of %.1f per day)\n"
                   (my/quantified-get-hours "Sleep" time-summary)
                   (/ (my/quantified-get-hours "Sleep" time-summary) 1.68)
                   (/ (my/quantified-get-hours "Sleep" time-summary) 7)
                   )))
    (if (called-interactively-p 'any)
        (insert string)
      string)))




;;; agenda view setting
;; Do not dim blocked tasks
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

;; Custom agenda command definitions
(setq org-agenda-show-future-repeats nil)



;;;better headder  bullet
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))



;; better bullets                                                                                                ;;
(font-lock-add-keywords 'org-mode                                                                                ;;
                        '(("^ +\\([-*]\\) "                                                                      ;;
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))              ;;

;;; let header become better                                                                                     ;; ;;
(let* ((variable-tuple (cond ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))                       ;; ;;
                             ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))                         ;; ;;
                             ((x-list-fonts "Verdana")         '(:font "Verdana"))                               ;; ;;
                             ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))                          ;; ;;
                             (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))           ;; ;;
       (base-font-color     (face-foreground 'default nil 'default))                                             ;; ;;
       (headline           `(:inherit default :weight bold :foreground ,base-font-color)))                       ;; ;;
                                                                                                                 ;; ;;
  (custom-theme-set-faces 'user                                                                                  ;; ;;
                          `(org-level-8 ((t (,@headline ,@variable-tuple))))                                     ;; ;;
                          `(org-level-7 ((t (,@headline ,@variable-tuple))))                                     ;; ;;
                          `(org-level-6 ((t (,@headline ,@variable-tuple))))                                     ;; ;;
                          `(org-level-5 ((t (,@headline ,@variable-tuple))))                                     ;; ;;
                          `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))                         ;; ;;
                          `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))                        ;; ;;
                          `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))                         ;; ;;
                          `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))                        ;; ;;
                          `(org-document-title ((t (,@headline ,@variable-tuple :height 1.5 :underline nil)))))) ;; ;;





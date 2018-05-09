;;~/.emacs/init.el
;ban backup
(setq-default make-backup-files nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

;;(global-hl-line-mode 1)

;;time
(display-time)

;;number
(global-linum-mode 1)
;(linum-relative-global-mode t)
(setq linum-format "%4d | ")

;just for gdb-mode
(global-set-key [f12] 'gdb)
(global-set-key [f11] 'gdb-many-windows)
(global-set-key [f10] 'gud-next)
(global-set-key [f9] 'gud-cont)
(global-set-key [f6] 'delete-window)
(global-set-key [f4] 'enlarge-window)
(global-set-key [f3] 'other-window)

;indent
(setq c-default-style "linux"
        c-basic-offset 4)

;;shubiao
(mouse-wheel-mode -1)

;;ban the tool bar of start up
(tool-bar-mode 0)
(menu-bar-mode 0)
;;(scroll-bar-mode 0) 

;;ban the page of start up
(setq inhibit-startup-message t)

;;gungdong
;;(setq scroll-step 10 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;this is added by me -> the up;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)


;;tab
(setq default-tab-width 4)

;;column
(column-number-mode t)

(show-paren-mode t)

;
;;;indent
;(setq c-indent-level 4)
;
;(setq c-continued-statement-offset 4)
;
;(setq c-brace-offset -4)
;
;(setq c-argdecl-indent 4)
;
;(setq c-label-offset -4)
;
;(setq c-basic-offset 4)
;
;(global-set-key "\C-m" 'reindent-then-newline-and-indent)
;
;(setq indent-tabs-mode nil)
;
;(setq standard-indent 4)
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;this is added by internet -> the up;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(setq display-time-24hr-format t) 

;;(setq display-time-day-and-date t) 


;;(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]  
;;             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
;;                          [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
;;                                       [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
;;                                                    [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
;;  (global-unset-key k)))]]]]]]]]]]]]]]]]]]]]]]]]])'))

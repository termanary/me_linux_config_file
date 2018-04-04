;(setq-default make-backup-files nil)
;just for gdb-mode
(global-set-key [f12] 'gdb)
(global-set-key [f11] 'gdb-many-windows)
(global-set-key [f10] 'gud-next)
(global-set-key [f9] 'gud-cont)
(global-set-key [f6] 'delete-window)
(global-set-key [f4] 'enlarge-window)
(global-set-key [f3] 'other-window)

(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;;time
(display-time)

;;number
(global-linum-mode 1)
;(linum-relative-global-mode t)
(setq linum-format "%4d | ")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;this is added by me -> the up;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;column
(column-number-mode t)

(show-paren-mode t)


;;tab
(setq default-tab-width 4)


;;indent
(setq c-indent-level 4)

(setq c-continued-statement-offset 4)

(setq c-brace-offset -4)

(setq c-argdecl-indent 4)

(setq c-label-offset -4)

(setq c-basic-offset 4)

(global-set-key "\C-m" 'reindent-then-newline-and-indent)

(setq indent-tabs-mode nil)

(setq standard-indent 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;this is added by internet -> the up;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

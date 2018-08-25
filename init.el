;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq-default make-backup-files nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

;;time
(display-time)

;;number
(global-linum-mode 1)
(setq linum-format "%4d | ")

;(defun te ()
  ;(gdb "gdb -i=mi $*")
  ;(emacs_gdb)
  ;)

(fset 'emacs_gdb
   "g\C-m\C-[xgdb man\C-i\C-m\C-xo\C-xo\C-xo\C-x0\C-xo\C-x0\C-xo\C-x0")
;just for gdb-mode
(global-set-key [f12] 'gdb)
(global-set-key [f11] 'emacs_gdb)
(global-set-key [f8] 'gud-cont)
(global-set-key [f7] 'gud-next)
;(global-set-key [f6] 'delete-window)
;(global-set-key [f3] 'other-window)
(global-set-key [f2] 'enlarge-window)

;HELP:
;http://www.voidcn.com/article/p-kajzyowe-be.html
;https://blog.csdn.net/ruglcc/article/details/7875631
;https://blog.csdn.net/Matrix_Designer/article/details/5869886

;FOR HELP:
;C-h k:key / C-h f:function

(fset 'copy_own
   "\C-xh\M-w")
(global-set-key (kbd "C-q") 'copy_own)

;(defun my_own_define_copy (&optionl arg)
  ;"Copy paragraphes at point"
  ;(interactive "P")
  ;(let ((beg (progn backward-paragraph 1) (point)))
    ;(end (progn (forward-paragraph arg) (point))))
  ;(copy-region-as-kill beg end)
  ;)

;(beginning-of-buffer)
;(set-mark-command)
;(end-of-buffer)
;(kill-ring-save)
;(message "Hello,World!")
;(mark-whole-buffer)

;(defun my_own_define_copy ()
  ;(interactive)
  ;(mark-whole-buffer)
  ;(message "copy buffer")
  ;;(kill-ring-save (region-beginning) (buffer-end))
  ;)

;indent
(setq c-default-style "linux"
        c-basic-offset 4)

;;mouse
(mouse-wheel-mode -1)

;;ban the tool bar of start up
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0) 

;;ban the page of start up
(setq inhibit-startup-message t)

;;gungdong
(setq scroll-step 10 )

(electric-pair-mode t)
(electric-indent-mode t)
(electric-layout-mode t)

;;tab
(setq default-tab-width 4)

;;column
(column-number-mode t)

(show-paren-mode t)

;copy from stackoverflow
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))


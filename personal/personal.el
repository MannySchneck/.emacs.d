;; Manny Schneck emacs config



;;; Basic usability
(scroll-bar-mode -1)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(set-face-foreground 'highlight nil)
(setq ring-bell-function 'ignore)
(global-linum-mode 1)
(yas-global-mode 1)
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
;; Personal Key-chords
(key-chord-define-global "xb" 'other-window)
(key-chord-define-global "wj" 'ace-window)

;; Smartparens
(sp-with-modes '(racket-mode racket-repl-mode)
  (sp-local-pair "`" nil :actions nil)
  (sp-local-pair "'" nil :actions nil)
  (sp-local-pair "#|" "|#"))

;; racket-mode
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))
(add-hook 'racket-repl-mode-hook
          (lambda ()
            (smartparens-mode)))

;; org mode
(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c @") 'org-time-stamp-inactive)))

;; font


;; Auxtex
(setq TeX-auto-save t)
(setq TeX-parse-self t)

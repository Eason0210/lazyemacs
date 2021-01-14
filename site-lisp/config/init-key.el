;;; init-key.el --- key binding -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; key setting
(when (eq system-type 'windows-nt)
  (setq w32-pass-lwindow-to-system nil)
  (setq w32-lwindow-modifier 'super)
  (setq w32-pass-rwindow-to-system nil)
  (setq w32-rwindow-modifier 'super)
  (w32-register-hot-key [s-])

  (setq w32-pass-apps-to-system nil)
  (define-key key-translation-map (kbd "<apps>") (kbd "C-\\"))
  )

;; go-translate
(lazy-load-global-keys
 '(("t" . go-translate)                 ;光标处的单词, buffer显示
   ("T" . go-translate-popup)           ;光标处的单词, tooltip显示
   ("s" . go-translate-kill-ring-save)  ;光标处的单词, 保存到 kill-ring
   ("p" . go-translate-popup-current)   ;直接翻译光标单词, tooltip显示
   )
 "init-go-translate"
 "C-c")

;; Magit
(lazy-load-global-keys
 '(
   ("C-x g" . magit-status+)
   ("s-x g" . magit-submodule-add+))
 "init-git")

(provide 'init-key)
;;; init-key.el ends here

;;; init-local.el --- Configure personal local settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; editing
(define-key global-map (kbd "C-?") 'undo-redo)

;; mscl-mode
;; (autoload 'mscl-mode "mscl-mode" "Major mode for editing MSCL code." t)
;; (add-to-list 'auto-mode-alist '("\\.pwx?macro\\'" . mscl-mode))

;; generic
(setq word-wrap-by-category t) ; 中英文折行


(provide 'init-local)
;;; init-local.el ends here

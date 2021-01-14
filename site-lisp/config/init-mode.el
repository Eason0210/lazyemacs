;;; init-mode.el --- File mode setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; ### auto-mode-alist ###
;;; --- 绑定扩展名到特定的模式
(defun add-to-alist (alist-var elt-cons &optional no-replace)
  "Add to the value of ALIST-VAR an element ELT-CONS if it isn't there yet.
If an element with the same car as the car of ELT-CONS is already present,
replace it with ELT-CONS unless NO-REPLACE is non-nil; if a matching
element is not already present, add ELT-CONS to the front of the alist.
The test for presence of the car of ELT-CONS is done with `equal'."
  (let ((existing-element (assoc (car elt-cons) (symbol-value alist-var))))
    (if existing-element
        (or no-replace
            (rplacd existing-element (cdr elt-cons)))
      (set alist-var (cons elt-cons (symbol-value alist-var)))))
  (symbol-value alist-var))

(dolist (elt-cons '(
                    ("\\.markdown" . markdown-mode)
                    ("\\.md" . markdown-mode)
                    ("\\.[Cc][Ss][Vv]\\'" . csv-mode)
                    ("\\.[hg]s\\'" . haskell-mode)
                    ("\\.hi\\'" . haskell-mode)
                    ("\\.hs-boot\\'" . haskell-mode)
                    ("\\.chs\\'" . haskell-mode)
                    ("\\.cpp$" . c++-mode)
                    ("\\.h$" . c++-mode)
                    ("\\.py$" . python-mode)
                    ("SConstruct". python-mode)
                    ("\\.rs$" . rust-mode)
                    ("\\.pwx?macro" . mscl-mode)
                    ("\\.org\\'" . org-mode)
                    ("\\.org_archive\\'" . org-mode)
                    ("\\.yml\\'" . yaml-mode)
                    ("\\.toml\\'" . toml-mode)
                    ;; ("\\.css\\'" . css-mode)
                    ;; ("\\.wxss\\'" . css-mode)
                    ;; ("\\.js$" . js-mode)
                    ;; ("\\.wxs$" . js-mode)
                    ))
  (add-to-alist 'auto-mode-alist elt-cons))

;;; Mode load.

(autoload 'markdown-mode "init-markdown")
(autoload 'csv-mode "init-csv")
(autoload 'haskell-mode "init-haskell")
(autoload 'python-mode "init-python")
(autoload 'rust-mode "init-rust")
(autoload 'toml-mode "init-toml")
;; (autoload 'css-mode "init-css-mode")
(autoload 'mscl-mode "mscl-mode" "MSCL editing mode." t)
(autoload 'yaml-mode "init-yaml")

(provide 'init-mode)
;;; init-mode.el ends here

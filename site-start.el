;;; .emacs --- define load path  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/lazyemacs/site-lisp/")
;;(setq debug-on-error t)

(require 'init)
;;.emacs ends here

;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)
(defalias 'require-package 'require)
(defalias 'maybe-require-package 'require)
(let ((minver "24.5"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "25.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; define load path
(defvar lazyemacs-root-dir (file-truename "~/lazyemacs/site-lisp"))
(defvar lazyemacs-config-dir (concat lazyemacs-root-dir "/config"))
(defvar lazyemacs-extension-dir (concat lazyemacs-root-dir "/extensions"))

(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
`(let ((normal-gc-cons-threshold (* 20 1024 1024))
       (init-gc-cons-threshold (* 128 1024 1024)))
   (setq gc-cons-threshold init-gc-cons-threshold)
   (add-hook 'emacs-startup-hook
             (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
;; (require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
;; Calls (package-initialize)
;; (require 'init-elpa)      ;; Machinery for installing required packages
;;(require 'init-exec-path) ;; Set up $PATH

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
;; (require 'init-preload-local nil t)
(require 'init-font)
;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'diminish)
(maybe-require-package 'scratch)
(require-package 'command-log-mode)

;; (require 'init-frame-hooks)
;; (require 'init-xterm)
(require 'init-themes)
;; (require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-dired)
(require 'init-isearch)
;; (require 'init-grep)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)

(require 'init-recentf)
;; (require 'init-smex)
;; (require 'init-ivy)
(require 'init-selectrum)
(require 'init-hippie-expand)
(require 'init-company)
(require 'init-windows)
(require 'init-sessions)
;; (require 'init-mmm)

(require 'init-editing-utils)
;; (require 'init-whitespace)
(require 'lazy-load)
(require 'init-auto-save)
(require 'init-mode)
(require 'init-key)

;; (require 'init-vc)
;; (require 'init-git)
;; (require 'init-github)

(require 'init-projectile)

(require 'init-compile)
;; (require 'init-markdown)
;; (require 'init-csv)
;; (require 'init-javascript)

(require 'init-org)

;; (require 'init-html)
;; (require 'init-css)

(require 'init-c)
;; (require 'init-http)
;; (require 'init-python)
;; (require 'init-haskell)
;; (require 'init-elm)
;; (require 'init-purescript)

;; (require 'init-sql)
;; (require 'init-ocaml)
;; (require 'init-rust)
;; (require 'init-toml)
;; (require 'init-yaml)

(require 'init-paredit)
(require 'init-lisp)
;; (require 'init-slime)
;; (require 'init-clojure)
;; (require 'init-clojure-cider)
;; (require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-spelling))

;; (require 'init-misc)

;; (require 'init-folding)
;; (require 'init-dash)

;; (require-package 'sudo-edit)
;; (require-package 'gnuplot)
;; (require-package 'lua-mode)
;; (require-package 'htmlize)
;; (when *is-a-mac*
;;   (require-package 'osx-location))
;; (unless (eq system-type 'windows-nt)
;;   (maybe-require-package 'daemons))
;; (maybe-require-package 'shfmt)

;; (when (maybe-require-package 'uptimes)
;;   (setq-default uptimes-keep-count 200)
;;   (add-hook 'after-init-hook (lambda () (require 'uptimes))))

(when (fboundp 'global-eldoc-mode)
  (add-hook 'after-init-hook 'global-eldoc-mode))

;; ;;----------------------------------------------------------------------------
;; ;; Allow access from emacsclient
;; ;;----------------------------------------------------------------------------
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;; ;;----------------------------------------------------------------------------
;; ;; Variables configured via the interactive 'customize' interface
;; ;;----------------------------------------------------------------------------
;; (when (file-exists-p custom-file)
;;   (load custom-file))


;; ;;----------------------------------------------------------------------------
;; ;; Locales (setting them earlier in this file doesn't work in X)
;; ;;----------------------------------------------------------------------------
(require 'init-locales)


;; ;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local)

(require 'init-rime)

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
;;; init.el ends here
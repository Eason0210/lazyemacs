;;; init-selectrum.el --- Config for selectrum  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'orderless)
  (setq completion-styles '(orderless)))

(when (require-package 'selectrum)
  (add-hook 'after-init-hook (lambda () (selectrum-mode 1)))

  (when (maybe-require-package 'selectrum-prescient)
    (require 'prescient)
    (prescient-persist-mode 1)
    (selectrum-prescient-mode 1)
    (global-set-key [remap execute-extended-command] nil)
    (global-set-key [remap execute-extended-command] 'execute-extended-command))

  (when (maybe-require-package 'embark)
    (define-key selectrum-minibuffer-map (kbd "C-c C-o") 'embark-export)
    (define-key selectrum-minibuffer-map (kbd "C-c C-c") 'embark-act))

  (when (maybe-require-package 'consult)
    (when (maybe-require-package 'projectile)
      (setq-default consult-project-root-function 'projectile-project-root))

    (when (executable-find "rg")
      (global-set-key (kbd "M-?") 'consult-ripgrep))
    (global-set-key [remap switch-to-buffer] 'consult-buffer)
    (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
    (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
    (maybe-require-package 'embark-consult)  )

  (maybe-require-package 'consult-flycheck)

  (when (maybe-require-package 'marginalia)
    (add-hook 'after-init-hook (lambda () (marginalia-mode 1)))
    (setq-default marginalia-annotators '(marginalia-annotators-heavy)))
)

(provide 'init-selectrum)
;;; init-selectrum.el ends here

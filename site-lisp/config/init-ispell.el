;;; init-ispell.el --- Ispell configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq ispell-silently-savep t)          ;保存自己的个人词典不需要询问
(setq flyspell-issue-message-flag nil)
(setq ispell-personal-dictionary (expand-file-name "flyspell/.aspell.en.pws" user-emacs-directory))

(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))                ;文本模式启动拼写检查
(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
  (add-hook hook (lambda () (flyspell-mode -1))))               ;更改日志和日志编辑模式关闭拼写检查

(add-to-list 'ispell-skip-region-alist '("^#+BEGIN_SRC" . "^#+END_SRC")) ;不检查Org-mode的内嵌代码

(provide 'init-ispell)
;;; init-ispell.el ends here

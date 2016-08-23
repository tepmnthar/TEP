;;; packages.el --- local-user layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: tepmnthar <TEP@tepmnthardeMacBook-Pro.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `local-user-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `local-user/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `local-user/pre-init-PACKAGE' and/or
;;   `local-user/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst TEP-packages
  '(
    switch-window
    expand-region
    )
  "The list of Lisp packages required by the local-user layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun TEP/init-switch-window()
  (use-package switch-window
    :defer t)
  (setq-default switch-window-shortcut-style 'alphabet)
  (setq-default switch-window-timeout nil)
  (global-set-key (kbd "C-x o") 'switch-window)
  )
(defun TEP/init-expand-region()
  (use-package expand-region
    :defer t)
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

(with-eval-after-load "company"
  (global-set-key (kbd "S-SPC") 'company-complete))
;; 显示行号
(global-linum-mode)
;; 自动刷新
(global-auto-revert-mode t)
;; (global-set-key (kbd "C-v") 'scroll-up-command)
(add-hook 'org-mode-hook
          (lambda()
            (linum-mode -1)))
(setq column-number-mode t)

;; 高亮括号配对
(electric-pair-mode)

;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
;;; packages.el ends here

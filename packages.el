;; setup package manager and install

(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

(package-initialize)
(setq package-enable-at-startup nil)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package evil
  :ensure t
  :pin melpa-stable)

(use-package expand-region
  :ensure t
  :pin melpa-stable)

(use-package helm-ag
  :ensure t
  :pin melpa)

(use-package projectile
  :ensure t
  :pin melpa)

(use-package helm-projectile
  :ensure t
  :pin melpa)

(use-package racket-mode
  :ensure t
  :pin melpa)

(use-package haskell-mode
  :ensure t
  :bind (("C-i" . haskell-mode-jump-to-def))
  :pin melpa-stable)

(use-package intero
  :ensure t
  :pin melpa-stable)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :pin melpa-stable)

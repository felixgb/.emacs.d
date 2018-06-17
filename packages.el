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

(use-package doom-themes
  :ensure t
  :preface (defvar region-fg "")
  :init (load-theme 'doom-city-lights t))

(use-package neotree
  :ensure t)

(use-package solaire-mode
  :hook ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
  :config
  (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer))

(use-package solaire-mode
  :ensure t
  :config (add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer))
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

(use-package magit
  :ensure t
  :pin melpa)

(use-package evil-magit
  :ensure t
  :pin melpa-stable)

(use-package diff-hl
  :ensure t
  :pin melpa-stable)

(use-package racket-mode
  :ensure t
  :pin melpa)

;; haskell
(use-package haskell-mode
  :ensure t
  :bind (("C-i" . haskell-mode-jump-to-def))
  :pin melpa-stable)

(use-package intero
  :ensure t
  :pin melpa-stable)

;; rust
(use-package rust-mode
  :ensure t
  :pin melpa-stable)

(use-package racer
  :ensure t
  :pin melpa-stable)

(use-package cargo
  :ensure t
  :pin melpa-stable)

(use-package flycheck-rust
  :ensure t
  :pin melpa)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :pin melpa-stable)

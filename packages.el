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
  :preface (defvar region-fg ""))

(use-package evil
  :ensure t
  :pin melpa-stable)

(use-package expand-region
  :ensure t
  :pin melpa-stable)

(use-package creamsody-theme
  :ensure t
  :pin melpa-stable
  :init
  (load-theme 'creamsody t)
  (creamsody-modeline-three))

(use-package helm
  :ensure t
  :pin melpa
  :config
  (setq helm-follow-mode-persistent t
        helm-split-window-default-side 'right)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-c C-f") #'helm-find-files)
  (global-set-key (kbd "C-l") #'helm-semantic-or-imenu))

(use-package helm
  :ensure t
  :pin melpa
  :config
  (setq helm-follow-mode-persistent t
        helm-split-window-default-side 'right)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-c C-f") #'helm-find-files)
  (global-set-key (kbd "C-l") #'helm-semantic-or-imenu))

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

(use-package geiser
  :ensure t
  :pin melpa
  :config (setq geiser-active-implementations '(racket)))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "pandoc -f gfm")
  :pin melpa-stable)

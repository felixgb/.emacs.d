(load-file "packages.el")

(require 'evil)
(require 'company)
(require 'whitespace)
(require 'expand-region)

;; theme and fonts
(load-theme 'tango-dark)
(set-frame-font "xos4 Terminus 12" nil t)

;; disable bad stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; global variables
(setq
 ensime-startup-notification nil
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t

 company-auto-complete 'company-explicit-action-p
 company-tooltip-align-annotations t)

;; buffer local variables
(setq-default
 show-trailing-whitespace t
 indent-tabs-mode nil
 tab-width 8
 compile-command "make"
 c-basic-offset 2)

;; Hooks for modes
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'prog-mode-hook '(setq-default show-trailing-whitespace t))
(add-hook 'prog-mode-hook 'whitespace-mode)

;; limit line length to 120 chars
(setq whitespace-line-column 120
(setq whitespace-style '(face lines-tail))

;; modes
(evil-mode t)
(electric-indent-mode 1)
(projectile-mode)
(helm-projectile-on)
(company-mode t)

;; helm ag custom stuff
(setq
 grep-find-ignored-directories '("target")
 helm-ag-use-grep-ignore-list t)

;; global keybindings
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-]"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-f"))

;; go to definition for different langs
(evil-define-key 'normal haskell-mode-map
    (kbd "C-]") 'intero-goto-definition)

(evil-define-key 'normal racket-mode-map
    (kbd "C-]") 'racket-visit-definition)

(evil-define-key 'normal scala-mode-map
    (kbd "C-]") 'ensime-edit-definition)

(evil-define-key 'normal sbt-mode-map
    (kbd "C-l") 'comint-clear-buffer)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil))

;; keybindings
(define-key evil-normal-state-map (kbd "C-s") 'er/expand-region)
(define-key evil-insert-state-map (kbd "C-x C-o") 'company-complete)
(define-key evil-insert-state-map (kbd "C-x C-f") 'company-files)
(define-key evil-insert-state-map (kbd "C-x C-l") 'evil-complete-next-line)

;; search through open buffers
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "M-p") 'helm-buffer-list)

(define-key evil-normal-state-map (kbd "C-c i") 'ensime-import-type-at-point)
(define-key evil-normal-state-map (kbd "C-c s") 'sbt-command)
(define-key evil-normal-state-map (kbd "C-f") 'helm-ag-project-root)
(define-key evil-visual-state-map (kbd "C-f") 'helm-ag-project-root)

(load-file "org.el")

(defvar my-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(define-key evil-normal-state-map (kbd "SPC") my-leader-map)

(define-key my-leader-map "u" 'dumb-jump-quick-look)
(define-key my-leader-map "l" 'dumb-jump-go)
(define-key my-leader-map "b" 'dumb-jump-back)

(define-key my-leader-map "f" 'helm-ag-project-root)
(define-key my-leader-map "p" 'helm-projectile-find-file)
(define-key my-leader-map "x" 'helm-projectile-switch-project)
(define-key my-leader-map "r" 'projectile-dired)
(define-key my-leader-map "g" 'helm-google-suggest)

(define-key my-leader-map "s" 'projectile-toggle-between-implementation-and-test)

(define-key my-leader-map "a" 'org-agenda)
(define-key my-leader-map "c" 'org-capture)

(define-key my-leader-map "m" 'make)

(define-key evil-normal-state-map (kbd "C-c =")
  (lambda () (interactive)
    (set-frame-font "xos4 Terminus 22" nil t)))

(define-key evil-normal-state-map (kbd "C-c -")
  (lambda () (interactive)
    (set-frame-font "xos4 Terminus 12" nil t)))

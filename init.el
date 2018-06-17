(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/org.el")

(require 'evil)
(require 'magit)
(require 'company)
(require 'whitespace)
(require 'expand-region)
(require 'evil-magit)
(require 'ensime)
(require 'ensime-expand-region)

;; theme and fonts
(set-frame-font "Hack" nil t)

(custom-set-faces
 '(whitespace-line ((t (:background "black" :foreground "firebrick"))))
 '(whitespace-trailing ((t (:foreground "firebrick" :underline t)))))

;; disable stuff
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; global variables
(setq
 use-package-always-ensure t
 ensime-startup-notification nil
 create-lockfiles nil
 make-backup-files nil
 scroll-error-top-bottom t
 show-paren-delay 0.5

 ;; helm ag
 grep-find-ignored-directories '("target")
 helm-ag-use-grep-ignore-list t

 ;; limit line length to 120 chars
 whitespace-line-column 120
 whitespace-style '(trailing face lines-tail)

 ;; ediff mode
 ediff-highlight-all-diffs 'nil
 ediff-window-setup-function 'ediff-setup-windows-plain
 ediff-split-window-function 'split-window-horizontally

 company-auto-complete 'company-explicit-action-p
 company-tooltip-align-annotations t

 racer-cmd "~/.cargo/bin/racer"
 racer-rust-src-path "~/.local/src/rust/src")

(setq hippie-expand-try-functions-list '(try-expand-line
                                         try-expand-line-all-buffers))

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 8
 compile-command "make"
 c-basic-offset 2)

;; modes
(evil-mode t)
(global-diff-hl-mode)
(electric-indent-mode 1)
(projectile-mode)
(helm-projectile-on)
(global-company-mode +1)

;; Hooks for modes
(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

;; global keybindings
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-]"))
(global-unset-key (kbd "C-s"))
(global-unset-key (kbd "C-f"))
(global-unset-key (kbd "C-w"))

;; delete word in minibuffer and other non-evil modes
(global-set-key (kbd "C-w") 'backward-kill-word)

;; go to definition for different langs
(evil-define-key 'normal haskell-mode-map
    (kbd "C-]") 'intero-goto-definition)

(evil-define-key 'normal racket-mode-map
    (kbd "C-]") 'racket-visit-definition)

(evil-define-key 'normal scala-mode-map
    (kbd "C-]") 'ensime-edit-definition)

(evil-define-key 'normal rust-mode-map
    (kbd "C-]") 'racer-find-definition)

;; C-l clear sbt shell
(evil-define-key 'normal sbt-mode-map
    (kbd "C-l") 'comint-clear-buffer)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; keybindings
(define-key evil-normal-state-map (kbd "C-s") 'er/expand-region)
(define-key evil-insert-state-map (kbd "C-x C-o") 'company-complete)
(define-key evil-insert-state-map (kbd "C-x C-f") 'company-files)
(define-key evil-insert-state-map (kbd "C-x C-l") 'hippie-expand)

(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)

(define-key evil-normal-state-map (kbd "<f8>") 'magit-status)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find git project root."))))

(define-key evil-normal-state-map (kbd "<f9>") 'neotree-project-dir)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

;; search through open buffers
(define-key evil-normal-state-map (kbd "C-c b") 'helm-mini)

(define-key evil-normal-state-map (kbd "C-c i") 'ensime-import-type-at-point)
(define-key evil-normal-state-map (kbd "C-c u") 'ensime-show-uses-of-symbol-at-point)
(define-key evil-normal-state-map (kbd "C-c s") 'sbt-command)
(define-key evil-normal-state-map (kbd "C-c a") 'sbt-run-previous-command)
(define-key evil-normal-state-map (kbd "C-f") 'helm-ag-project-root)
(define-key evil-visual-state-map (kbd "C-f") 'helm-ag-project-root)

(define-key evil-normal-state-map (kbd "C-c f") 'projectile-dired)

(define-key evil-normal-state-map (kbd "C-c d") 'diff-hl-diff-goto-hunk)
(define-key evil-normal-state-map (kbd "M-n") 'diff-hl-next-hunk)
(define-key evil-normal-state-map (kbd "M-p") 'diff-hl-previous-hunk)

(define-key evil-normal-state-map (kbd "C-c =")
  (lambda () (interactive)
    (set-frame-font "xos4 Terminus 22" nil t)))

(define-key evil-normal-state-map (kbd "C-c -")
  (lambda () (interactive)
    (set-frame-font "xos4 Terminus 12" nil t)))

(define-key evil-normal-state-map (kbd "C-c o") 'org-capture)

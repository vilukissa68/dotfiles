
;; Configuration based on https://github.com/ideasman42/emacs-for-vimmers

;; -------------------------------------------------
;; APPLICATION OPTIONS
;; -- Disable GUI elements
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; -- Disable startup message
;;(defun display-startup-echo-area-message () (message ""))

;; -- Disable visual sounds
(setq visible-bell 1)

;; -- Window Title:
(setq-default frame-title-format "%b %& emacs")


;; -------------------------------------------------
;; DEFAULTS

;; -- UTF-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; -- Show text instead prompts instead of dialog popups
(setq use-dialog-box nil)

;; -- Y and N instead of yes and no for text prompts
(defalias 'yes-or-no-p 'y-or-n-p)

;; -- Empty lines
(setq-default indicate-empty-lines t)

;; -- Keep cursors and highlights in current window only 
(setq cursor-in-non-selected-windows 'hollow)
;; -- Highlight inactive windows
(setq highlight-nonselected-windows t)
;; -- Disable bidirectional text support
(setq bidi-display-reordering nil)

;; -- No startup screen 
;;(setq inhibit-startup-screen t)

;; -- Don't show buffer list on startup 
(setq inhibit-startup-buffer-menu t)

;; -- Hide mouse cursor while typing 
(setq make-pointer-invisible t)

;; -- Don't put two spaces after full-stop 
(setq sentence-end-double-space nil)


;; -------------------------------------------------
;; SCROLLING

;; -- Scroll N lines to screen edge
(setq scroll-margin 2)

;; -- Scroll back this many lines to being the cursor back on screen
(setq scroll-conservatively scroll-margin)

;; -- Keyboard scroll one line at a time 
(setq scroll-step 1)

;; -- Mouse scroll N lines
(setq mouse-wheel-scroll-amount '(6 ((shift) . 1)))

;; -- Don't accelerate scrolling 
(setq mouse-wheel-progressive-speed nil)

;; -- Don't use timer when scrolling 
(setq mouse-wheel-inhibit-click-time nil)

;; -- Preserve line/column (nicer page up/down)
(setq scroll-preserve-screen-position t)

;; -- Move the cursor to top/bottom even if the screen is viewing top/bottom (for page up/down) 
(setq scroll-error-top-bottom t)

;; -- Center after going to the next compiler error
(setq next-error-recenter (quote (4)))

;; -- Always redraw immediately when scrolling 
(setq fast-but-imprecise-scrolling nil)
(setq jit-lock-defer-time 0)


;; -------------------------------------------------
;; CLIPBOARD

;; -- Cutting & pasting use the system clipboard 
(setq select-enable-clipboard t)

;; -- Treat clipboard input as UTF-8 string first
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; -- Paste at text-cursor instead of mouse-cursor location
(setq mouse-yank-at-point t)


;; -------------------------------------------------
;; CASE SENSITIVITY

;; Case sensitive search.
(setq-default case-fold-search nil)
;; Case sensitive abbreviations.
(setq dabbrev-case-fold-search nil)
;; Case sensitive (impacts counsel case-sensitive file search).
(setq-default search-upper-case nil)


;; -------------------------------------------------
;; INDENTATION
(setq default-tab-width 4)
(setq tab-width 4)
(setq default-fill-column 80)
(setq fill-column 80)
(setq-default evil-indent-convert-tabs nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default evil-shift-round nil)



 ;; -------------------------------------------------
 ;; DISPLAY OPTIONS

 ;; -- Show line numbers 
 (global-display-line-numbers-mode 1)

 ;; -- Show the column as well as the line 
 (setq column-number-mode t)

 ;; -- Show matching parentheses 
 (show-paren-mode 1)

 ;; -- Don't blink
 (setq blink-matching-paren nil)
 (setq show-paren-delay 0.2)
 (setq show-paren-highlight-openparen t)
 (setq show-paren-when-point-inside-paren t)

 ;; Disable word-wrap. Why?
 ;; .. confusing for reading structured text, where white-space can be significant.
 (set-default 'truncate-lines t)


 ;; -------------------------------------------------
 ;; FILE FORMATS
 ;; Options for generic modes.
 (add-hook 'after-change-major-mode-hook
   (lambda ()
     (when (derived-mode-p 'text-mode)
       (flyspell-mode))
     (when (derived-mode-p 'prog-mode)
       (flyspell-prog-mode))))

 ;; -- Markup
 (add-hook 'org-mode-hook
   (lambda ()
     (setq-local fill-column 120)
     (setq-local tab-width 2)
     (setq-local evil-shift-width 2)
     (setq-local indent-tabs-mode nil)

     (setq-local ffip-patterns '("*.org"))))

 ;; -- Emacs lisp
 (add-hook 'emacs-lisp-mode-hook
   (lambda ()
     (setq-local fill-column 120)
     (setq-local tab-width 2)
     (setq-local evil-shift-width 2)
     (setq-local indent-tabs-mode nil)

     (setq-local ffip-patterns '("*.el"))

     ;; Don't delimit on dashes or underscores
     ;; this makes seaching for variable names inconvenient.
     (modify-syntax-entry ?- "w")
     (modify-syntax-entry ?_ "w")))

 ;; -- Python
 (add-hook 'python-mode-hook
   (lambda ()
     (setq-local fill-column 80)
     (setq-local tab-width 4)
     (setq-local evil-shift-width 4)
     (setq-local indent-tabs-mode nil)

     (setq-local ffip-patterns '("*.py"))))

 ;; -- Shell
 (add-hook 'sh-mode-hook
   (lambda ()
     (setq-local fill-column 120)
     (setq-local tab-width 4)
     (setq-local evil-shift-width 4)
     (setq-local indent-tabs-mode nil)

     (setq-local ffip-patterns '("*.sh"))))

 ;; -- C/C++
 (add-hook 'c-mode-hook
   (lambda ()
     (setq-local fill-column 120)
     (setq-local c-basic-offset 4)
     (setq-local tab-width 4)
     (setq-local evil-shift-width 4)
     (setq-local indent-tabs-mode nil)

     (setq-local ffip-patterns
       '("*.c" "*.cc" "*.cpp" "*.cxx" "*.h" "*.hh" "*.hpp" "*.hxx" "*.inl"))

     ;; Don't delimit on '_'
     ;; this makes searching for variable names inconvenient.
     (modify-syntax-entry ?_ "w")))


  ;; -------------------------------------------------
 ;; PACKAGES
 (require 'package)

 (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
 (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
 (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

 ;; -- Auto install use-package
 (unless (package-installed-p 'use-package)
   (package-refresh-contents)
   (package-install 'use-package))

 (eval-when-compile (require 'use-package))

 ;; -- Download automatically 
 (setq use-package-always-ensure t)

 ;; -- Defer loading packages by default 
 (setq use-package-always-defer t)


 ;; THEME
 (use-package dracula-theme
   :demand t
   :config (load-theme 'dracula t))

 ;; EVIL MODE (vim emulation layer)
 (use-package evil
   :demand t
   :config
   ;; -- Initialize
   (evil-mode)

 ;; -- Evil mode search
 (setq evil-search-module 'evil-search)
 (setq evil-ex-search-case 'sensitive))

 ;; -- Evil mode numbers
 (use-package evil-numbers)

 ;; -- Evil mode surround
 (use-package evil-surround
   :demand t
   :config
   ;; Initialize.
   (global-evil-surround-mode 1))

;; -- Evil Mode Keys

;; -- Use secondary selection in insert mode 
(define-key evil-insert-state-map (kbd "<down-mouse-1>") 'mouse-drag-secondary)
(define-key evil-insert-state-map (kbd "<drag-mouse-1>") 'mouse-drag-secondary)
(define-key evil-insert-state-map (kbd "<mouse-1>") 'mouse-start-secondary)

;; -- De-select after copy this allows quick select-copy-paste.
(define-key evil-insert-state-map (kbd "<mouse-2>")
 (lambda (click)
   (interactive "*p")
   (when (overlay-start mouse-secondary-overlay)
     (mouse-yank-secondary click)
     (delete-overlay mouse-secondary-overlay))))

;; NEO TREE
(use-package neotree)


;; WHICH-KEY (available keys)
(use-package which-key
 :demand t
 :config
 ;; Initialize.
 (which-key-mode))

;; MAGIT
(use-package magit
  :init
  (message "Loading Magit!")
  :config
  (message "Loaded Magit!")
  :bind (("C-x g" . magit-status)
         ("C-x C-g" . magit-status)))

;; MAGIT - EVIL INTEGRATION
(use-package evil-magit)

;; IVY
(use-package ivy
 :demand t
 :config
 (ivy-mode)

 ;; -- Always show half the window height
 (setq ivy-height-alist `((t . ,(lambda (_caller) (/ (frame-height) 2)))))
 (setq ivy-display-style 'fancy)

 ;; -- Vim style keys in ivy (holding Ctrl).
 (define-key ivy-minibuffer-map (kbd "C-j") 'next-line)
 (define-key ivy-minibuffer-map (kbd "C-k") 'previous-line)

 (define-key ivy-minibuffer-map (kbd "C-h") 'minibuffer-keyboard-quit)
 (define-key ivy-minibuffer-map (kbd "C-l") 'ivy-done)

 ;; -- open and next
 (define-key ivy-minibuffer-map (kbd "C-M-j") 'ivy-next-line-and-call)
 (define-key ivy-minibuffer-map (kbd "C-M-k") 'ivy-previous-line-and-call)

 (define-key ivy-minibuffer-map (kbd "<C-return>") 'ivy-done)

 ;; -- so we can switch away
 (define-key ivy-minibuffer-map (kbd "C-w") 'evil-window-map))

 ;; DIFF-HL (show git changes)
 ;;(use-package diff-hl
 ;;  :demand t
 ;;  :config (global-diff-hl-mode))

(use-package default-text-scale
  :demand t
  :init (setq default-text-scale-mode-map (make-sparse-keymap))
  :config (default-text-scale-mode))


;; -------------------------------------------------
;; KEY MAPPING

;; Control +/- or mouse-wheel to zoom
(global-set-key (kbd "C-=") 'default-text-scale-increase)
(global-set-key (kbd "C--") 'default-text-scale-decrease)
(global-set-key (kbd "C-0") 'default-text-scale-reset)

(global-set-key (kbd "<C-mouse-4>") 'default-text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'default-text-scale-decrease)

;; -- Vim increment/decrement keys.
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

;; -- Auto complete using words from the buffer.
;;(define-key evil-insert-state-map (kbd "C-n") 'company-dabbrev)
;; -- Comprehensive auto-complete.
(define-key evil-insert-state-map (kbd "C-SPC") 'company-complete-common)


;; -- Evil Leader Keys
;; Set SPACE as evil leader key
(with-eval-after-load 'evil
(evil-set-leader '(normal) (kbd "<SPC>"))

;; Interactive file name search.
(evil-define-key 'normal 'global (kbd "<leader>f") 'find-file-in-project)
;; Interactive file content search (git).
(evil-define-key 'normal 'global (kbd "<leader>g") 'counsel-git-grep))

;; Split movement
(define-key evil-motion-state-map (kbd "<leader>h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "<leader>j") 'evil-window-down)
(define-key evil-motion-state-map (kbd "<leader>k") 'evil-window-up)
(define-key evil-motion-state-map (kbd "<leader>l") 'evil-window-right)

(define-key evil-normal-state-map (kbd "<leader>h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "<leader>j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "<leader>k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "<leader>l") 'evil-window-right)

;; Buffer Movement
(define-key evil-normal-state-map (kbd "<leader>bn") 'next-buffer)
(define-key evil-normal-state-map (kbd "<leader>bb") 'previous-buffer)

;; Neo tree
(define-key evil-normal-state-map  (kbd "<leader>nt") 'neotree-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)


;; MAGIT
(evil-set-initial-state 'magit-mode 'normal)
(evil-set-initial-state 'magit-status-mode 'normal)
(evil-set-initial-state 'magit-diff-mode 'normal)
(evil-set-initial-state 'magit-log-mode 'normal)
(evil-define-key 'normal magit-mode-map
    "j" 'magit-goto-next-section
    "k" 'magit-goto-previous-section)
(evil-define-key 'normal magit-log-mode-map
    "j" 'magit-goto-next-section
    "k" 'magit-goto-previous-section)
(evil-define-key 'normal magit-diff-mode-map
    "j" 'magit-goto-next-section
    "k" 'magit-goto-previous-section)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(diff-hl ivy which-key evil-surround evil-numbers use-package inkpot-theme helm evil-visual-mark-mode evil-space)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

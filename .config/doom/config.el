(load (expand-file-name "env.el" "~/Dropbox/emacs") t)
(setq doom-theme 'doom-one-light)
(setq catppuccin-flavor 'latte) ;; or 'latte, 'frappe 'macchiato, or 'mocha

(setq display-line-numbers-type 'relative)

;; Start with org
(setq initial-major-mode 'org-mode)

;; OSX Fix for EPG
(setq epg-pinentry-mode 'loopback)
;;(epa-file-enable)
(setq epg-gpg-program "/opt/homebrew/Cellar/gnupg/2.4.0/bin/gpg")
;; Path
(setenv "PATH" (concat (getenv "PATH") ":~/.local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":~/anaconda3/bin"))
(setq exec-path (append exec-path '("~/.local/bin")))
(setq exec-path (append exec-path '("~/anaconda3/bin")))

;; Sensible defaults
(setq-default
 ad-redefinition-action 'accept                   ; Silence warnings for redefinition
 cursor-in-non-selected-windows t                 ; Hide the cursor in inactive windows
 confirm-kill-emacs nil
 fill-column 80                                   ; Set width for automatic line breaks
 help-window-select t                             ; Focus new help windows when opened
 indent-tabs-mode t                               ; Prefer spaces over tabs
 initial-scratch-message ""                       ; Empty the initial *scratch* buffer
 load-prefer-newer t                              ; Prefer the newest version of a file
 mark-ring-max 128                                ; Maximum length of mark ring
 read-process-output-max (* 1024 1024)            ; Increase the amount of data reads from the process
 scroll-conservatively most-positive-fixnum       ; Always scroll by one line
 select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
 tab-width 4                                      ; Set width for tabs
 c-basic-offset 4                                 ; Set width for tabs
 evil-shift-width 4
 use-package-always-ensure t                      ; Avoid the :ensure keyword for each package
 vc-follow-symlinks t                             ; Always follow the symlinks
 mouse-wheel-tilt-scroll t			  ; Enable mouse wheel scrolling
 view-read-only t)                                ; Always open read-only buffers in view-mode
(column-number-mode 1)                            ; Show the column number
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts with y/n
(global-hl-line-mode)                             ; Hightlight current line
(set-default-coding-systems 'utf-8)               ; Default to utf-8 encoding
(show-paren-mode 1)                               ; Show the parent
(global-display-line-numbers-mode)
(which-function-mode)

;; Important functions used later in this config
(defun merge-list-to-list (dst src)
  "Merges content of the 2nd list with the 1st one"
  (set dst
       (append (eval dst) src)))  

;; Supress warnings
(setq warning-minimum-log-level :error)

;; Unbind defaults
(map! :leader
      (("o r" nil)
       ("o i" nil)
       ("o d" nil)
       ))

;; Enable focus-follows-mouse
(setq mouse-autoselect-window t)  ;; Focus follows mouse
(setq focus-follows-mouse t)       ;; (For older Emacs versions)

;; Optionally make focus change faster
(setq mouse-autoselect-window 0.1) ;; Delay before switching (in seconds)

;; Scroll wheel zoom
(setq text-scale-mode-step 1.02) ;; Reduce scale step to 5%
(define-key global-map (kbd "<C-triple-wheel-up>") 'text-scale-increase)
(define-key global-map (kbd "<C-triple-wheel-down>") 'text-scale-decrease)

;; Set font
(setq doom-font (font-spec :family "Iosevka Term SS08" :size 12.0))
;;(setq doom-font (font-spec :family "Monaspace Argon Frozen" :size 12.0))

;; CSV
(setq csv-separator ",") ;; Set default separator for CSV files

;; General keybindings
(map! :leader
      :desc "Open like spacemacs" "SPC" 'execute-extended-command)

(map! :leader
      (:prefix ("f". "files")
       :desc "Toggle treemacs" "t" #'treemacs
       :desc "Open org directory" "o" 'my-org-finder)
      (:prefix ("i". "insert")
	       (:prefix ("t". "time")
		:desc "Timestamp decimal" "d" 'insert-current-time-decimal
		:desc "Timestamp with git email" "g" 'insert-timestamp-with-git-email
		:desc "Timestamp with email" "e" 'insert-timestamp-with-email))
      (:prefix ("o" . "open")
       :desc "Open dired" "d" #'(lambda () (interactive) (dired default-directory))
       :desc "Open dired" "D" #'(lambda () (interactive) (dired (projectile-project-root)))
       :desc "Org schedule" "s" 'org-schedule
       :desc "Org deadline" "S" 'org-deadline
       :desc "Open cfw calendar" "c" 'cfw:open-org-calendar
       :desc "Open Vterm right" "v" 'my/vterm-new-buffer-split-right
       :desc "Open Vterm below" "s" 'my/vterm-new-buffer-split-down
       (:prefix ("a" . "org agenda")
	:desc "Open org agenda" "a" 'org-agenda
	:desc "Open org todo list" "t" 'org-todo-list
	:desc "Org agenda (work related)" "w" '(lambda () (interactive) (org-tags-view t "work"))
	:desc "Filter by tag" "T" 'org-agenda-filter-by-tag
	:desc "Tags search" "m" 'org-tags-view
	:desc "View search results" "v" 'org-search-view
	:desc "Filter" "f" 'org-agenda-filter
	))
      (:prefix ("e" . "eval")
       :desc "Eval buffer" "b" 'eval-buffer
       :desc "Eval region" "r" 'eval-region
       :desc "Eval last sexp" "l" 'eval-last-sexp
       :desc "Eval expression" "e" 'eval-expression
       )
      (:prefix ("j" . "jump")
       :desc "Jump to declaration" "d" 'lsp-find-declaration
       :desc "Find definition" "f" 'lsp-find-definition
       :desc "Jump back" "b" 'evil-jump-backward
       :desc "Jump with i menu" "i" 'imenu
       :desc "Jump to references" "r" 'lsp-find-references
       :desc "Jump to beginning of defun" "s" 'beginning-of-defun
       :desc "Jump to end of defun" "e" 'end-of-defun
       :desc "Jump back to previous pos" "h" 'evil-jump-backward
       :desc "Jump back to swap pos" "s" 'evil-jump-backward-swap
       :desc "Jump back to forward pos" "l" 'evil-jump-forward
       :desc "Open occur buffer" "o" 'occur)
      (:prefix ("v" . "visual select")
       :desc "Select buffer" "a" 'mark-whole-buffer
       :desc "Select word" "w" 'mark-word)
      (:prefix ("s")
       :desc "Search and replace" "r" 'evil-replace-word-selection)
      (:prefix ("b")
       :desc "Format buffer" "f" '+format/buffer)
      (:prefix ("c" . "code")
       :desc "Comment region" "c" 'comment-or-uncomment-region
       :desc "Uncomment region" "u" 'uncomment-region
       :desc "Comment line" "l" 'comment-line
       :desc "Compile" "C" 'compile)
      ;; Workspaces
      (:prefix ("TAB" . "tab")
       :desc "Tab next" "n" 'tab-next
       :desc "Tab new" "N" 'tab-new
       :desc "Tab previous" "p" 'tab-previous
       :desc "New worksapce" "o" '+workspace:new
       ))

;; OS specific
;; Mac
(when (eq system-type 'darwin)
  (setq default-input-method "MacOSX")
  (setq mac-option-key-is-meta t)
  (setq mac-right-option-modifier nil)
  (mac-auto-operator-composition-mode 1)		  ; Use ligatures
  )

;; Linux
(when (eq system-type 'gnu/linux)
  (setq default-input-method "rfc1345")
  (setq x-select-enable-clipboard t)
  (setq x-select-enable-primary t)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
  (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
  (prettify-symbols-mode 1) ;; Use ligatures
  )


;; Faster which key
(after! which-key
  (setq which-key-idle-delay 0.1))

;; Lsp
(after! lsp-mode
  (setq lsp-auto-guess-root nil ;; Dont guess root
        lsp-ui-doc-show-with-cursor t
        lsp-ui-doc-show-with-mouse t))

;; Helm
(after! helm
  (setq helm-move-to-line-cycle-in-source nil))

;; Dired

(after! dired
  (evil-define-key 'normal dired-mode-map
    ;; Navigation
    "h" 'dired-up-directory
    "l" 'dired-find-file
    "q" 'quit-window
    ;; File operations
    "d" 'dired-flag-file-deletion
    "x" 'dired-do-flagged-delete
    "y" 'dired-copy-filename-as-kill
    "p" 'dired-do-paste
    "r" 'dired-do-rename
    "m" 'dired-mark
    "M" 'dired-toggle-marks	
    "u" 'dired-unmark
    "gg" 'evil-goto-first-line
    "G" 'evil-goto-line
    "n" 'dired-create-directory
    ))

;; Python
(after! python-mode
  (setq python-shell-interpreter "python3")
  (conda-env-activate-path "~/anaconda3/envs/emacs-org")
  )

;; C/C++
(setq lsp-clients-clangd-args '("-j=4"
				"--background-index"
				"--clang-tidy"
				"--completion-style=detailed"
				"--header-insertion=never"
				"--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

(defun my/c++-hook ()
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq evil-shift-width 4)
  (setq c-syntactic-indentation nil)
  (setq indent-tabs-mode t)
  )

(add-hook 'c++-mode-hook 'my/c++-hook)
(add-hook 'c-mode-hook 'my/c++-hook)

;; Hook to opencl files with c mode
(add-to-list 'auto-mode-alist '("\\.clh\\'" . opencl-c-mode))

;; Debugger
;; (map! :map dap-mode-map
;;       :leader
;;       :prefix ("d" . "dap")
;;       ;; basics
;;       :desc "dap next"          "n" #'dap-next
;;       :desc "dap step in"       "i" #'dap-step-in
;;       :desc "dap step out"      "o" #'dap-step-out
;;       :desc "dap continue"      "c" #'dap-continue
;;       :desc "dap hydra"         "h" #'dap-hydra
;;       :desc "dap debug restart" "r" #'dap-debug-restart
;;       :desc "dap debug"         "s" #'dap-debug

;;       ;; debug
;;       :prefix ("dd" . "Debug")
;;       :desc "dap debug recent"  "r" #'dap-debug-recent
;;       :desc "dap debug last"    "l" #'dap-debug-last

;;       ;; eval
;;       :prefix ("de" . "Eval")
;;       :desc "eval"                "e" #'dap-eval
;;       :desc "eval region"         "r" #'dap-eval-region
;;       :desc "eval thing at point" "s" #'dap-eval-thing-at-point
;;       :desc "add expression"      "a" #'dap-ui-expressions-add
;;       :desc "remove expression"   "d" #'dap-ui-expressions-remove

;;       :prefix ("db" . "Breakpoint")
;;       :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
;;       :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
;;       :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
;;       :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

;; Doom themes fix to prevent extra screen buffering with treemacs
;; https://github.com/emacs-lsp/dap-mode/issues/374
(after! doom-themes-ext-treemacs
  (with-eval-after-load 'treemacs
    (remove-hook 'treemacs-mode-hook #'doom-themes-hide-fringes-maybe)
    (advice-remove #'treemacs-select-window #'doom-themes-hide-fringes-maybe)))

;; Rust
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer)
  (setq rust-format-on-save t))

;; Help function for merging lists
(defun merge-list-to-list (dst src)
  "Merges content of the 2nd list with the 1st one"
  (set dst
       (append (eval dst) src)))

;; Org config
(after! org
  (setq org-agenda-span 14
	org-agenda-use-time-grid t
	org-agenda-time-grid
	'((daily today require-timed)
          (800 1000 1200 1400 1600 1800 2000)
          "......"
          "----------------"))
  (setq org-global-properties
	'(("Effort_ALL" . "0:10 0:30 1:00 2:00 4:00 8:00 16:00 24:00")))
  (defvar my/org-effort-values '("0:10" "0:30" "1:00" "2:00" "4:00" "8:00" "16:00" "24:00")
    "List of effort estimates to cycle through.")

  (defun my/org-cycle-effort (direction)
    "Cycle the Effort property for the current Org heading.
DIRECTION should be 1 for forward (up), -1 for backward (down)."
    (interactive)
    (let* ((current (org-entry-get nil "Effort"))
           (efforts my/org-effort-values)
           (index (or (cl-position current efforts :test #'string=) -1))
           (len (length efforts))
           (new-index (mod (+ index direction) len))
           (new-effort (nth new-index efforts)))
      (org-entry-put nil "Effort" new-effort)
      (message "Effort: %s" new-effort)))

  (defun my/org-cycle-effort-up ()
    "Cycle Effort up (increase) using predefined values."
    (interactive)
    (my/org-cycle-effort 1)
    (my/org-inject-effort-into-headline))

  (defun my/org-cycle-effort-down ()
    "Cycle Effort down (decrease) using predefined values."
    (interactive)
    (my/org-cycle-effort -1)
    (my/org-inject-effort-into-headline))

  (defun my/org-inject-effort-into-headline ()
    "Add or update effort in Org heading based on :Effort: property."
    (interactive)
    (when (org-entry-get nil "Effort")
      (let* ((effort (org-entry-get nil "Effort"))
             (heading (org-get-heading t t t t))
             (new-heading (if (string-match-p "\\[.*\\]$" heading)
                              (replace-regexp-in-string "\\[.*\\]$" (format "[%s]" effort) heading)
                            (format "%s [%s]" heading effort))))
	(org-edit-headline new-heading))))
  (add-hook 'before-save-hook #'my/org-inject-effort-into-headline)

  ;; Automatically sort org entries by TODO state on save
  (defun my/org-sort-by-todo-on-save ()
    (when (eq major-mode 'org-mode)
      (org-sort-entries nil ?o)))
  (add-hook 'before-save-hook #'my/org-sort-by-todo-on-save)

  (map! :after org
	:map org-mode-map
	"C-S-<up>"   #'my/org-cycle-effort-up
	"C-S-<down>" #'my/org-cycle-effort-down)
  (map! :leader
	(:prefix ("r" . "Org Roam")
	 :desc "Toggle roam buffer" "t" #'org-roam-buffer-toggle
	 :desc "Node find" "f" #'org-roam-node-find
	 :desc "Node insert" "i" #'org-roam-node-insert
	 :desc "Goto today" "d" #'org-roam-dailies-goto-date
	 :desc "List dailies" "l" #'org-roam-dailies-find-date)
	(:prefix ("i" . "insert")
	 :desc "Insert block" "b" #'org-insert-structure-template))

  ;; Org capture templates
  (merge-list-to-list 'org-capture-templates
                      '(("w" "Work Todo" entry (file+headline "~/Dropbox/orgfiles/work.org" "Todos")
                         "* TODO %?\n  %i\n  %a")
                        ("v" "Work note" entry (file+headline "~/Dropbox/orgfiles/work.org" "Notes")
                         "* %?\n  %i\n  %a")))

  ;; Org todo keyword setup
  (setq org-todo-keywords
        '((sequence "TODO(t)" "DOING(g)" "WAITING(w)" "PR(r)" "|" "DONE(d)" "UNCLEAR(u)" "DROPPED(o)" "POSTPONED(p)")
          (sequence "MEETING(m)" "|" "DONE(d)")
          (sequence "EVENT(e)" "|" "DONE(d)")
          (sequence "LECTURE(m)" "|" "PREPARE(p)" "|" "ATTENDED(d)" "NOTATTENDED(n)")))

  (setq org-todo-keyword-faces
        '(("TODO" . "red") ("DOING" . "gold") ("WAITING" . "yellow") ("PR" . "dark violet")
          ("MEETING" . "brown") ("DONE" . "forest green") ("UNCLEAR" . "black")
          ("DROPPED" . "gray") ("POSTPONED" . "dark gray") ("LECTURE" . "royal blue")
          ("EVENT" . "dark olive green")))

  ;; Invoke org-roam
  (org-roam-setup))

(after! org-modern
  (setq
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-agenda-tags-column 0
   org-ellipsis "…"
   )
  (setq org-modern-todo-faces
        '(("TODO" . (:foreground "red" :background "gainsboro" :weight bold :height 1.2))
          ("DOING" . (:foreground "gold" :background "gainsboro" :weight bold :height 1.2))
          ("WAITING" . (:foreground "yellow" :background "gainsboro" :weight bold :height 1.2))
          ("PR" . (:foreground "dark violet" :background "gainsboro" :weight bold :height 1.2))
          ("MEETING" . (:foreground "brown" :background "gainsboro" :weight bold :height 1.2))
          ("DONE" . (:foreground "forest green" :background "gainsboro" :weight bold :height 1.2))
          ("UNCLEAR" . (:foreground "black" :background "gainsboro" :weight bold :height 1.2))
          ("DROPPED" . (:foreground "gray" :background "gainsboro" :weight bold :height 1.2))
          ("POSTPONED" . (:foreground "dark gray" :background "gainsboro" :weight bold :height 1.2))
          ("LECTURE" . (:foreground "royal blue" :background "gainsboro" :weight bold :height 1.2))
          ("EVENT" . (:foreground "dark olive green" :background "gainsboro" :weight bold :height 1.2)))))

;; Basic org settings
(setq org-directory "~/Dropbox/orgfiles/")
(setq org-agenda-files '("~/Dropbox/orgfiles" "~/Dropbox/orgfiles/roamnotes"))
(setq org-default-notes-file "~/Dropbox/orgfiles/notes.org")
;; Filter tags from agenda
(setq org-agenda-tag-filter-preset '("-masters_thesis_work"))
(load-file "~/Dropbox/orgfiles/orgsetup.el")
;; Org roam
(setq org-roam-directory "~/Dropbox/orgfiles/roamnotes")
;; Open org folder
(defun my-org-finder ()
  (interactive)
  (ido-find-file-in-dir org-directory))
;; Enable online image in org files
(setq org-display-remote-inline-images 'cache)

;; Magit
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq transient-default-level 7)

;; Magit-forge
(setq magit-revision-show-gravatars '("^Author:     " . "^Commit:     "))

;; EWW (Emacs Web Wowser)
;;(setq browse-url-browser-function 'eww-browse-url)
(map! :leader
      :desc "Search web for text between BEG/END"
      "s w" #'eww-search-words
      (:prefix ("E" . "ERC/EWW")
       :desc "Eww web browser" "w" #'eww-new
       :desc "Eww add bookmark" "a" #'eww-add-bookmark
       :desc "Eww list bookmarks" "l" #'eww-list-bookmarks
       :desc "Eww list history" "h" #'eww-list-histories
       :desc "Eww switch to buffer" "s" #'eww-switch-to-buffer
       :desc "Eww view readable text only" "r" #'eww-readable
       :desc "Eww view source code" "S" #'eww-view-source
       :desc "Eww reload page" "R" #'eww-reload))

(defun eww-new ()
  (interactive)
  (let ((url (read-from-minibuffer "Enter URL or keywords: ")))
    (switch-to-buffer (generate-new-buffer "eww"))
    (eww-mode)
    (eww url)))

;; Ein
(after! ein
  (setq ein:worksheet-enable-undo t)
  (setq! ein:output-area-inlined-images t)
  (map! :map ein:notebook-mode-map
	:leader
	(:prefix ("m". "ein-major-mode")
		 ;; Normal mode keybindings
		 "d" #'ein:worksheet-delete-cell
		 "O" #'ein:worksheet-insert-cell-above
		 "o" #'ein:worksheet-insert-cell-below
		 "K" #'ein:worksheet-move-cell-up
		 "J" #'ein:worksheet-move-cell-down
		 "H" #'ein:worksheet-goto-prev-input
		 "L" #'ein:worksheet-goto-next-input
		 "y" #'ein:worksheet-copy-cell
		 "p" #'ein:worksheet-yank-cell
		 "P" #'ein:worksheet-yank-cell-above
		 )

        :n "C-c C-c" #'ein:worksheet-execute-cell
	:n "C-c C-s" #'ein:worksheet-execute-cell-and-goto-next
        :n "C-c C-l" #'ein:worksheet-clear-output
        :n "C-c C-k" #'ein:worksheet-kill-cell
        :n "C-RET" #'ein:worksheet-execute-cell
        :n "S-RET" #'ein:worksheet-execute-cell-and-goto-next
        :n "C-c C-l" #'ein:worksheet-clear-output))

;; RSS
(setq elfeed-feeds '("https://planet.emacslife.com/atom.xml"))

;; Spell check and grammar
(after! flyspell
  (map! :leader
	(:prefix ("k" . "krammar/spelling")
	 :desc "Flyspell next error" "n" #'flyspell-goto-next-error
	 :desc "Flyspell correct error at point" "k" #'flyspell-correct-at-point
	 :desc "Flyspell corrent next error" "c" #'flyspell-correct-next
	 :desc "Flyspell corrent previoues error" "C" #'flyspell-correct-previous
	 :desc "Flyspell add word" "a" #'+spell/add-word
	 :desc "Flyspell remove word" "x" #'+spell/remove-word
	 :desc "Langtool check grammar" "l" #'langtool-check
	 :desc "Langtool finish grammar" "L" #'langtool-check-done
	 :desc "Langtool next grammar error" "m" #'langtool-goto-next-error
	 :desc "Langtool prev grammar error" "M" #'langtool-goto-prev-error
	 :desc "Langtool correct at point" "i" #'langtool-correct-at-point
	 :desc "Langtool interactive" "I" #'langtool-interactive-correction)))

;; Markdown
(add-hook 'markdown-mode #'+word-wrap-mode)

;; AI assistants
;;
;; Copilot
;; Custom tab completion fix
(defun my/copilot-tab-or-default ()
  (interactive)
  (if (and (bound-and-true-p copilot-mode)
           (copilot--overlay-visible))
      (copilot-accept-completion)
    (evil-insert 1)))

(use-package! copilot
  :after prog-mode
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
	      ;; Unbind keys globally or in specific maps
	      ("C-l" . nil)
	      ("C-n" . nil)
	      ("C-p" . nil)
	      ("C-k" . nil)
	      ("C-j" . nil)
	      ("<tab>" . 'my/copilot-tab-or-default)
	      ("TAB" . 'my/copilot-tab-or-default)
	      ("C-TAB" . 'copilot-accept-completion-by-word)
	      ("C-<tab>" . 'copilot-accept-completion-by-word)
	      ("C-p" . 'copilot-previous-completion)
	      ("C-n" . 'copilot-next-completion)
	      ("C-l" . 'copilot-accept-completion-by-line)
	      ("C-k" . 'copilot-previous-completion)
	      ("C-j" . 'copilot-next-completion)
	      )
  )

(use-package! copilot-chat)

;; Gptel
(use-package! gptel
  :config
  (setq! gptel-api-key "your key"))

;; Configure models for gptel
(gptel-make-ollama "Ollama"
  :host "localhost:11434"
  :stream t
  :models '(mistral:latest))
(gptel-make-gh-copilot"Github Copilot")

;; Set Ollama as default
;; (setq
;;  gptel-model 'mistral:latest
;;  gptel-backend (gptel-make-ollama "Ollama"
;;                  :host "localhost:11434"
;;                  :stream t
;;                  :models '(mistral:latest)))

;; Set Github Copilot as default
(setq gptel-backend (gptel-make-gh-copilot "Github Copilot"))
(setq gptel-model 'github-copilot)

(map! :leader
      (:prefix ("l" . "LLMS/AI")
       :desc "gptel" "g" #'gptel
       :desc "gptel add context" "a" #'gptel-add
       :desc "gptel add file" "A" #'gptel-add-file
       :desc "gptel send" "s" #'gptel-send
       :desc "gptel refactor" "r" #'gptel-rewrite
       :desc "gptel menu" "m" #'gptel-menu
       :desc "aider menu" "l" #'aidermacs-transient-menu
       :desc "copilot-chat" "c" #'copilot-chat-transient
       ))

;; Aidermacs
(use-package! aidermacs
  :config
  (setenv "OLLAMA_API_BASE" "http://127.0.0.1:11434")
  (setenv "OLLAMA_CONTEXT_LENGTH" "65536")
  (setq aidermacs-show-diff-after-change t)
  (setq aidermacs-backend 'vterm)
  ;;(setq aidermacs-extra-args '("--model" "ollama_chat/deepseek-coder-v2:16b" "--no-auto-commits" "--no-auto-accept-architect" "--show-diffs"))
  (let ((target-entry
	 (cl-find-if (lambda (entry)
                       (and (listp entry) ; Basic sanity check for entry structure
			    (car entry) ; Ensure car is not nil
			    (string= (car entry) "https://api.openai.com/v1")))
                     aidermacs--api-providers)))
    (when target-entry ;; Change the URL key (the first element of the inner list)
      (setf (car target-entry) "https://api.githubcopilot.com")

      ;; The rest of the list (cdr target-entry) contains property pairs.
      ;; This is an alist of properties.
      (let* ((properties-alist (cdr target-entry))
             (hostname-pair (assoc 'hostname properties-alist)))
	(when hostname-pair
          ;; Change the hostname value
          (setf (cdr hostname-pair) "api.githubcopilot.com")))))
  (setq aidermacs-extra-args
	'("--model" "openai/gpt-4o"
          "--architect" "openai/claude-3.7-sonnet-thought"
          "--weak-model" "openai/gpt-4o"
          "--no-show-model-warnings"
          "--show-diffs"
          "--chat-language" "en"
          "--no-auto-commits"
          "--no-auto-accept-architect"))

  ;;:custom
  ;; Use Github copilot provider for OpenAI
  ;; Use Github copilot API key
  ;; (aidermacs-editor-model "openai/gpt-4o")
  ;; (aidermacs-architect-model "openai/claude-3.7-sonnet-thought")
  ;; (aidermacs-weak-model "openai/gpt-4o")
  ;; (aidermacs-extra-args '("--no-show-model-warnings" "--show-diffs" "--chat-language en"))
  )

(defun my/enable-wrap-for-aidermacs ()
  "Enable visual wrapping in Aidermacs buffers."
  (when (string-prefix-p "*aidermacs:" (buffer-name))
    (message "Debug: Aider adjusted")
    (visual-line-mode 1)
    (setq truncate-lines nil)))

(add-hook 'window-configuration-change-hook #'my/enable-wrap-for-aidermacs)

;; Replace all occurences of a word
;; query-replace current word
(defun evil-replace-word-selection(replace-str)
  (interactive "sReplace occurences under cursor with: ")
  (if (use-region-p)
      (let (
	    (selection (buffer-substring-no-properties (region-beginning) (region-end))))
        (if (= (length selection) 0)
	    (message "empty string")
	  (evil-ex (concat "'<,'>s/" selection "/"))
	  ))
    (evil-ex (concat "%s/" (thing-at-point 'word) "/" replace-str "/g"))))

;; Write current time in HH.MM format in decimal
(defun insert-current-time-decimal ()
  "Insert the current time in decimal format at point."
  (interactive)
  (let* ((current-time (decode-time (current-time)))
         (hour (nth 2 current-time))
         (minute (nth 1 current-time))
         (decimal-time (+ hour (/ minute 60.0))))
    (insert (format "%.2f" decimal-time))))

(defun current-time-decimal ()
  "Get the current time in decimal format at point."
  (let* ((current-time (decode-time (current-time)))
         (hour (nth 2 current-time))
         (minute (nth 1 current-time))
         (decimal-time (+ hour (/ minute 60.0))))
    (format "%.2f" decimal-time)))

;; Occur mode
(add-hook 'occur-hook
	  '(lambda ()
	     (switch-to-buffer-other-window "*Occur*")))

;; Hex to decimal
(defun hex-to-decimal (start end)
  "Convert the hexadecimal string in the region from START to END to a decimal number."
  (interactive "r")
  (let* ((hex-string (buffer-substring-no-properties start end))
         (decimal-value (string-to-number hex-string 16)))
    (delete-region start end)
    (insert (number-to-string decimal-value))))

(defun hex-word-to-decimal ()
  "Convert the hexadecimal word at point to a decimal number."
  (interactive)
  (let* ((bounds (bounds-of-thing-at-point 'word))
         (start (car bounds))
         (end (cdr bounds))
         (hex-string (buffer-substring-no-properties start end))
         (decimal-value (string-to-number hex-string 16)))
    (delete-region start end)
    (insert (number-to-string decimal-value))))

(defun convert-hex-words-to-decimal ()
  "Convert all hexadecimal words in the buffer to decimal numbers."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\\b[0-9a-fA-F]+\\b" nil t)
      (hex-word-to-decimal))))

(defun hex-to-signed-decimal (hex-string)
  "Convert a hexadecimal string HEX-STRING to a signed decimal integer."
  (let* ((decimal-value (string-to-number hex-string 16))
         (bit-length (* (length hex-string) 4))  ; Each hex digit represents 4 bits
         (max-value (expt 2 (1- bit-length))))
    (if (>= decimal-value max-value)
        (- decimal-value (expt 2 bit-length))
      decimal-value)))

(defun hex-word-to-signed-decimal ()
  "Convert the hexadecimal word at point to a signed decimal integer."
  (interactive)
  (let* ((bounds (bounds-of-thing-at-point 'word))
         (start (car bounds))
         (end (cdr bounds))
         (hex-string (buffer-substring-no-properties start end))
         (decimal-value (hex-to-signed-decimal hex-string)))
    (delete-region start end)
    (insert (number-to-string decimal-value))))

(defun convert-hex-words-to-signed-decimal ()
  "Convert all hexadecimal words in the buffer to signed decimal integers."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\\b[0-9a-fA-F]+\\b" nil t)
      (hex-word-to-signed-decimal))))

;; Document note
(defun insert-timestamp-with-email (email)
  "Insert a timestamp in the format (year-month-day email) at point."
  (interactive "sEnter email: ")
  (let ((timestamp (format "(%s %s)"
			   (format-time-string "%Y%m%d")
			   email)))
    (insert timestamp)))

(defun insert-timestamp-with-git-email ()
  "Insert a timestamp in the format (year-month-day email) at point.
The email is fetched from the current Git configuration."
  (interactive)
  (let* ((git-email-command "git config user.email")
         (email (string-trim (shell-command-to-string git-email-command)))
         (timestamp (format "(%s %s)"
			    (format-time-string "%Y%m%d")
			    email)))
    (insert timestamp)))

(defun catppuccin-latte ()
  (interactive)
  (setq catppuccin-flavor 'latte)
  (catppuccin-reload))

(defun catppuccin-frappe ()
  (interactive)
  (setq catppuccin-flavor 'frappe)
  (catppuccin-reload))

(defun catppuccin-macchiato ()
  (interactive)
  (setq catppuccin-flavor 'macchiato)
  (catppuccin-reload))

(defun catppuccin-mocha ()
  (interactive)
  (setq catppuccin-flavor 'mocha)
  (catppuccin-reload))

(defun lookup-word (word)
  (interactive (list (thing-at-point 'word)))
  (browse-url (format "http://en.wiktionary.org/wiki/%s" word)))

(defun finnish-week-day (day)
  (cond
   ((string= "monday" (downcase day)) "Maanantai")
   ((string= "tuesday" (downcase day)) "Tiistai")
   ((string= "wednesday" (downcase day)) "Keskiviikkoa")
   ((string= "thursday" (downcase day)) "Torstai")
   ((string= "friday" (downcase day)) "Perjantai")
   ((string= "saturday" (downcase day)) "Lauantai")
   ((string= "sunday" (downcase day)) "Sunnuntai")
   ))

(defun insert-random-generated-numbers (count &optional min max)
  "Insert COUNT random numbers separated by commas at the current cursor position.
If MIN and MAX are provided, generate random numbers within the range [MIN, MAX].
By default, the range is [0, 999]."
  (interactive "nEnter the number of random values to insert: \nnEnter minimum value (default 0): \nnEnter maximum value (default 255): ")
  (let* ((min (or min 0))
         (max (or max 255))
         (random-numbers
	  (mapconcat (lambda (_) (number-to-string (+ min (random (- max min)))))
		     (make-list count nil)
		     ", ")))
    (insert random-numbers)))


(defun my/vterm-new-buffer-split-right ()
  "Split the current window to the right and open a new vterm buffer."
  (interactive)
  ;; split the window
  (let ((new-window (split-window-right)))
    ;; generate a unique buffer
    (let* ((name (generate-new-buffer-name "*vterm*"))
           (buffer (get-buffer-create name)))
      ;; start vterm if not already running
      (with-current-buffer buffer
        (unless (derived-mode-p 'vterm-mode)
          (vterm-mode)))
      ;; display in the new window
      (set-window-buffer new-window buffer)
      ;; focus the new window
      (select-window new-window))))

(defun my/vterm-new-buffer-split-down ()
  "Split the current window to the right and open a new vterm buffer."
  (interactive)
  ;; split the window
  (let ((new-window (split-window-below)))
    ;; generate a unique buffer
    (let* ((name (generate-new-buffer-name "*vterm*"))
           (buffer (get-buffer-create name)))
      ;; start vterm if not already running
      (with-current-buffer buffer
        (unless (derived-mode-p 'vterm-mode)
          (vterm-mode)))
      ;; display in the new window
      (set-window-buffer new-window buffer)
      ;; focus the new window
      (select-window new-window))))


;; ;; Fix jumping tab key completion
;; (after! (evil copilot)
;;   ;; Define the custom function that either accepts the completion or does the default behavior
;;   (defun my/copilot-tab-or-default ()
;;     (interactive)
;;     (if (and (bound-and-true-p copilot-mode)
;;              ;; Add any other conditions to check for active copilot suggestions if necessary
;;              )
;;         (copilot-accept-completion)
;;       (evil-insert 1))) ; Default action to insert a tab. Adjust as needed.

;;   ;; Bind the custom function to <tab> in Evil's insert state
;;   (evil-define-key 'insert 'global (kbd "<tab>") 'my/copilot-tab-or-default))

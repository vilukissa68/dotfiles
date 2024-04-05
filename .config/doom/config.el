(setq doom-theme 'doom-one)

(setq display-line-numbers-type t)
(setq display-line-numbers-mode t)

(setq org-directory "~/Dropbox/orgfiles/")
(setq org-default-notes-file "~/Dropbox/orgfiles/notes.org")
(load-file "~/Dropbox/orgfiles/orgsetup.el")

;; Open org folder
(defun my-org-finder ()
  (interactive)
  (ido-find-file-in-dir org-directory))

;; OSX Fix for EPG
(setq epg-pinentry-mode 'loopback)
(epa-file-enable)
(setq epg-gpg-program "/opt/homebrew/Cellar/gnupg/2.4.0/bin/gpg")

;; Sensible defaults
(setq
 ad-redefinition-action 'accept                   ; Silence warnings for redefinition
 cursor-in-non-selected-windows t                 ; Hide the cursor in inactive windows
 confirm-kill-emacs nil
 fill-column 80                                   ; Set width for automatic line breaks
 help-window-select t                             ; Focus new help windows when opened
 indent-tabs-mode nil                             ; Prefer spaces over tabs
 initial-scratch-message ""                       ; Empty the initial *scratch* buffer
 load-prefer-newer t                              ; Prefer the newest version of a file
 mark-ring-max 128                                ; Maximum length of mark ring
 read-process-output-max (* 1024 1024)            ; Increase the amount of data reads from the process
 scroll-conservatively most-positive-fixnum       ; Always scroll by one line
 select-enable-clipboard t                        ; Merge system's and Emacs' clipboard
 tab-width 4                                      ; Set width for tabs
 use-package-always-ensure t                      ; Avoid the :ensure keyword for each package
 vc-follow-symlinks t                             ; Always follow the symlinks
 view-read-only t)                                ; Always open read-only buffers in view-mode
(column-number-mode 1)                            ; Show the column number
(fset 'yes-or-no-p 'y-or-n-p)                     ; Replace yes/no prompts with y/n
(global-hl-line-mode)                             ; Hightlight current line
(set-default-coding-systems 'utf-8)               ; Default to utf-8 encoding
(show-paren-mode 1)                               ; Show the parent
(global-display-line-numbers-mode)
(which-function-mode)

;; Set font
(setq doom-font (font-spec :family "Iosevka" :size 12.0))


;; General keybindings
(map! :leader
      :desc "Open like spacemacs" "SPC" 'execute-extended-command)

(map! :leader
      (:prefix ("f". "files")
        :desc "Toggle treemacs" "t" #'treemacs
        :desc "Open org directory" "o" 'my-org-finder))

(map! :leader
      (:prefix ("i". "insert")
        (:prefix ("t". "time")
        :desc "Timestamp decimal" "td" 'insert-current-time-decimal)))

(map! :leader
        (:prefix ("j" . "jump")
           :desc "Jump to declaration" "d" 'lsp-find-declaration
           :desc "Jump with i menu" "i" 'imenu
           :desc "Jump to references" "r" 'lsp-find-references
           :desc "Jump to beginning of defun" "b" 'beginning-of-defun
           :desc "Jump to end of defun" "e" 'end-of-defun
           :desc "Jump back to previous pos" "h" 'evil-jump-backward
           :desc "Jump back to swap pos" "s" 'evil-jump-backward-swap
           :desc "Jump back to forward pos" "l" 'evil-jump-forward
           :desc "Open occur buffer" "o" 'occur
           ))

;; MacOS specific
(setq default-input-method "MacOSX")
(setq mac-option-key-is-meta t)
(setq mac-right-option-modifier nil)


;; Faster which key
(after! which-key
  (setq which-key-idle-delay 0.1))

;; Copilot
 ;; (use-package! copilot
 ;;  :hook (prog-mode . copilot-mode)
 ;;  :bind (:map copilot-completion-map
 ;;              ("<tab>" . 'copilot-accept-completion)
 ;;              ("TAB" . 'copilot-accept-completion)
 ;;              ("C-TAB" . 'copilot-accept-completion-by-word)
 ;;              ("C-<tab>" . 'copilot-accept-completion-by-word)
 ;;              ("C-k" . 'copilot-previous-completion)
 ;;              ("C-j" . 'copilot-next-completion)
 ;;             ))

;; Lsp
(after! lsp-mode
  (setq lsp-auto-guess-root nil)) ;; Dont guess root

;; Python
(after! python-mode
  (setq python-shell-interpreter "python3"))

;; C/C++
(setq lsp-clients-clangd-args '("-j=4"
				"--background-index"
				"--clang-tidy"
				"--completion-style=detailed"
				"--header-insertion=never"
				"--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))

;; Debugger
 (map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

;; Doom themes fix to prevent extra screen buffering with treemacs
;; https://github.com/emacs-lsp/dap-mode/issues/374
(after! doom-themes-ext-treemacs
  (with-eval-after-load 'treemacs
    (remove-hook 'treemacs-mode-hook #'doom-themes-hide-fringes-maybe)
    (advice-remove #'treemacs-select-window #'doom-themes-hide-fringes-maybe)))

;; Rust
(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

(after! dap-mode
    ;; Python support via debugpu: pip install debugpy --user
    (setq dap-python-debugger 'debugpy)
    (setq dap-python-executable "python3")

    (setq dap-auto-configure-features '(breakpoints locals expressions tooltip)
          ;dap-auto-show-output nil ;; Hide the annoying server output
          lsp-enable-dap-auto-configure t)

    ;; Automatically trigger dap-hydra when a program hits a breakpoint.
    (add-hook 'dap-stopped-hook (lambda (arg) (call-interactively #'dap-hydra)))

    ;; Automatically delete session and close dap-hydra when the debug session terminates.
    (add-hook 'dap-terminated-hook
              (lambda (arg)
                (call-interactively #'dap-delete-session)
                (dap-hydra/nil)))

    (add-hook! +dap-running-session-mode
      (set-window-buffer nil (current-buffer))))

;; C/C++ debugging
(after! realgud
  (require 'hydra)

  (defun +realgud:cmd-start (arg)
    "start = break main + run"
    (interactive "p")
    (realgud-command "start"))

  (defun +realgud:cmd-reverse-step (arg)
    "reverse-step step"
    (interactive "p")
    (realgud-command "reverse-step"))

  (defun +realgud:cmd-reverse-continue (arg)
    "Reverse continue"
    (interactive "p")
    (realgud-command "reverse-continue"))

  (defun +realgud:cmd-reverse-finish (arg)
    "Reverse finish"
    (interactive "p")
    (realgud-command "reverse-finish"))

  (defhydra realgud-hydra (:color pink :hint nil :foreign-keys run)
    "
Stepping | _n_: next | _i_: step | _o_: finish | _c_: continue | _R_: restart | _u_: until-here
Reverse | _rn_: next | _ri_: step | _ro_: finish | _rc_: continue |
Breakpts | _ba_: break | _bD_: delete | _bt_: tbreak | _bd_: disable | _be_: enable | _tr_: backtrace
Eval | _ee_: at-point | _er_: region | _eE_: eval | 37 | _!_: shell | _Qk_: kill | _Qq_: quit | _Sg_: gdb | _Ss_: start
"
        ("n" realgud:cmd-next)
        ("i" realgud:cmd-step)
        ("o" realgud:cmd-finish)
        ("c" realgud:cmd-continue)
        ("R" realgud:cmd-restart)
        ("u" realgud:cmd-until-here)
        ("rn" +realgud:cmd-reverse-next)
        ("ri" +realgud:cmd-reverse-step)
        ("ro" +realgud:cmd-reverse-finish)
        ("rc" +realgud:cmd-reverse-continue)
        ("ba" realgud:cmd-break)
        ("bt" realgud:cmd-tbreak)
        ("bD" realgud:cmd-delete)
        ("be" realgud:cmd-enable)
        ("bd" realgud:cmd-disable)
        ("ee" realgud:cmd-eval-at-point)
        ("er" realgud:cmd-eval-region)
        ("tr" realgud:cmd-backtrace)
        ("eE" realgud:cmd-eval)
        ("!" realgud:cmd-shell)
        ("Qk" realgud:cmd-kill)
        ("Sg" realgud:cmd-gdb)
        ("Ss" +realgud:cmd-start)
        ("q" nil "cancel" :color blue)
        ("Qq" realgud:cmd-quit "quit" :color blue))

    (defun +debugger/realgud:gdb-hydra ()
      "Run `'realgud-hydra'."
      (interactive)
      (realgud-hydra/body))

    (map! :leader :prefix ("l" . "custom")
          (:when (modulep! :tools debugger)
            :prefix ("d" . "debugger")
            :desc "RealGUD hydra" "h" #'+debugger/realgud:gdb-hydra)))


;; Misc

;; Write current time in HH.MM format in decimal
(defun insert-current-time-decimal ()
  "Insert the current time in decimal format at point."
  (interactive)
  (let* ((current-time (decode-time (current-time)))
         (hour (nth 2 current-time))
         (minute (nth 1 current-time))
         (decimal-time (+ hour (/ minute 60.0))))
    (insert (format "%.2f" decimal-time))))

;; Occur mode
(add-hook 'occur-hook
          '(lambda ()
             (switch-to-buffer-other-window "*Occur*")))

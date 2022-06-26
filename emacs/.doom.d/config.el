(require 'exwm)
; Keybindings
(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset)
        ([?\s-w] . exwm-workspace-switch)
        ([?\s-h] . evil-window-left)
        ([?\s-j] . evil-window-down)
        ([?\s-k] . evil-window-up)
        ([?\s-l] . evil-window-right)
        ([?\s-u] . evil-split-window-below)
        ([?\s-o] . evil-vsplit-window-right)
        ([?\s- ] . exwm-floating-toggle-floating)
        ([?\s-f] . exwm-layout-set-fullscreen)
        ([?\s-b] . exwm-layout-toggle-mode-line)
        ([?\s-w] . exwm-workspace-switch)
        ([?\s-e] . exwm-input-release-keyboard)
        ([?\s-m] . exwm-workspace-move-window)
        ([?\s-C] . kill-buffer)
        ([?\s-p] . (lambda (command)
                         (interactive (list (read-shell-command "$ ")))
                         (start-process-shell-command command nil command)))
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))
(unless (get 'exwm-workspace-number 'saved-value)
    (setq exwm-workspace-number 10))
(add-hook 'exwm-update-class-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))
(exwm-enable)

; xrandr module
(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(1 "HDMI-A-0" 2 "HDMI-A-0" 3 "HDMI-A-0"
                                            4 "HDMI-A-0" 5 "HDMI-A-0" 6 "DisplayPort-0"
                                            7 "DisplayPort-0" 8 "DisplayPort-0" 9 "DisplayPort-0"
                                            0 "DisplayPort-0"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output HDMI-A-0 --left-of DisplayPort-0")))
(exwm-randr-enable)

; system tray
(require 'exwm-systemtray)
(exwm-systemtray-enable)

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "William Boulanger"
      user-mail-address "john@doe.com")

(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Fira Code" :size 30 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "sans" :size 25))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'ewal-doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.local/share/org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package org-fancy-priorities
  :ensure t
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(setq display-line-numbers-type 'relative)

;; indent-guides config
(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-responsive 'stack)
(setq highlight-indent-guides-delay 0)

;; avy config
(setq avy-all-windows :true)

(unless (display-graphic-p)
  ;; currently running in a terminal
  (setq doom-theme 'doom-nord)
  (setq highlight-indent-guides-responsive :nil)
)

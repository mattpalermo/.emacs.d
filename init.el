(toggle-frame-maximized)
(prefer-coding-system 'utf-8) ;; Quit bugging me about which coding system to use on Windows
;; Setup package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; Ensure use-package is ready to use
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)
;; Allow hiding minor modes in the mode line
(use-package diminish)

;;; Better defaults
;; Goal: Emacs for mere mortals
(setq ring-bell-function 'ignore) ; Disable bell. It goes off too much.
(display-battery-mode t) ; Show battery in mode line. Handy for fullscreen or when ever system indicators are hidden. Doesn't take much space.
(display-time-mode t) ; Show time in mode line. Same reasoning as battery mode.
(column-number-mode t) ; Show column number in mode line. Useful often enough. 
(setq-default cursor-type 'bar) ; Make cursor look modern.
(window-divider-mode) ; Make it simple to resize windows with mouse
(setq delete-by-moving-to-trash t) ; Modern, safe, file deletion behaviour.
(setq fast-but-imprecise-scrolling t) ; No lag while scrolling lots
(setq mouse-wheel-scroll-amount '(1)) ; Touchpad scroll sanity: Whoooh! Way too much scroll.
(setq mouse-wheel-progressive-speed nil) ; Again, Touchpad scroll sanity.
(cua-mode t) ; Enable familiar, modern key-bindings. (It doesn't interfere that much!)
(setq cua-auto-tabify-rectangles nil) ; Recommended by https://www.emacswiki.org/emacs/CuaMode
(setq cua-keep-region-after-copy t) ; Modern standard behaviour for copy action.
(global-hl-line-mode) ; Make it easier to read tables and long lines. Make sure to style it unobtrusively.
(show-paren-mode t) ; Make nested parethesis easier to figure out.
(eval-after-load "flyspell" ; Sometimes I don't have mouse-2 available. E.g. touch-pad.
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)
     (define-key flyspell-mouse-map [down-mouse-2] nil)
     (define-key flyspell-mouse-map [mouse-2] nil)))
;(require 'org)
(require 'org-mouse) ; Add better mouse support for org mode.
(setq custom-file (concat user-emacs-directory "custom.el"))
;(load custom-file 'noerror) ; Bugger it, customise keeps messing the custom file up.
;(add-to-list 'initial-frame-alist '(fullscreen . "maximized"))

;; Auto-enable spell checking - some people may not like this.
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(diminish 'flyspell) ; If it's enabled all the time, we can diminish it.

;(use-package projectile)
(use-package dashboard ; More useful splash-screen
  :config
  (setq inhibit-startup-screen t)
  (dashboard-setup-startup-hook))

;; Auto-Completions (UI discover-ability)
(use-package company :diminish :config (global-company-mode))  ; In-buffer auto-complete
(use-package ivy :diminish :config (ivy-mode)) ; Minibuffer auto-complete
(use-package swiper :config (global-set-key "\C-s" 'swiper)) ; Ivy powered buffer search (I-search alternative).
(use-package counsel :diminish :config (counsel-mode)) ; Lots of Ivy powered auto-completes. E.g. for "find file".

;; Face / Text theming
(load-theme 'leuven t) ; Beautiful theme with shitty headings
(load-theme 'mytheme t) ; Way better theme :D

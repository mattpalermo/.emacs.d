;;; Emacs for a Modern Mortal (Me).

;;; Things to do straight away
(toggle-frame-maximized)
(prefer-coding-system 'utf-8) ;; Quit bugging me about which coding system to use on Windows

;;; Setup package system
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; Ensure use-package is ready to use (can't use use-package for itself).
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ; Just download the packages for me.

;;; General user interface
(setq inhibit-startup-screen t) ; When we've had enough help.
(setq ring-bell-function 'ignore) ; Disable bell. It goes off too much.
(display-battery-mode t) ; Show battery in mode line. Handy for fullscreen or when ever system indicators are hidden. Doesn't take much space.
(display-time-mode t) ; Show time in mode line. Same reasoning as battery mode.
(column-number-mode t) ; Show column number in mode line. Useful often enough. 
(setq-default cursor-type 'bar) ; Make cursor look modern.
(window-divider-mode) ; Make it simple to resize windows with mouse
;(setq-default display-line-numbers t) ; Show line numbers by default... If you want.
(use-package rich-minority
  :config
  (rich-minority-mode 1)
  (setf rm-blacklist ""))
(setq split-width-threshold 140) ; Be more preferable towards splitting horizontally.

;;; General behaviour
(setq delete-by-moving-to-trash t) ; Modern, safe, file deletion behaviour.
(setq custom-safe-themes t) ; If I've loaded it, I already trust it.
(setq custom-file (concat user-emacs-directory "custom.el")) ; Automatically do stuff to another file, not this one.
;(load custom-file 'noerror) ; I don't want to load the custom file. Uncomment to load it.

;;; Auto-Completions (UI discover-ability)
(use-package company :config (global-company-mode))  ; In-buffer auto-complete
(use-package ivy :config (ivy-mode)) ; Minibuffer auto-complete
;; Swiper is a bit slow!
(use-package swiper :config (global-set-key "\C-s" 'swiper)) ; Ivy powered buffer search (I-search alternative).
(use-package counsel :config (counsel-mode)) ; Lots of Ivy powered auto-completes. E.g. for "find file".

;;; Scrolling.
(pixel-scroll-mode) ; Scroll by pixels
(setq pixel-dead-time 0) ; Never go back to the old scrolling behaviour.
(setq pixel-wait 0) ; A higher value is meant to be slower but idk about that.
(setq pixel-resolution-fine-flag t) ; Scroll by pixels instead of lines (t = frame-char-height).
(setq mouse-wheel-scroll-amount '(2)) ; Touchpad scroll sanity: Whoooh! Way too much scroll.
(setq mouse-wheel-progressive-speed nil) ; Again, Touchpad scroll sanity.
(setq fast-but-imprecise-scrolling t) ; No lag while scrolling lots

;;; Backup and auto-save files
;; Save backup (~) files and auto save (#) files in a temp directory.
(let ((temp-emacs-dir (concat temporary-file-directory "Emacs/"))) ; Save to $TEMP/Emacs.
  (make-directory temp-emacs-dir t) ; Make sure $TEMP/Emacs exists.
  (setq auto-save-file-name-transforms `((".*" ,temp-emacs-dir t))) ; Auto save (#) files.
  (setq backup-directory-alist `((".*" . ,temp-emacs-dir)))) ; Backup (~) files.
(setq backup-by-copying t) ; Safer and reasonable for fast modern drives.
(setq version-control t) ; Let's keep a few backups of our files.
(setq delete-old-versions t) ; But let's not keep all backups.
(setq kept-new-versions 6) ; Just some new ones,
(setq kept-old-versions 2) ; and maybe some old ones..

;;; General editing experience and keybindings
(delete-selection-mode 1)
;(cua-mode t) ; Enable familiar, modern key-bindings. (It mostly doesn't interfere).
;(setq cua-auto-tabify-rectangles nil) ; Recommended by https://www.emacswiki.org/emacs/CuaMode
;(setq cua-keep-region-after-copy t) ; Modern standard behaviour for copy action.

;;; Spell checking
(eval-after-load "flyspell" ; Sometimes I don't have mouse-2 available. E.g. touch-pad.
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)
     (define-key flyspell-mouse-map [down-mouse-2] nil)
     (define-key flyspell-mouse-map [mouse-2] nil)))
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;; Writing experience
(use-package olivetti
  :config
  (setq-default olivetti-body-width 90)
  (setq-default olivetti--visual-line-mode t)
  (add-hook 'text-mode-hook 'olivetti-mode)
  (add-hook 'prog-mode-hook 'olivetti-mode))

;;; Programming experience
(show-paren-mode t) ; Make nested parethesis easier to figure out.

;;; Org mode
(require 'org-mouse) ; Add better mouse support for org mode.
(setq org-support-shift-select t) ; Enable shift select for org mode.
(setq org-adapt-indentation nil) ; Don't indent body text when demoting entries.
(setq org-catch-invisible-edits 'smart) ; Don't allow invisible edits. This should be default!
(setq org-hide-emphasis-markers t) ; Hide the markup for better reading.
(setq org-startup-with-inline-images t) ; Display images by default.
(setq org-image-actual-width '(400)) ; Make big images legible by default.
(setq org-startup-with-latex-preview t) ; Display equations by default.
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.3))
(use-package org-download ; Allow drag and drop support.
  :config
  (setq org-download-method 'attach) ; Use the awesome attachment system.
  (setq org-download-annotate-function (lambda (_) ""))) ; I don't find the annotation useful.
(font-lock-add-keywords ; Make org list bullets pretty
 'org-mode
 '(("^ +\\([-*]\\) "
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;; Face / text theming
(setq-default line-spacing 0.1) ; Some line spacing?
;; Turn on variable pitch by default for most major modes
(add-hook 'text-mode-hook 'variable-pitch-mode)
(add-hook 'prog-mode-hook 'variable-pitch-mode)
(load-theme 'font-source t) ; Source pro fonts
(custom-set-faces `(fringe ((t . (:background ,(face-background 'default t 'default)))))) ; Fringe background fix
;; TODO: Set some faces to inherit fixed-pitch-face to preserve tables and other column formatted stuff.

;;; doom-monarized-theme.el --- a monochrome solarized theme -*- no-byte-compile: t; -*-
;; Author: Jean-Hadrien Chabran <jh@chabran.fr>
;; Keywords: theme, doom-emacs, doom-emacs-theme
;; Package-Requires: ((doom-themes "2.1.6"))
;; URL: https://github.com/jhchabran/doom-monarized-theme
;; Version: 0.1
;; This file is NOT part of GNU Emacs.
;;
;;;
;;; Commentary:

;; A monochrome theme based on Solarized for Doom Emacs

;;; Setup

;; stuff

;;; Code:
(require 'doom-themes)

;;
(defgroup doom-monarized-theme nil
  "Options for doom-themes"
  :group 'doom-themes)

(defcustom doom-monarized-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-monarized-theme
  :type 'boolean)

(defcustom doom-monarized-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-monarized-theme
  :type 'boolean)

(defcustom doom-monarized-brighter-text nil
  "If non-nil, default text will be brighter."
  :group 'doom-monarized-theme
  :type 'boolean)

(defcustom doom-monarized-comment-bg doom-monarized-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-monarized-theme
  :type 'boolean)

(defcustom doom-monarized-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-monarized-theme
  :type '(choice integer boolean))

;;
(def-doom-theme doom-monarized
  "A dark monochrome theme based on solarized"

  ;; name        default   256       16
  ((bg         '("#002b36" "#002b36"       nil))
   (bg-alt     '("#00212B" "#00212B"       nil))
   (base0      '("#073642" "#073642"   "black"))
   (base1      '("#03282F" "#03282F" "brightblack"))
   (base2      '("#00212C" "#00212C" "brightblack"))
   (base3      '("#13383C" "#13383C" "brightblack"))
   (base4      '("#56697A" "#56697A" "brightblack"))
   (base5      '("#405A61" "#405A61" "brightblack"))
   (base6      '("#96A7A9" "#96A7A9" "brightblack"))
   (base7      '("#788484" "#788484" "brightblack"))
   (base8      '("#626C6C" "#626C6C" "white"))
   (fg-alt     '("#657b83" "#657b83" "white"))
   ;; (fg         '("#b58900" "#839496" "brightwhite"))
   ;; (fg         '("#f5bc0c" "#839496" "brightwhite"))
   ;; (fg         '("#e0ba41" "#839496" "brightwhite"))
   (fg         '("#839496" "#839496" "brightwhite"))

   (grey       base4)
   (red        '("#dc322f" "#ff6655" "red"))
   (orange     '("#cb4b16" "#dd8844" "brightred"))
   (green      '("#859900" "#99bb66" "green"))
   (teal       '("#35a69c" "#33aa99" "brightgreen"))
   (yellow     '("#b58900" "#ECBE7B" "yellow"))
   (blue       '("#268bd2" "#51afef" "brightblue"))
   (dark-blue  '("#3F88AD" "#2257A0" "blue"))
   (magenta    '("#d33682" "#c678dd" "magenta"))
   (violet     '("#6c71c4" "#a9a1e1" "brightmagenta"))
   (cyan       '("#2aa198" "#46D9FF" "brightcyan"))
   (dark-cyan  '("#204052" "#5699AF" "cyan"))

   ;; face categories -- required for all themes
   (highlight      (doom-darken orange 0.1))
   (vertical-bar   bg)
   (selection      dark-blue)
   (builtin        (doom-lighten fg 0.1))
   (comments       (if doom-monarized-brighter-comments blue base5))
   (doc-comments   teal)
   (constants      (doom-lighten fg 0.5))
   (functions      (doom-lighten fg 0.3))
   (keywords       (doom-lighten fg 0.4))
   (methods        cyan)
   (operators      orange)
   (type           (doom-lighten fg 0.5))
   (strings        (doom-lighten fg 0.4))
   (variables      fg)
   (numbers        (doom-lighten fg 0.2))
   (region         base0)
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    yellow)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-monarized-brighter-modeline)
   (-modeline-pad
    (when doom-monarized-padded-modeline
      (if (integerp doom-monarized-padded-modeline) doom-monarized-padded-modeline 4)))

   (modeline-fg     nil)
   (modeline-fg-alt base5)

   (modeline-bg
    (if -modeline-bright
        base3
      `(,(doom-darken (car bg) 0.15) ,@(cdr base0))))
   (modeline-bg-l
    (if -modeline-bright
        base3
      `(,(doom-darken (car bg) 0.1) ,@(cdr base0))))
   (modeline-bg-inactive   (doom-darken bg 0.1))
   (modeline-bg-inactive-l `(,(car bg) ,@(cdr base1))))


  ;; --- extra faces ------------------------
  ((company-tooltip-selection     :background dark-cyan)
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")

   (lazy-highlight :background (doom-darken dark-blue 0.4))

   ((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)

   (helm-selection :inherit 'bold
                   :background selection
                   :distant-foreground bg
                   :extend t)

   (font-lock-comment-face
    :foreground comments)
   ;; :background (if doom-monarized-comment-bg (doom-lighten bg 0.05)))
   (font-lock-doc-face
    :inherit 'font-lock-comment-face
    :foreground doc-comments)
   (font-lock-keyword-face
    :weight 'bold
    :foreground keywords)
   (font-lock-constant-face
    :weight 'bold
    :foreground constants)

   ;; Treemacs
   (treemacs-root-face (:foreground (doom-lighten fg 0.7)))
   (treemacs-directory-face (:foreground (doom-lighten fg 0.5)))


   ;; LSP
   (lsp-face-highlight-textual :foreground orange)

   ;; Centaur tabs
   (centaur-tabs-active-bar-face :background blue)
   (centaur-tabs-modified-marker-selected :inherit 'centaur-tabs-selected
                                          :foreground blue)
   (centaur-tabs-modified-marker-unselected :inherit 'centaur-tabs-unselected
                                            :foreground blue)
   ;; Doom modeline
   (doom-modeline-bar :background blue)

   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis
    :foreground (if -modeline-bright base8 highlight))

   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))

   (tooltip              :background bg-alt :foreground fg)
   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)

   ;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   (markdown-url-face    :foreground teal :weight 'normal)
   (markdown-reference-face :foreground base6)
   ((markdown-bold-face &override)   :foreground fg)
   ((markdown-italic-face &override) :foreground fg-alt)

   ;; outline (affects org-mode)
   ((outline-1 &override) :foreground (doom-lighten fg 0.5))
   ((outline-2 &override) :foreground (doom-lighten fg 0.3))
   ((outline-3 &override) :foreground (doom-lighten fg 0.2))
   ((outline-4 &override) :foreground (doom-lighten fg 0.2))
   ((outline-5 &override) :foreground (doom-lighten fg 0.2))
   ((outline-6 &override) :foreground (doom-lighten fg 0.2))
   ((outline-7 &override) :foreground (doom-lighten fg 0.2))
   ((outline-8 &override) :foreground (doom-lighten fg 0.2))

   ;; org-mode
   ((org-block &override) :background base0)
   ((org-code &override) :foreground yellow)
   ((org-block-begin-line &override) :foreground comments :background base0)
   (org-hide :foreground hidden)
   (solaire-org-hide-face :foreground hidden)))
  ;; --- extra variables ---------------------
  ;; ()

(provide 'doom-monarized-theme)
;;; doom-monarized-theme.el ends here

;; Round 2
;; More knowledge

;; package work

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; All day everyday

(setq inhibit-startup-screen t)
(setq initial-scratch-message
      (concat
       

       ";;    dMMMMb  dMMMMMP dMMMMb  dMMMMb  .aMMMb         dMMMMMP dMP     .aMMMb  .aMMMb  .aMMMb \n"
       ";;   dMP.dMP dMP     dMP.dMP dMP.dMP dMP dMP        dMP     dMP     dMP'dMP dMP'VMP dMP'dMP \n"
       ";;  dMMMMP' dMMMP   dMMMMK' dMMMMK' dMP dMP        dMMMP   dMP     dMMMMMP dMP     dMP dMP  \n"
       ";; dMP     dMP     dMP'AMF dMP'AMF dMP.aMP        dMP     dMP     dMP dMP dMP.aMP dMP.aMP   \n"
       ";;dMP     dMMMMMP dMP dMP dMP dMP  VMMMP'        dMP     dMMMMMP dMP dMP  VMMMP'  VMMMP'    \n"
       "\n"
       ";;/K776/K78/B676/G565/C454/N669/H6776/M345/H97/IB5/A981/O102/D2613/A815/S116/B98/A43/HN7/I43\n"
       ";;/J43/10D/K79/N8/K57/W26/THE/OWLS/ARE/NOT/WHAT/THEY/SEEM/DF45/JK75/T567/MN5/U78/G34/Z32/Z35\n"
       ";;/A654/H9301/WP95A/B789/W26/MN78/N78/H45/JK78/DF45/K676/H687/U00/10ZX/H67/B11/X90/CFDA9/Q58\n"))


(global-set-key (kbd "\C-xo") 'ace-window)

(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq org-log-into-drawer t)
(setq org-hide-leading-stars t)

(put 'erase-buffer 'disabled nil)
(menu-bar-mode 1)


;; Functions

(defun open-init-file () ; the function
  "open init"
  (interactive)
  (find-file user-init-file))
(global-set-key (kbd "C-c i") 'open-init-file) ; the binding

;(defun comnt-line (comment)
;  "add a comment line to lisp code so far"
;  (interactive)
;  (insert (concat ";;;;; " comment " ;;;;;")))

;; Org Mode, where to begin...

(require 'ob-clojure)
(setq org-babel-clojure-backend 'cider)
(require 'cider)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-switchb)
(global-set-key "\C-cl" 'org-store-link)

(setq org-todo-keywords
      (quote ((sequence "APURATE>>(a@/!)" "VAYATE>>(v)" "|" "<CERRAR>(c@/!)")
	      (sequence "ESCRIBE>>(s@/!)" "ESPERE>>(p@/!)" "|" "<LISTO>(l@/!)"))))

;(setq org-todo-keyword-faces
;      (quote (("APURATE" :foreground "brightwhite" :weight bold :background "color-40")
;	      ("VAYATE" :foreground "black" :weight bold :background "color-46")
;	      ("CERRAR" :foreground "brightwhite" :weight bold :background "color-124")
;	      ("ESCRIBER" :foreground "brightwhite" :weight bold :background "color-57")
;	      ("ESPERE" :foreground "black" :weight bold :background "color-220")
;	      ("LISTO" :foreground "brightwhite" :weight bold :background "color-93"))))

(setq org-use-fast-todo-selection t)
(setq org-treat-S-cursor-todo-selection-as-state-change nil)

;; Capture templates

(setq org-capture-templates
      '(("t" "Toda" entry (file+headline "~/2020/bart.org" "Things")
	 "* Notes: \n Simon Says %?\n %u\n")
	("h" "Clojure" entry (file+headline "~/2020/bart.org" "Clojure")
	 "* Math: \n %?\n %u\n")))
;	("T" "the TODO shit")
;	("Ta" "Today or the Next..." entry
;	 (file "~/2020/bart.org"
      


;; Custom stuff next iteration will have 'use-package until then...

(custom-set-variables
 '(org-agenda-files (quote ("~/2020/"
			    "~/Writing/VampZom/"
			    "~/Writing/Meditate/")))
 '(package-selected-packages (quote (cider chess fountain-mode darkroom ace-window))))

;; Start of that bartron2020 theme...


(custom-set-faces
 '(font-lock-string-face ((t (:foreground "brightcyan"))))
 '(font-lock-comment-face ((t (:foreground "color-26"))))
 '(link ((t (:foreground "color-202"))))
 '(menu ((t (:background "color-208" :foreground "black"))))
 '(mode-line ((t (:background "color-208" :foreground "black" :box
			      (:line-width -1 :style released-button)))))
 '(mode-line-inactive ((t (:inherit mode-line :background "color-234" :foreground "color-208" :box
				    (:line-width -1 :color "color-135") :weight light))))
 '(vertical-border ((t (:background "color-208" :foreground "black"))))
 '(secondary-selection ((t (:background "color-202" :foreground "black"))))
;; org mode
 '(org-todo ((t (:foreground "color-255" :bold t :background "color-21"))))
 '(org-done ((t (:foreground "color-255" :bold t :background "color-129"))))
 '(org-document-title ((t (:foreground "brightyellow" :bold t)))) ;;:underline t :style line))))
 '(org-special-keyword ((t (:foreground "color-33"))))
 '(org-date ((t (:foreground "color-208")))) ;:underline t))))
; '(org-agenda-clocking ((t (:foreground "black" :background "color-202"))))
 '(org-hide ((t (:foreground "black"))))
 '(org-level-1 ((t (:foreground "color-49" :weight bold))))
 '(org-level-2 ((t (:foreground "color-50"))))
 '(org-level-3 ((t (:foreground "color-51"))))
 '(org-level-4 ((t (:foreground "color-55" :weight bold))))
 '(org-level-5 ((t (:foreground "color-56"))))
 '(org-level-6 ((t (:foreground "color-57")))) 
 '(org-level-7 ((t (:foreground "color-118" :weight bold))))
 '(org-level-8 ((t (:foreground "color-119")))))

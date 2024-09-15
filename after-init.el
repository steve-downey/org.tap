;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(require 'org2blog-init)

(use-package graphviz-dot-mode
  :config
  (setq graphviz-dot-indent-width 4))

(org-babel-do-load-languages
  'org-babel-load-languages
  (append org-babel-load-languages
          '((dot . t))))


(setq plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

(setq org-plantuml-jar-path (expand-file-name "/usr/share/plantuml/plantuml.jar"))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages
 'org-babel-load-languages
 (append org-babel-load-languages
         '((plantuml . t))))

(org-babel-do-load-languages
 'org-babel-load-languages
 (append org-babel-load-languages
         '((ditaa . t))))

(setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")

(setq org-support-shift-select 'always)


;; Reveal.js + Org mode
(use-package org-re-reveal
  :config
  (setq org-re-reveal-root "file:////home/sdowney/bld/reveal.js")
  )

;;; ORG TO BLOG REDEFINES org-html-underline
;;; ONLY USE THE PACKAGE WHEN EXPORTING TO BLOG

;; (use-package org2blog
;;   :config
;;   ;; Don't use sourcecode tags in wordpress
;;   (setq org2blog/wp-use-sourcecode-shortcode nil)
;;   ;; Default parameters for sourcecode tag
;;   (setq org2blog/wp-sourcecode-default-params nil)
;;   (setq org2blog/wp-image-upload t)
;;   (setq org2blog/wp-blog-alist
;;         '(("sdowney"
;;            :url "http://www.sdowney.org/xmlrpc.php"
;;            :username "sdowney"
;;            :default-title "Hello World"
;;            :default-categories ("org2blog" "emacs")
;;            :tags-as-categories nil)
;;           ))
;;   )


(with-eval-after-load 'org-superstar
  (set-face-attribute 'org-superstar-item nil :height 1.2)
  (set-face-attribute 'org-superstar-header-bullet nil :height 1.2)
  (set-face-attribute 'org-superstar-leading nil :height 1.3))

;; Set different bullets
(setq org-superstar-headline-bullets-list
      '("◉" "◈" "○" "▷"))
;; Stop cycling bullets to emphasize hierarchy of headlines.
(setq org-superstar-cycle-headline-bullets nil)
;; Hide away leading stars on terminal.
(setq org-superstar-leading-fallback ?\s)


(eval-after-load "ox-latex"
  '(add-to-list 'org-latex-classes
                '("memoir" "\\documentclass{memoir}"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(setq org-latex-default-packages-alist
      '(("AUTO" "inputenc" t
        ("pdflatex"))
       ("T1" "fontenc" t
        ("pdflatex"))
       ("" "graphicx" t)
       ("" "longtable" nil)
       ("" "wrapfig" nil)
       ("" "rotating" nil)
       ("normalem" "ulem" t)
       ("" "amsmath" t)
       ("" "amssymb" t)
       ("" "capt-of" nil)
       ("" "titletoc" nil)
       ("" "hyperref" nil)))


(use-package org-transclusion
  :after org)

(use-package engrave-faces
  :ensure t
  :init
  (setq org-latex-src-block-backend 'engraved)
  (setq org-latex-engraved-theme t))

(use-package citeproc :ensure t)

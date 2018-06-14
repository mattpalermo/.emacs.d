(deftheme mytheme
  "Created 2018-06-09.")

(let* ((bgcolor "#fbf8ef")
       (fgcolor "black")
       (fixed-pitch-font "Inconsolata")
       (org-heading-common `(:inherit variable-pitch :family unspecified :weight unspecified :slant unspecified :foreground unspecified :background unspecified :underline nil :overline nil)))
  (custom-theme-set-faces
   'mytheme
   `(default ((t . (:family ,fixed-pitch-font :height 110 :foreground ,fgcolor :background ,bgcolor))))
;   '(fringe ((t . ())))
   `(fixed-pitch ((t . (:family ,fixed-pitch-font))))
   '(fixed-pitch-serif ((t . (:family "Courier"))))
   '(variable-pitch ((t . (:family "ETBembo" :height 1.1))))

   `(fringe ((t . (:background ,bgcolor))))
   
   `(org-document-title ((t . (,@org-heading-common :height 2.0))))
   `(org-level-1 ((t . (,@org-heading-common :height 1.8))))
   `(org-level-2 ((t . (,@org-heading-common :height 1.6))))
   `(org-level-3 ((t . (,@org-heading-common :height 1.4))))
   `(org-level-4 ((t . (,@org-heading-common :height 1.3))))
   `(org-level-5 ((t . (,@org-heading-common :height 1.2 :weight bold :slant italic))))
   `(org-level-6 ((t . (,@org-heading-common :height 1.1 :weight bold :slant italic))))
   `(org-level-7 ((t . (,@org-heading-common :height 1.1 :slant italic))))
   `(org-level-8 ((t . (,@org-heading-common :height 1.0 :slant italic))))

;  '(org-code ((t . (:inherit fixed-pitch))))
   '(org-table ((t . (:inherit fixed-pitch))))
   ))

(custom-theme-set-variables
 'mytheme
 '(line-spacing 0.1)
 '(org-hide-leading-stars t)
 )
 
(provide-theme 'mytheme)

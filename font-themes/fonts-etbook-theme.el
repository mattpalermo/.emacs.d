(deftheme fonts-etbook
  "Use the ETBook font paired with Inconsolata for fixed width text.
https://edwardtufte.github.io/et-book/
https://fonts.google.com/specimen/Inconsolata")

(custom-theme-set-faces
 'fonts-etbook
 '(default ((t . (:font "Inconsolata" :height 120))))
 '(fixed-pitch ((t . (:font "Inconsolata"))))
 '(variable-pitch ((t . (:font "ETBembo")))))

(provide-theme 'fonts-etbook)

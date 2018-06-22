(deftheme fonts-dejavu
  "Use the DejaVu family of fonts. https://dejavu-fonts.github.io/")

(custom-theme-set-faces
 'fonts-dejavu
 '(default ((t . (:font "DejaVu Sans Mono" :height 110))))
 '(fixed-pitch ((t . (:font "DejaVu Sans Mono"))))
 '(variable-pitch ((t . (:font "DejaVu Sans")))))

(provide-theme 'fonts-dejavu)

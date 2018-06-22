(deftheme fonts-roboto-serif
  "Use the Roboto Serif family of fonts")

(custom-theme-set-faces
 'fonts-roboto-serif
 '(default ((t . (:font "Roboto Mono" :height 110))))
 '(fixed-pitch ((t . (:font "Roboto Mono"))))
 '(variable-pitch ((t . (:font "Roboto Slab")))))

(provide-theme 'fonts-roboto-serif)

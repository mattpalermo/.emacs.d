(deftheme fonts-roboto
  "Use the Roboto sans family of fonts. https://fonts.google.com/?query=roboto")

(custom-theme-set-faces
 'fonts-roboto
 '(default ((t . (:font "Roboto Mono" :height 110))))
 '(fixed-pitch ((t . (:font "Roboto Mono"))))
 '(variable-pitch ((t . (:font "Roboto")))))

(provide-theme 'fonts-roboto)

(deftheme fonts-source-serif
  "Use the Adobe Source Serif Pro family of fonts. https://fonts.google.com/?query=Source")

(custom-theme-set-faces
 'fonts-source-serif
 '(default ((t . (:font "Source Code Pro" :height 110))))
 '(fixed-pitch ((t . (:font "Source Code Pro"))))
 '(variable-pitch ((t . (:font "Source Serif Pro")))))

(provide-theme 'fonts-source-serif)

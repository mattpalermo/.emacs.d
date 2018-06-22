(deftheme font-source
  "Use the Adobe Source Pro family of fonts. https://fonts.google.com/?query=Source")

(custom-theme-set-faces
 'font-source
 '(default ((t . (:font "Source Code Pro" :height 110))))
 '(fixed-pitch ((t . (:font "Source Code Pro"))))
 '(variable-pitch ((t . (:font "Source Sans Pro")))))

(provide-theme 'font-source)

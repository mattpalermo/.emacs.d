(deftheme fonts-input
  "Use the Input family fonts. http://input.fontbureau.com/")

(custom-theme-set-faces
 'fonts-input
 '(default ((t . (:font "InputMonoNarrow light" :height 100))))
 '(fixed-pitch ((t . (:font "InputMonoNarrow light"))))
 '(variable-pitch ((t . (:font "InputSansNarrow light")))))

(provide-theme 'fonts-input)

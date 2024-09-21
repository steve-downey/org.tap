(defun activate-org2blog ()
    "Activate org2blog: redefines org-html-underline"
  (interactive "")
  (progn
  (message "org-html-underline redefined")
  (use-package org2blog
    :config
    ;; Don't use sourcecode tags in wordpress
    (setq org2blog/wp-use-sourcecode-shortcode nil)
    ;; Default parameters for sourcecode tag
    (setq org2blog/wp-sourcecode-default-params nil)
    (setq org2blog/wp-use-wp-latex nil)
    (setq org2blog/wp-image-upload t)
    (setq org2blog/wp-blog-alist
          '(("sdowney"
             :url "http://www.sdowney.org/xmlrpc.php"
             :username "sdowney"
             :default-title "Hello World"
             :default-categories ("org2blog" "emacs")
           :tags-as-categories nil)
            ))
    )))

(provide 'org2blog-init)

;;; org2blog-init.el ends here

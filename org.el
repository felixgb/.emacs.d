;; org mode configuration and capture templates

(setq
 org-log-done 'time
 org-startup-indented t
 org-return-follows-link t
 org-default-notes-file "~/me/felix.org"
 org-agenda-files (list "~/me/felix.org")

 org-capture-templates
 '(("t" "Personal Todo" entry (file+headline "~/me/felix.org" "PERSONAL THINGS")
    "* TODO %?")

   ("w" "Food shopping!!!" item (file+olp+datetree "~/me/shopping.org" "Shopping" :tree-type week)
    "- %?")))

;; org mode configuration and capture templates

(setq
 org-log-done 'time
 org-startup-indented t
 org-return-follows-link t
 org-icalendar-combined-agenda-file "~/.sync/org.ics"
 org-default-notes-file "~/me/felix.org"
 org-agenda-files (list "~/me/felix.org")

 org-capture-templates
 '(("t" "Personal Todo" entry (file+headline "~/me/felix.org" "PERSONAL THINGS")
    "* TODO %?")

   ("w" "Work todo" entry (file+headline "~/me/felix.org" "WORK THINGS")
    "* TODO %?")

   ("p" "Projects" entry (file+headline "~/me/work.org" "PROJECTS")
    "* TODO %? %^g\n%a")

   ("s" "Shopping" item (file+headline "~/me/shopping.org" "SHOPPING")
    "- %?")

   ("c" "Complain" entry (file+datetree "~/me/journal.org")
    "* %? %^g\n")

   ("d" "Dinner" entry (file+datetree "~/me/dinners.org")
    "* %? %^g\n")

   ("r" "Review" entry (file+datetree "~/me/reviews.org")
    "* %? %^g\n")))

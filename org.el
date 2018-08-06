;; org mode configuration and capture templates

(global-set-key (kbd "<f12>") (lambda ()
                                (interactive)
                                (find-file "~/me/felix.org")))

(setq
 org-log-done 'time
 org-startup-indented t
 org-return-follows-link t
 org-default-notes-file "~/me/felix.org"
 org-agenda-files (list "~/me/felix.org")
 org-html-checkbox-type 'html
 org-capture-templates
 '(("s" "food shopping" item (file+headline "~/me/felix.org" "Weekly Supermarket Shop")
    "- %?")
   ("t" "Agenda Todo" entry (file+headline "~/me/felix.org" "Agenda")
    "\n\n** TODO things 2 do today\nSCHEDULED: <%<%Y-%m-%d %a>>\n%?"
    :empty-lines 1)
   ("b" "things 2 do whenever" item (file+headline "~/me/felix.org" "Buying stuff")
    "- [ ]%?")))

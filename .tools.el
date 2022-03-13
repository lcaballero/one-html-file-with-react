
(setq tools-el (format "%s.tools.el" default-directory))

(defun tools-reload ()
  (interactive)
  (load tools-el)
  (message "reloaded '%s'" tools-el))

(global-set-key (kbd "C-c r") 'tools-reload)

(setq compilation-post-dir (format "%ssrc" default-directory))

(defun compilation-post-dir (&rest _args)
  "Setting 'default-directory' after 'compilation-start'.
Can be an advice for 'compilation-start'."
  (when (and (stringp compilation-post-dir)
         (buffer-live-p compilation-last-buffer))
    (let ((post-dir compilation-post-dir))
      (with-current-buffer compilation-last-buffer
    (cd post-dir)))))

(advice-add 'compilation-start :after #'compilation-post-dir)


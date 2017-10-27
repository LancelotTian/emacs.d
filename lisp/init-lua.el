(setq lua-indent-level 4)
(defun my-lua-setup ()
  (local-set-key "\C-c\C-c" 'lua-send-buffer))
(add-hook 'lua-mode-hook 'my-lua-setup)

(provide 'init-lua)

(ignore-errors
  (require-package 'erlang))

;; Erlang mode hook
(defun my-erlang-mode-hook ()
  ;; when starting an Erlang shell in Emacs, default in the node name
  (setq inferior-erlang-machine-options '("-sname" "emacs"))
  ;; add Erlang functions to an imenu menu
  (imenu-add-to-menubar "Fun-List")
  ;; customize keys
  (local-set-key [return] 'newline-and-indent)
  (local-set-key "\C-c\C-f" 'erlang-indent-current-buffer)
  (local-set-key "\M-a" 'erlang-beginning-of-clause)
  (local-set-key "\M-e" 'erlang-end-of-clause)
  (local-set-key "\C-c\C-v" 'erlang-mark-function)
  (local-set-key "\C-c\C-k" 'erlang-mark-clause)
  (local-set-key "\C-c\C-c" 'erlang-compile)
  (local-set-key "\C-h1" 'erlang-man-module)
  (local-set-key "\C-h2" 'erlang-man-function)
  (local-set-key "\C-h3" 'erlang-man-command)
  ;;(local-set-key "\C-\M-a" 'erlang-beginning-of-function)
  ;;(local-set-key "\C-\M-e" 'erlang-end-of-function)
  )

(when (package-installed-p 'erlang)
  (setq erlang-root-dir "/usr/local/Cellar/erlang/17.1/lib/erlang")
  (setq exec-path (cons "/usr/local/Cellar/erlang/17.1/lib/erlang/bin" exec-path))
  (require 'erlang-start)
  (add-hook 'erlang-mode-hook 'my-erlang-mode-hook))

;; (add-to-list 'ac-modes 'erlang-mode)

(provide 'init-erlang)

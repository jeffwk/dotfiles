;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! aggressive-indent :built-in 'prefer)
(package! alert :built-in 'prefer)
;; (package! cider
;;   :recipe (:host github :repo "clojure-emacs/cider")
;;   :pin "6e5294624959736c486f7a466bd5e78ce6183ab9")
;; (package! clj-refactor
;;   :recipe (:host github :repo "clojure-emacs/clj-refactor.el")
;;   :pin "b476345c580ae7cbc6b356ba0157db782684c47f")
;; (package! clojure-mode
;;   :recipe (:host github :repo "clojure-emacs/clojure-mode")
;;   :pin "481ca480e8b7b6c90881f8bd8434addab1d33778")
(package! shell-maker :recipe
  (:host github :repo "xenodium/chatgpt-shell" :files ("shell-maker.el")))
(package! chatgpt-shell :recipe
  (:host github :repo "xenodium/chatgpt-shell" :files ("chatgpt-shell.el")))
(package! company-quickhelp :built-in 'prefer)
(package! company-statistics :built-in 'prefer)
(package! copilot :recipe
  (:host github :repo "copilot-emacs/copilot.el" :files ("*.el" "dist")))
(package! deferred)
(package! elsa :recipe (:host github :repo "emacs-elsa/Elsa"))
(package! elisp-slime-nav :built-in 'prefer)
(package! evil-lisp-state)
(package! evil-matchit)
(package! evil-smartparens)
(package! flycheck-clojure :built-in 'prefer)
(package! flycheck-pos-tip)
(package! gh-md)
(package! groovy-mode)
;;(package! icons-in-terminal :recipe
;; (:host github :repo "seagle0128/icons-in-terminal.el"))
(package! ligature)
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! nginx-mode)
(package! nix-buffer :built-in 'prefer)
(package! nix-sandbox :built-in 'prefer)
(package! nix-update :built-in 'prefer)
(package! org-fancy-priorities :built-in 'prefer)
(package! org-pomodoro)
(package! org-present)
(package! org-projectile :built-in 'prefer)
(package! org-ql)
(package! org-super-agenda)
(package! paren-face :built-in 'prefer)
(package! paxedit)
(package! pkgbuild-mode)
(package! rainbow-mode)
(package! shut-up)
(package! swiper :built-in 'prefer)
(package! systemd)
(package! vimrc-mode)
(package! whitespace :built-in 'prefer)
(package! yaml-mode :built-in 'prefer)

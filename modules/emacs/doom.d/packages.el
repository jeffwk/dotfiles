;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! aggressive-indent :built-in 'prefer)
(package! alert :built-in 'prefer)
(package! company-box :built-in 'prefer)
(package! company-quickhelp :built-in 'prefer)
(package! company-statistics :built-in 'prefer)
(package! copilot :recipe
  (:host github :repo "zerolfx/copilot.el" :files ("*.el" "dist")))
(package! vimrc-mode)
(package! elisp-slime-nav :built-in 'prefer)
(package! evil-lisp-state)
(package! evil-matchit)
(package! evil-smartparens)
(package! flycheck-clojure :built-in 'prefer)
(package! gh-md)
(package! groovy-mode)
(package! ligature)
(package! mpv)
(package! nginx-mode)
(package! nix-buffer :built-in 'prefer)
(package! nix-sandbox :built-in 'prefer)
(package! nix-update :built-in 'prefer)
(package! org-bullets :built-in 'prefer)
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
(package! swiper :built-in 'prefer)
(package! systemd)
(package! whitespace :built-in 'prefer)
(package! yaml-mode :built-in 'prefer)

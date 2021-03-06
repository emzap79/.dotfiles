;; sjas emacs configuration file

(setq package-archives
      '(
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ))
        ;("elpa" . "http://tromey.com/elpa/")
(package-initialize)
; list the packages you want
             ;cider
             ;clojure-mode
             ;clj-refactor
(setq package-list '(
             helm
             helm-ls-git
             helm-flymake
             helm-flycheck
             helm-helm-commands
             helm-ack
             helm-open-github
             helm-orgcard
             ac-helm
             ac-math
             auctex-latexmk
             bash-completion
             bibslurp
             blank-mode
             cdlatex
             chm-view
             color-theme
             dash
             ebib
             ess-R-data-view
             ess-R-object-popup
             ess
             ess-smart-underscore
             evil-indent-textobject
             evil-leader
             evil-matchit
             evil-nerd-commenter
             evil-numbers
             evil-paredit
             evil
             flymake-haskell-multi
             flymake-easy
             gdb-shell
             ghc
             ghci-completion
             gitconfig-mode
             haskell-mode
             highlight-current-line
             highlight-parentheses
             highline
             hlinum
             ido-at-point
             ido-ubiquitous
             insert-shebang
             java-file-create
             javadoc-help
             javarun
             javascript
             jedi-direx
             direx
             jedi
             auto-complete
             epc
             ctable
             concurrent
             deferred
             kanban
             key-chord
             keyfreq
             keywiz
             latex-extra
             auctex
             latex-pretty-symbols
             latex-preview-pane
             linum-relative
             look-dired
             look-mode
             magit
             git-rebase-mode
             git-commit-mode
             cl-lib
             markdown-mode+
             markdown-mode
             minimap
             paredit
             parscope
             popup
             rainbow-delimiters
             rainbow-mode
             realgud
             s
             scratch
             tex-math-preview
             tex-smart-umlauts
             texdrive
             typing
             undo-tree
             use-package
             diminish
             bind-key
             vimrc-mode 
             starter-kit 
             starter-kit-lisp 
             starter-kit-bindings 
             starter-kit-eshell 
             clojure-mode 
             clojure-test-mode 
             clojure-cheatsheet
             clojure-test-mode
             durendal
             cljdoc
             nrepl
             slamhound
             skewer-mode
             ))

(when (not package-archive-contents)
  (package-refresh-contents))
; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))
(require 'package)


(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.post\\'" . markdown-mode))

;(require 'helm)
;(helm 1)

(require 'evil)
(evil-mode 1)


(defalias 'yes-or-no-p 'y-or-n-p)

;; starting layout
(menu-bar-mode 0)
(tool-bar-mode 0)
(custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized)))))

(require 'ido)
(ido-mode 1)

(require 'hlinum)
(setq linum-mode t)

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define-global "jk" 'evil-normal-state)

(require 'flymake-haskell-multi)
(add-hook 'haskell-mode-hook 'flymake-haskell-multi-load)
;(require 'haskell-decl-scan)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
(require 'haskell-doc)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc)
(require 'haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;(require 'haskell-unicode-input-method)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)


;(load "~/.emacs.d/ess/lisp/ess-site")
(require 'ess-site)

;(setq TeX-auto-save t)
;(setq TeX-parse-self t)
;(setq-default TeX-master nil)
;;
;(setq TeX-PDF-mode t)
;(add-hook `tex-mode-hook `flyspell-mode)
;(add-hook `bibtex-mode-hook `flyspell-mode)

;(add-hook ‘LaTeX-mode-hook ‘LaTeX-math-mode)
;(add-hook ‘LaTeX-mode-hook ‘auto-fill-mode)
;(add-hook ‘LaTeX-mode-hook ‘flyspell-mode)
(global-hl-line-mode 1)
(line-number-mode 1)
(column-number-mode 1)

;;; set from within emacs via 'M-x customize-themes'
(require 'color-theme)
(setq color-theme-is-global t)
(load-theme 'manoj-dark)
;(color-theme-monokai)

;mode-specific scratch buffers
;(autoload 'scratch "scratch" nil t)

;; dirty fix for having AutoComplete everywhere
;(define-globalized-minor-mode real-global-auto-complete-mode
;auto-complete-mode (lambda ()
;(if (not (minibufferp (current-buffer)))
;(auto-complete-mode 1))
;)
;(real-global-auto-complete-mode t)

; no tabs!!!
;(add-hook 'after-change-major-mode-hook 
;'(lambda () 
;(setq-default indent-tabs-mode nil)
;(setq c-basic-indent 4)
;(setq tab-stop-list (number-sequence 4 200 4))
;(setq tab-width 4)))

;;; FIX FOR OLD COLOR THEMES
;(defun plist-to-alist (the-plist)
;(defun get-tuple-from-plist (the-plist)
;(when the-plist
;(cons (car the-plist) (cadr the-plist))))
;(let ((alist '()))
;(add-to-list 'alist (get-tuple-from-plist the-plist))
;(setq the-plist (cddr the-plist)))
;alist))

(defun helm-clojure-headlines ()
  "Display headlines for the current Clojure file."
  (interactive)
  (helm-mode t)
  (helm :sources '(((name . "Clojure Headlines")
                    (volatile)
                    (headline "^[;(]")))))
(defun helm-haskell-headlines ()
  "Display headlines for the current Haskell file."
  (interactive)
  (setq haskell-mode t)
  (helm :sources '(((name . "Haskell Headlines")
                    (volatile)
                    (headline "^[a-z]+.+::")))))

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")

;; make own keys work always
(define-key my-keys-minor-mode-map (kbd "C-i") 'some-function)
(define-key my-keys-minor-mode-map (kbd "C-;") 'evilnc-comment-or-uncomment-lines)
(define-key my-keys-minor-mode-map (kbd "C-c C-;") 'helm-haskell-headlines)
(define-key my-keys-minor-mode-map (kbd "C-c ;") 'helm-clojure-headlines)
(define-key my-keys-minor-mode-map (kbd "M-j") 'next-buffer)
(define-key my-keys-minor-mode-map (kbd "M-k") 'previous-buffer)
(define-key my-keys-minor-mode-map (kbd "M-l")
                (lambda () (interactive)
                  (progn
                    (buffer-menu)
                    (other-window))))
(define-key my-keys-minor-mode-map (kbd "M-;") 'other-window)
(define-key my-keys-minor-mode-map (kbd "C-c j") 'flymake-goto-next-error)
(define-key my-keys-minor-mode-map (kbd "C-c k") 'flymake-goto-prev-error)
(define-key my-keys-minor-mode-map (kbd "C-c h") 'flymake-display-err-menu-for-current-line)
(define-key my-keys-minor-mode-map (kbd "C-c C-v") 
                (lambda () (interactive) 
                  (progn
                    (find-file "~/.dotfiles/vim/.vimrc")
                    (vimrc-mode))))
(define-key my-keys-minor-mode-map (kbd "C-c C-e") 
                (lambda () (interactive) 
                  (find-file "~/.dotfiles/emacs/.emacs")))
(define-key my-keys-minor-mode-map (kbd "C-c C-g") 
                (lambda () (interactive) 
                  (find-file "~/.dotfiles/git/.gitconfig")))
;; deployment; to 'reload' changes in .emacs, goto changed expression and use C-x C-e
(define-key my-keys-minor-mode-map (kbd "C-c C-s") 
                (lambda () (interactive) 
                  (shell-command (format "bash -c %s" (shell-quote-argument "~/.dotfiles/dotfiles-setup-linux.sh")))))
;(global-set-key (kbd "C-c ;") 'package-list-packages)
;(global-set-key (kbd "C-c C-s") (lambda () (interactive) (find-file "")))
; moved so clojure fn headers works
;(global-set-key (kbd "C-c ;") 'package-list-packages)
(define-minor-mode my-keys-minor-mode
                     "A minor mode so that my key settings override annoying major modes."
                       t " my-keys" 'my-keys-minor-mode-map)
(my-keys-minor-mode 1)
;; disable for minibuffer
(defun my-minibuffer-setup-hook ()
    (my-keys-minor-mode 0))
(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)
;; make sure it works with (minor?) modes later loaded
(defadvice load (after give-my-keybindings-priority)
           "Try to ensure that my keybindings always have priority."
           (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
             (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
               (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
               (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

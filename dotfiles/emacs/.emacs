;; Path setup
(push "/home/svein/.emacs.d/lisp" load-path)
(push "/usr/local/google/home/svein/.emacs.d/lisp" load-path)

;; Google
(let ((path "/usr/local/google/home/svein/.emacs-google"))
  (and (file-exists-p path)
       (load path)))

;; Package setup
(defvar desired-packages
 '(indent-guide nyan-mode smex ein js2-mode js3-mode
                multiple-cursors flyspell-lazy yasnippet buffer-move counsel undo-tree
                magit nix-mode gradle-mode lua-mode groovy-mode rust-mode
		editorconfig expand-region))

(require 'package)
(setq package-archives
     '(("melpa" . "https://stable.melpa.org/packages/")
       ("gnu" . "https://elpa.gnu.org/packages/")
       ;("marmalade" . "https://marmalade-repo.org/packages/")
       ))
(package-initialize)

;; Install any missing packages
(package-refresh-contents)
(dolist (package desired-packages)
 (unless (package-installed-p package)
   (package-install package)))

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(browse-url-browser-function (quote browse-url-chromium))
 '(browse-url-chromium-program "google-chrome-stable")
 '(column-number-mode t)
 '(elisp-cache-byte-compile-files t)
 '(elisp-cache-freshness-delay 1440)
 '(fill-column 80)
 '(flycheck-disabled-checkers (quote (go-build)))
 '(font-lock-maximum-size 256000)
 '(global-undo-tree-mode t)
 '(haskell-font-lock-symbols (quote unicode))
 '(haskell-mode-hook
   (quote
    (imenu-add-menubar-index turn-on-eldoc-mode turn-on-haskell-decl-scan turn-on-haskell-doc turn-on-haskell-indentation)))
 '(highlight-changes-face-list
   (quote
    (highlight-changes-1 highlight-changes-2 highlight-changes-3 highlight-changes-4 highlight-changes-5 highlight-changes-6 highlight-changes-7)))
 '(highlight-changes-global-changes-existing-buffers t)
 '(highlight-changes-invisible-string " -Chg")
 '(highlight-changes-visible-string " +Chg")
 '(indent-tabs-mode nil)
 '(jit-lock-chunk-size 10000)
 '(jit-lock-context-time 0.5)
 '(jit-lock-stealth-load 800)
 '(jit-lock-stealth-nice 0.1)
 '(jit-lock-stealth-time 0.5)
 '(jit-lock-stealth-verbose nil)
 '(js-indent-level 4)
 '(js2-auto-indent-p t)
 '(js2-dynamic-idle-timer-adjust 0)
 '(js2-enter-indents-newline t)
 '(js2-highlight-level 3)
 '(js2-idle-timer-delay 0.2)
 '(js2-indent-on-enter-key t)
 '(js2-language-version 200)
 '(js2-mirror-mode nil)
 '(js2-pretty-multiline-declarations t)
 '(js3-auto-indent-p t)
 '(js3-enter-indents-newline t)
 '(pdb-path (quote /usr/lib/python2\.7/pdb\.py))
 '(py-backspace-function (quote backward-delete-char-untabify))
 '(py-continuation-offset 4)
 '(py-current-defun-delay 2)
 '(py-delete-function (quote delete-char))
 '(py-encoding-string " # -*- coding: utf-8 -*-")
 '(py-extensions "py-extensions.el")
 '(py-import-check-point-max 20000)
 '(py-indent-offset 2 t)
 '(py-ipython-history "~/.ipython/history")
 '(py-lhs-inbound-indent 1)
 '(py-master-file nil)
 '(py-outline-mode-keywords
   (quote
    ("class" "def" "elif" "else" "except" "for" "if" "while" "finally" "try" "with")))
 '(py-pdbtrack-minor-mode-string " PDB")
 '(py-pep8-command "pep8")
 '(py-pychecker-command "pychecker")
 '(py-pyflakes-command "pyflakes")
 '(py-pyflakespep8-command "pyflakespep8.py")
 '(py-pylint-command "pylint")
 '(py-python-history "~/.python_history")
 '(py-rhs-inbound-indent 1)
 '(py-send-receive-delay 5)
 '(py-separator-char 47)
 '(py-shebang-startstring "#! /bin/env")
 '(py-shell-input-prompt-1-regexp "^>>> ")
 '(python-mode-modeline-display "Py")
 '(save-place t nil (saveplace))
 '(show-paren-mode t)
 '(sort-fold-case t t)
 '(standard-indent 4)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(tramp-default-proxies-alist nil nil (tramp))
 '(tramp-save-ad-hoc-proxies t nil (tramp))
 '(tramp-shell-prompt-pattern
   "\\(?:^\\|\\)[^]#$%>
]*#?[]#$%>].* *\\(\\[[0-9;]*[a-zA-Z] *\\)*" nil (tramp))
 '(undo-tree-visualizer-diff t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(whitespace-empty (quote whitespace-empty))
 '(whitespace-empty-at-bob-regexp "\\`\\(\\([   ]*
\\)+\\)")
 '(whitespace-empty-at-eob-regexp "^\\([
]+\\)\\'")
 '(whitespace-hspace (quote whitespace-hspace))
 '(whitespace-hspace-regexp "\\(\\(\240\\|ࢠ\\|ठ\\|ภ\\|༠\\)+\\)")
 '(whitespace-indentation (quote whitespace-indentation))
 '(whitespace-line (quote whitespace-line))
 '(whitespace-line-column 80)
 '(whitespace-newline (quote whitespace-newline))
 '(whitespace-space (quote whitespace-space))
 '(whitespace-space-after-tab (quote whitespace-space-after-tab))
 '(whitespace-space-before-tab (quote whitespace-space-before-tab))
 '(whitespace-space-before-tab-regexp "\\( +\\)\\(      +\\)")
 '(whitespace-space-regexp "\\( +\\)")
 '(whitespace-style (quote (tabs trailing)))
 '(whitespace-tab (quote whitespace-tab))
 '(whitespace-tab-regexp "\\(   +\\)")
 '(whitespace-trailing (quote whitespace-trailing))
 '(yas-global-mode t)
 '(yas-snippet-dirs (quote ("~/.emacs.d/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-changes ((((min-colors 88) (class color)) (:weight thin))))
 '(highlight-changes-delete ((((min-colors 88) (class color)) (:strike-through t)))))

;; Misc. setup
(setq server-socket-dir "~/.emacs.d/server")
(server-start)
(require 'uniquify)
(blink-cursor-mode (- (*) (*) (*)))
(global-set-key "\M- " 'hippie-expand)

;; Spellchecking
(flyspell-lazy-mode)
(dolist (hook '(python-mode-hook c-mode-hook c++-mode-hook borg-mode-hook hook
                                 javascript-mode-hook js-mode-hook js2-mode-hook
                                 lisp-mode-hook emacs-lisp-mode-hook))
  (add-hook hook (lambda () (flyspell-prog-mode))))

;; Put backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Haskell
;(push "/usr/local/google/home/svein/src/haskellmode-emacs/" load-path)
;(load "haskell-site-file")
;(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; (defun byte-compile-dest-file (fn)
;;   (concat fn "c"))

;; Misc. bindings and setup
(global-set-key [s-backspace] 'kill-buffer)
(global-set-key (kbd "M-b") 'switch-to-buffer)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key [f6] 'gsearch)
(global-set-key [f7] 'google-show-tag-locations-regexp)
(global-set-key [f8] 'google-show-callers)
(global-set-key [f9] 'google-pop-tag)
(global-set-key [f10] 'google-show-matching-tags)
(global-set-key (kbd "M-r") 'revert-buffer)
(global-set-key (kbd "C-x M-e") 'g4-edit-open-asynchronously)
(global-set-key (kbd "M-o") 'other-window)
(global-hi-lock-mode 1)
(global-set-key (kbd "M-i") 'indent-rigidly)
(global-set-key (kbd "C-x M-s") 'sort-lines)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "C-c g") 'magit-status)
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-=") 'er/expand-region)
;; (global-highlight-changes-mode 1)
(show-paren-mode 1)

;; Theming
(load-theme 'solarized-light t)

;; Identation~~
(require 'indent-guide)
(indent-guide-global-mode)

;; Open path under cursor, etc.
(defvar buffer-stack nil)
(defun push-file-and-open (path)
  (push (current-buffer) buffer-stack)
  (find-file path))
(defun pop-file ()
  (interactive)
  (let ((old (pop buffer-stack)))
    (when old
      (switch-to-buffer old))))
(global-set-key
 (kbd "C-.")
 (lambda ()
   (interactive)
   (let ((path (if (region-active-p)
                   (buffer-substring-no-properties (region-beginning) (region-end))
                 (thing-at-point 'filename))))
     (if (string-match-p "\\`https?://" path)
         (browse-url path)
       (progn ; not starting “http://”
         (if (file-exists-p path)
             (push-file-and-open path)
           (if (file-exists-p (concat path ".el"))
               (push-file-and-open (concat path ".el"))
             (when (y-or-n-p (format "file doesn't exist: %s. Create?" path))
               (push-file-and-open path)))))))))
(global-set-key (kbd "C-,") 'pop-file)
                              

;; 80-column markers.
(require 'column-marker)
(defun setup-column-marker () 
  (interactive)
  ;; This errors out on read-only files. TODO: Debug.
  (condition-case ex
    (column-marker-1 80)
    ('error (progn))))
(add-hook 'python-mode-hook 'setup-column-marker)
(add-hook 'c-mode-hook 'setup-column-marker)
(add-hook 'c++-mode-hook 'setup-column-marker)
(add-hook 'borg-mode-hook 'setup-column-marker)
(add-hook 'java-mode-hook 'setup-column-marker)
;; (add-hook 'go-mode-hook 'setup-column-marker)
(add-hook 'javascript-mode-hook 'setup-column-marker)
(add-hook 'js-mode-hook 'setup-column-marker)
(add-hook 'js2-mode-hook 'setup-column-marker)
;; (add-hook 'haskell-mode-hook 'setup-column-marker)

;; Multiple cursors!
(global-set-key (kbd "C-c <") 'mc/mark-all-dwim)


;; Buffer switching
(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))
(global-set-key (kbd "<C-tab>") 'bury-buffer)

;; Recursive edit
(global-set-key (kbd "s-[") (lambda () (interactive) (save-window-excursion (save-excursion (recursive-edit)))))
(global-set-key (kbd "s-]") 'exit-recursive-edit)
(global-set-key (kbd "s-M-)") 'abort-recursive-edit)

;; Nyanmacs!
(require 'nyan-mode)
(nyan-mode 1)

;; ;; Org-mode
;; (require 'org)
;; (define-key global-map "\C-cl" 'org-store-link)
;; (define-key global-map "\C-ca" 'org-agenda)
;; (setq org-log-done t)
;; (setq org-agenda-files '("~/org/"))

;; Ivy
(require 'ivy)
(ivy-mode 1)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-x l") 'counsel-locate)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
(global-set-key (kbd "M-s") 'ivy-resume)


;; ;; Helm & Yasnippet
;; ;; (require 'helm-config)
;; ;; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;; ;; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;; ;; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
;; ;; (global-set-key (kbd "C-x C-f") 'helm-find-files)
;; ;; (define-key global-map [remap occur] 'helm-occur)
;; ;; (define-key global-map [remap list-buffers] 'helm-buffers-list)
;; ;; (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
;; ;; (global-set-key (kbd "M-x") 'helm-M-x)
;; ;; (global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; ;; (global-set-key (kbd "C-c h") 'helm-command-prefix)
;; ;; (unless (boundp 'completion-in-region-function)
;; ;;   (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
;; ;;   (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

;; ;; (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;; ;;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;; ;;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;; ;;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;; ;;       helm-ff-file-name-history-use-recentf t
;; ;;       helm-semantic-fuzzy-match             t ; Fuzzy match for semantic.
;; ;;       helm-imenu-fuzzy-match                t ; And so on.
;; ;;       )
;; ;; (semantic-mode 1)


;; ;; (defun shk-yas/helm-prompt (prompt choices &optional display-fn)
;; ;;   "Use helm to select a snippet. Put this into `yas-prompt-functions.'"
;; ;;   (interactive)
;; ;;   (setq display-fn (or display-fn 'identity))
;; ;;   (if (require 'helm-config)
;; ;;       (let (tmpsource cands result rmap)
;; ;;         (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
;; ;;         (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
;; ;;         (setq tmpsource
;; ;;               (list
;; ;;                (cons 'name prompt)
;; ;;                (cons 'candidates cands)
;; ;;                '(action . (("Expand" . (lambda (selection) selection))))
;; ;;                ))
;; ;;         (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
;; ;;         (if (null result)
;; ;;             (signal 'quit "user quit!")
;; ;;           (cdr (assoc result rmap))))
;; ;;     nil))

;; ;; (helm-mode 1)

;; ;; JSX stuff
;; (add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
;; (defadvice web-mode-highlight-part (around tweak-jsx activate)
;;   (if (equal web-mode-content-type "jsx")
;;       (let ((web-mode-enable-part-face nil))
;;         ad-do-it)
;;     ad-do-it))

;; (require 'flycheck)
;; (flycheck-define-checker jsxhint-checker
;;   "A JSX syntax and style checker based on JSXHint."

;;   :command ("jsxhint" source)
;;   :error-patterns
;;   ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;   :modes (web-mode))
;; (add-hook 'web-mode-hook
;;           (lambda ()
;;             (when (equal web-mode-content-type "jsx")
;;               ;; enable flycheck
;;               (flycheck-select-checker 'jsxhint-checker)
;;               (flycheck-mode))))


(setq inhibit-startup-message t)
(provide '.emacs)
;;; .emacs ends here

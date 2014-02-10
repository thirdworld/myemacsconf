(setq byte-compile-warnings nil)
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: For Emacs >= 23.2, you must place this *before* any
;; CEDET component (including EIEIO) gets activated by another 
;; package (Gnus, auth-source, ...).
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode,
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode,
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberant ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languages only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

(add-to-list 'load-path "~/.emacs.d/ecb-snap")
(load-file "~/.emacs.d/ecb-snap/ecb.el")
(setq stack-trace-on-error t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-to-list 'load-path
	     "~/.emacs.d/yasnippet-0.8.0/")
(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path
	     "~/.emacs.d/php-mode-1.5.0/")
(require 'php-mode)
;;根据文件扩展名自动php-mode
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
;;开发项目时，php源文件使用其他扩展名
(add-to-list 'auto-mode-alist '("\\.module\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

(add-to-list 'load-path
	     "~/.emacs.d/doxymacs-1.8.0/lisp/")
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode) 
(add-hook 'php-mode-hook 'doxymacs-mode) 

(add-to-list 'load-path 
	     "~/.emacs.d/xcscope/")
(add-to-list 'exec-path 
	     "~/.emacs.d/xcscope/")
(require 'xcscope)
(setq cscope-do-not-update-database t)

(tool-bar-mode 0)  
(menu-bar-mode 0)

(add-to-list 'load-path 
	     "~/.emacs.d/session/lisp/")
(require 'session)
(setq session-save-file "~/.emacs.d/cache/session")
(add-hook 'after-init-hook 'session-initialize)


(add-to-list 'load-path 
	     "~/.emacs.d/ace-jump")
;;
;; ace jump mode major function
;; 
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)



;; 
;; enable a more powerful jump back function from ace jump mode
;;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

(add-to-list 'load-path  "~/.emacs.d/header2")
(require 'header2)
(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)

(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")
	(sequence "REPORT" "BUG" "KNOWNCAUSE" "|" "FIXED")
	(sequence "|" "CANCELED")))

(defconst emacs-autosave-fold (format "%s/%s/" user-emacs-directory "cache/autosave"))
(setq auto-save-list-file-prefix emacs-autosave-fold)
(setq auto-save-file-name-transforms `((".*" ,emacs-autosave-fold t)))
(add-to-list 'auto-save-file-name-transforms
             (list "\\(.+/\\)*\\(.*?\\)" (expand-file-name "\\2" emacs-autosave-fold))
             t)
(setq auto-save-interval 300);击键X次保存
(setq auto-save-timeout 19);空闲X秒时就保存
;;(setq auto-save-visited-file-name t);当前buffer关联一个已存在的文件名时才保存

(defconst emacs-backup-dir (format "%s/%s/" user-emacs-directory "cache/backups"))
(setq backup-by-copying t ;; don't clobber symlinks
      backup-directory-alist '(("." . "~/.emacs.d/cache/backups"))
      delete-old-versions t
      kept-new-versions 128
      kept-old-versions 10
      version-control t) ;; use versioned backups
;;(setq make-backup-files nil)
;;(setq vc-make-backup-files nil) ;;Emacs normally does not save backup files for source files that are maintained with version control.

;; Org-mode
;;(add-to-list 'load-path "~/.orgPATH_TO_WHERE_YOU_UNPACKED_ORGMODE") 
(require 'org)                                   
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t) 
(setq org-agenda-files (list "~/org/work.org"
			     "~/org/school.org"
                             "~/org/home.org"))


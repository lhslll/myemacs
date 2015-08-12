
;; melpa packages source
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;;
(set-default-font "Consolas")
(setq global-linum-mode t)

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/mypackages")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")


(defalias 'yes-or-no-p 'y-or-n-p)

;; proxy settings for accessing internet
(setq url-proxy-services '(("http" . "192.168.208.18:8080")
			   ("https" . "192.168.208.18:8080")) )

;; load default zenburn theme
(load-theme 'zenburn t)


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
;(setq url-proxy-services '(("http" . "192.168.208.18:8080")
;			   ("https" . "192.168.208.18:8080")) )

;; load default zenburn theme
(load-theme 'zenburn t)

;(setq browse-url-browser-function 'w3m-browse-url)
;(autoload 'w3m-browse-url "w3m" "ask a " t)
;(global-set-key "\C-xm" 'browse-url-at-point)

;; mew settings
(autoload 'mew "mew" nil t)
(autoload 'mew-send "mew" nil t)

(setq read-mail-command 'mew)
(autoload 'mew-user-agent-compose "mew" nil t)
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'mew-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'mew-user-agent
      'mew-user-agent-compose
      'mew-draft-sent-message
      'mew-draft-kill
      'mew-send-hook))

(setq mew-use-cached-passwd t)
(setq mew-ssl-verify-level 0)

(setq mew-config-alist
      '(("default"
	 ("mailbox-type" . pop)
	 ("name" . "LI/HUSHENG")
	 ("user" . "lihusheng0623")
	 ("mail-domain" . "gmail.com")
	 ("smtp-ssl" . t)
	 ("smtp-ssl-port" . "465")
	 ("smtp-server" . "smtp.gmail.com")
	 ("pop-ssl" . t)
	 ("pop-ssl-port" . "995")
	 ("pop-server" . "pop.gmail.com")
	 ("pop-user" . "lihusheng0623@gmail.com")
	 ("pop-auth" . pass)
	 ("pop-delete" . nil)
	 ;;("prog-ssl" . "/usr/bin/stunnel")
	 ;;("proto" . "%")
	 )
       ("imap"
	 ("mailbox-type" . pop)
	 ("name" . "LI/HUSHENG")
	 ("user" . "lihusheng0623")
	 ("mail-domain" . "gmail.com")
	 ("smtp-ssl" . t)
	 ("smtp-ssl-port" . "465")
	 ("smtp-server" . "smtp.gmail.com")
	 ("imap-ssl" . t)
	 ("imap-ssl-port" . "993")
	 ("imap-server" . "imap.gmail.com")
	 ("imap-user" . "lihusheng0623@gmail.com")
	 ("imap-auth" . pass)
	 ("imap-delete" . nil)
	 ;;("prog-ssl" . "/usr/bin/stunnel")
	 ("proto" . "%")
	 )
      ))

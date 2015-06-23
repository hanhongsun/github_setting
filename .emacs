
;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


; define delete by block if select
(delete-selection-mode t)

; if by default, M-w cannot copy into clipboard
(setq x-select-enable-clipboard t)

; define \C-c\M-c as the C style block uncomment
(defun uncomment-region (beg end &optional arg)
   (interactive "*r\np")
   (comment-region beg end (- arg)))
(global-set-key "\C-c\M-c" 'uncomment-region)

;; the test write file here for (linum-mode)
(global-linum-mode t)

;; I am trying on define M-up and M-down to be 4-8 lines
;; let's see what will happend
;; it does not work because, it is not supposed to do so
;; and there are no transpose-line-up transpose-line-down
;; here
;; (define-key input-decode-map "\e\eOA" (kbd "<M-up>"))
;; (define-key input-decode-map "\e\eOB" [(meta down)])
;; (global-set-key (kbd "<M-up>") 'transpose-line-up)
;; (global-set-key [(meta down)] 'transpose-line-down)


;; self trying about the 7 lines moving up and down 
(defun move-some-lines-down ()
   (interactive)
   (when (featurep 'xemacs) (setq zmacs-region-stays t))
   (forward-line 7))
(defun move-some-lines-up ()
   (interactive)
   (when (featurep 'xemacs) (setq zmacs-region-stays t))
   (forward-line -7))
 (define-key input-decode-map "\e\eOA" (kbd "<M-up>"))
 (define-key input-decode-map "\e\eOB" (kbd "<M-down>"))

(global-set-key (kbd "<M-up>") 'move-some-lines-up)
(global-set-key (kbd "<M-down>") 'move-some-lines-down)

;; the one line toggle-comment
;; (defun toggle-comment-on-line ()
;;   "comment or uncomment current line"
;;   (interactive)
;;   (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
;;(define-key input-decode-map [67108923] (kbd "<C-;>"))
;; (global-set-key (kbd "<C-;>") 'toggle-comment-on-line)

;;comments/uncomments the current line or the region if one is active.
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))
(define-key input-decode-map [67108923] (kbd "<C-;>"))
(global-set-key (kbd "<C-;>") 'comment-or-uncomment-region-or-line)

;;; READ the KEY code from here:
;;;(read-key-sequence "?")
;;; run this one in emacs lisp by C-M-x and you can test out your own combination code



(require 'cc-mode)
;; (setq-default c-basic-offset 4 c-default-style "linux")
;; (setq-default tab-width 4 indent-tabs-mode t)
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)


;; ;; Temporarily declaring the local archive
;; (defun package-let (package archive)
;;   "Install a package using the specified archive."
;;   (let ((package-archives
;;          (cons (cons "archive" archive)
;;                package-archives)))
;;     (package-refresh-contents)
;;     (package-install
;;      (if (stringp package)
;;          (intern package)
;;        package)))
;;   (package-refresh-contents))



;; (package-let 'package "~/.emacs.d/package.el")

;; (require 'package)
;; (package-initialize)
;; (require 'cl)

;; (add-to-list 'load-path "~/emacs.d/autopair/") ;; comment if autopair.el is in standard load path 
;; (require 'autopair)
;; (autopair-global-mode 1) ;; enable autopair in all buffers


;; C++ autopair of {}
;; (require 'autopair)
;; (autopair-global-mode 1)
;; (setq autopair-autowrap t)

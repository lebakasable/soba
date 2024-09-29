;;; soba-mode.el --- A Major Mode for the Soba programming language. -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;;  A Major Mode for the Soba programming language.
;;
;;; Code:

(defconst soba-mode-syntax-table
  (with-syntax-table (copy-syntax-table)
    (modify-syntax-entry ?# "< b")
    (modify-syntax-entry ?\n "> b")
    (modify-syntax-entry ?' "\\")
    (syntax-table))
  "Syntax table for `soba-mode`.")

(eval-and-compile
  (defconst soba-keywords
    '("include" "let" "if" "fn" "and" "or" "while" "do" "for" "defer" "extern"))
  (defconst soba-types
    '("u64")))

(defconst soba-highlights
  `((,(regexp-opt soba-keywords 'symbols) . font-lock-keyword-face)
    (,(regexp-opt soba-types 'symbols) . font-lock-type-face)
    ("'\\(\\\\?.\\)" 0 font-lock-constant-face)))

;;;###autoload
(define-derived-mode soba-mode prog-mode "Soba"
  "A Major Mode for the Soba programming language."
  :syntax-table soba-mode-syntax-table
  (setq font-lock-defaults '(soba-highlights))
  (setq-local comment-start "# "))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.soba\\'" . soba-mode))

(provide 'soba-mode)
;;; soba-mode.el ends here

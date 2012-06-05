(setq sql-product-alist
      (cons '(hsql
              :font-lock sql-mode-hsql-font-lock-keywords
              :sqli-login (database)
              :sqli-connect sql-connect-hsql
              :sqli-prompt-regexp "^sql> "
              :sqli-prompt-length 4
              :sqli-input-sender nil
              :syntax-alist ((?# . "w")))
            sql-product-alist))

(defcustom sql-hsql-program "java"
  "*Command to start hsql by HsqlDB."
  :type 'file
  :group 'SQL)

(defcustom sql-hsql-jar "hsqldb.jar"
  "*HsqlDB jar."
  :type 'file
  :group 'SQL)

(defvar sql-mode-hsql-font-lock-keywords nil
  "HsqlDB SQL keywords used by font-lock.")

(defun sql-highlight-hsql-keywords ()
  "Highlight HsqlDB keywords."
  (interactive)
  (sql-set-product 'hsql))

;;###autoload
(defun sql-hsql ()
  "Run SqlTool by HsqlDB as an inferior process."
  (interactive)
  (sql-product-interactive 'hsql))

(defun sql-connect-hsql ()
  "Create comint buffer and connect to HsqlDB using the login
     parameters and command options."
  (let ((params (list "-classpath" 
                      sql-hsql-jar
                      "org.hsqldb.util.SqlTool" 
                      "--stdInput")))
    (if (not (string= "" sql-database))
        (setq params (append params (list sql-database))))
    (set-buffer (apply 'make-comint "SQL" sql-hsql-program
                       nil params))))

(provide 'hsql)
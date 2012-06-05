Extends sql-mode to support [hsqldb](http://hsqldb.org/).

First, configure path to hsqldb.jar:

    (setq sql-hsql-jar "/full/path/to/hsqldb.jar")

Then, run `sql-hsql` and enter one of the urlid-s configured in the
`~/sqltool.rc` when asked for a database.
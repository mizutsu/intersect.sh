# intersect.sh
"intersect.sh" is a shell script to get common lines from multiple files.<br>
This shell script is supporting to get common lines from more than 3 files.<br>
("intersect.sh"は、複数のファイルから共通の行を取得するためのシェルスクリプトです。<br>
このシェルスクリプトは、3つ以上のファイルから共通の行を取得することをサポートしています。)

# shell type
Bash

# Usage
Set the file names one by one in the argument.<br>
(引数にファイルを1つ1つ設定する)
```shell
$ sh intersect.sh file1.log file2.log file3.log file4.log ...
```
Example
```command
$ cat file1.log
This is sample A.
This is sample B.
This is sample C.
This is sample D.
 
$ cat file2.log
This is sample A.
This is sample B.
 
$ cat file3.log
This is sample A.
This is sample C.
 
$ cat file4.log
This is sample A.
This is sample D.
 
$ sh intersect.sh file1.log file2.log file3.log file4.log
This is sample A.
```

You can use wild card as below.<br>
(ワイルドカードを使うこともできます。)
```shell
sh intersect.sh file?.log
sh intersect.sh file*
```
Example
```command
$ cat file1.log
This is sample A.
This is sample B.
This is sample C.
This is sample D.
 
$ cat file2.log
This is sample A.
This is sample B.
 
$ cat file3.log
This is sample A.
This is sample C.
 
$ cat file4.log
This is sample A.
This is sample D.
 
$ sh intersect.sh file?.log
This is sample A.
 
$ sh intersect.sh file*
This is sample A.
```

# Options
|  Option  |  Description  |
| ---- | ---- |
|  --version, -v  |  print intersect.sh version  |
|  --help, -h  |  print help  |

# License
MIT License

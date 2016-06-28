# AutoRun
A convenient tool can run multiple program by custom setting.

###Instruction
In AutoRunSetting.txt , you can write commands like the following :

//This is comment line.

//If the file path exists, AutoRun runs it, and can be shown/hidden when the line start with character '*'.

//You can also wait milliseconds by wait command.

//Example :

*"s1\server1.txt"

wait 500

"s2\server2.txt"

wait 500

###UI
![Alt text](/pic/preview.png)

Start：Run all commands in AutoRunSetting.txt

CloseAll：Close all file that is run by AutoRun

MinimizeAll：Minimize all file that is run by AutoRun

Show/Hide * file：Show or hide the * file path that is running.

Surely, you can also run program with any extension like *.exe

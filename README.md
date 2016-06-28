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
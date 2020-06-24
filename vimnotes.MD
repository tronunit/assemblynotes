vi, usually in the form of vim, which is a fancier version is a bit cryptic. 

However it comes in a lot of linux/unix situations, and may be available when other editors are not. 
Some people heavily customize vim and use it for everything, others only resort to vim when there is no other choice. 
(hint: nano is often available & is a terminal text editor as well, but the commands to use it are visible on the screen and a bit more intuitive.)

Vi is the 'visual mode' of the ed editor. 
There are three modes.
You can open a file with vim to start (vim filename)
Or just open vim. 
In order to type, you need to hit the i key to get into insert mode. 
To escape from here, you must hit escape, then :q! to quit without saving, :wq! to save and quit
or :w to save. 
They key to understanding vim is understanding the three modes. 
In some situations, the arrow keys won't work to move around the text, and you will need to use k and j for up and h and l for left and right. 
This is a hold over from before keyboards were standardized and might not have arrow keys. 

Note that if you try to edit a file that you need higher permissions to edit, it will silently just not make any changes, so be sure to check the file to see that the changes are there. 
This comes up when editing config files in /etc, etc, if you did not sudo or su. 

There is a lot more to vim, but escape :wq! will get you out, and if you mysteriously can't insert new text in a document hit i


![alt text](https://github.com/tronunit/assemblynotes/blob/master/2020-06-24%2015.34.31.png "Diagram of vim/vi modes")

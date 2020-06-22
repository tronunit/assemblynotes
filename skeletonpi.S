/* boilerplate file skeleton updates june 22, 2020*/
@ feel free to adapt
/*
this is a file I used awhile ago. Am currently working out what directives are actually
best considering I am running raspbian compiled as armv7 on an rpi3, despite armv8-a chip
*/


@ currently putting notes on directives I find here

@ I use 2 environements, so I set this up to switch back and forth
@ This assumes gcc. 


/* exyneos options */
	.arch	armv7-a
	.cpu	cortex-a15
	.fpu vfpv3-d16  @ need to verify this
/* options to switch to for rpi template */
/*	so previously I was using armv8-a here
	not sure what happens with armv8-a running on an armv7 system
	-- raspbian kernel and userland are
	compiled as armv7 on a pi3 and pi4, despite being armv8-a chips
	am still researching what that means for fpu, and if armv7-a ia a better directive
	(as of 2020 there is a beta for a 64bit raspbian, and some alternate 64bit debian images)
*/
@ directives used on rp3 here: http://bob.cs.sonoma.edu/IntroCompOrg-RPi/sec-stack-manage.html
@ Define my Raspberry Pi
/*
        .cpu    cortex-a53
        .fpu    neon-fp-armv8
        .syntax unified         @ modern syntax
*/
/*
	.arch	armv7-a      
	.cpu	cortex-a53
	.fpu	neon-fp-armv7
*/
/* general directives*/
	.syntax unified
	.global	main


	.text
main:




	.data





/*
cheatsheet notes:
gcc -g -o name name.s
echo $?
git add .
git commit -m "message"
git push origin master
git push origin branch2
git pull


*/

/* boilerplate file skeleton updates june 22, 2020*/
@ feel free to adapt
@ uncomment the headers below for the arch you are using
@ I use 2 environements, so I set this up to switch back and forth
@ This assumes gcc. 
@ These are headers from a few years ago, 
@ which I should verify if they are the best choices!

/* exyneos options */
	.arch	armv7-a
	.cpu	cortex-a15
	.fpu vfpv3-d16
/* options to switch to for rpi template */
/*	so previously I was using armv7-a here
	but I have discovered that raspbian kernel and userland are
	compiled as armv7 on a pi3 and pi4, despite being armv8-a chips
	am still researching what that means for fpu
	(as of 2020 there is a beta for a 64bit raspbian, and some alternate 64bit debian images)
*/
/*
	.arch	armv7-a      
	.cpu	cortex-a53
	.fpu	neon-fp-armv8
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

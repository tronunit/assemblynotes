# assemblynotes
notes on assembly language
Still in draft stage!

This is not an introductory tutorial. It's not actually a tutorial :)
It's the things I have found that were missing from other tutorials and references, along with a collection of resouces that have helped me.
I intend to add some 'assembly language coloring book' style printables but they are currently in a very rough stage of development. 

Unless stated, I am using gcc on either raspbian or arch linux. Both of the platforms I use are armv7. I am trying to stay focused on ARM, but I am very tangential




Learning Tips:
I strongly recommend you draw out/ diagram out exactly what is happening with various instructions as you learn. 
Another strategy is to keep a spread sheet open and organize what you think is in each register/ memory area there. 
I initially tried to do this w/pencil and paper when I first learned this, but my handwriting sucks and the diagrams quickly become jumbled.

I have made a series of photocopied diagram templates that have helped me. You can also work out a quick flow making diagrams with a ruler or a cut out template. 

You can get a long way in computer science by making and understanding boxes of other boxes. 

Zed Shaw in his learn C the hard way, learn python the hard way books recommends memorizing all of the basic terms/keywords/operators. This is good advice. I already know 90% of the terms on his list, but it's good to test yourself, and learn those you don't. Coming from another programming language you may find keywords and syntax to be very similar (be careful of false friends, false cognates!).
In assembly it's unlikely the instructions will look just like another language. If they do, they may not do the same thing. 

I recommend not just having a list, but making detailed study notes on instructions. 
Write out step by step what it does. Ironically people say higher level languages 'do a lot behind the scenes for you'. Assembly does that too. Make sure that if an instruction modifies other registers, such as the link register, conditional flags, that you know exactly what it does. 
Some instructions are pseudo-instructions, which means they do more than one op behind the scenes. 

ARM has a load/store architecture, meaning that you load things into registers to work on them, as opposed to x86/CISC which can directly access memory. 
RISC is 'reduced instruction set' which is great, because there are fewer instructions to learn. On the otherhand, no matter how many instructions there are, you need to undertand the model and what's happening. 

ARM has some comlicated addressing modes and load/store multiple commands. Luckily there are a number that are synonyms, but it's importand to get these instructions down early, since everything you do has to be loaded or stored. I am currently working on some worksheets for these, which I will post once they seem to be legible and make sense. 

Assembly can be difficult to get help with because it can take 30 min to explain the problem in detail. 

Stack overflow and similar may have resources/answers, but take them with a grain of salt. There are a lot of people with CS backgrounds who were taught some amount of some kind of assembly at some point. 
For instance, I saw someone lamenting the decadence of 2 pass assemblers in a forum response. Modern assemblers are 2 pass. If you have a situatin where yours is not, this is neither good not bad, but you should know what it does. (gcc and as are 2 pass, meaning they build symbol tables and do the macros in pass 1) 




Remember the rubber ducky principle: explaining your problem aloud to someone else, even a rubber ducky can help you solve it.

If you are stuck, know that everyone gets stuck, you will get stuck. Work on a checklist of what to do when you get stuck. My own stategies include checking the original directions/spec, listing out what the problem is. What my base assumptions are. What could be happening, refine that into something testable. ETC. 






Tip:
Raspberry pi/ARM tutorials and resources often use either as plus ld (a freestanding assembler (as), and a linker from binutils (gnu), or they use gcc (the gnu compiler collection) plus ld, or they just use gcc. Often they start with as plus ld to illustrate the what linking is. 

Some code organization/syntax will be different depending on the tool chain you use( assembler, linker, etc)
if you are using as (gnu assembler):
  you need a start label, which will be the entry point. 
 When you use gcc:
  you need a main label. The gcc linker adds a start label in the generated startup code it adds. 
  
  It will complain if you have your own start label because it adds it's own, and there can be only one.
  
  The start code sends control to the main label, the 'entry point' here. 
  with gcc you can call c library functions without explicitly linking the c lib. 
  
  If you use gcc with a .S upper case s file extension, you can use c++ style // comments
  @ generally starts a comment in arm as ; generally starts an x86 assembly comment.
  (don't take my word for it, x86 has 2 syntax styles, at&t and intel)
  Comments, and syntax will very with the tools you are using. 
  
  I am using gcc, so some of what I say is only true for gcc running in linux.
  gcc also has c style comments /* */ 
  
  The convention in gnu/linux tends to be to and assembly files with a .s or a .S, I hear x86 uses .asm, but you may see others.
  Note that there are a number of practices that are not enforced by hardware/tool chain, but will complicate things a lot if you decide to do something different. For instance cdecl is the calling convention for subroutines with gcc/linux, and std call is the typical one for windows, but in reality a compiler can do whatever it wants, so you may see some crazy stuff in compiler generated code. 
  
  



Tools: 
The first thing I look for when returning to assembly is what the actual gcc commands are. 
GCC:
simplest gcc to get your c source turned into assembly by gcc
That is a capitol S
gcc -S nameoffile.c

simplest gcc to get your assemly file assembled and linked with name of choice by gcc
gcc -o desirednameofoutput nameoffile.c 

use the -g flag to include things that will help you run gdb
gdb and gcc may also need various flags to tell it what floating point arch you are using, etc
and there is usually a lengthy string of flags for the optimal build. (will add details as I get there)

If you are disassembly your own c code, or compiling c to assembly to see what it does, note that the compiler does lots of optimization, and there is a flag to tell it not to do that, (which I will have to look up)








TODO: include skeleton (boiler plate) starter file, example outline file
TODO: add diagrams. (Have a lot of pen and paper diagrams I am working on making printable versions of)

WIP

Collected resources from learning assembly languages, with a little c on the side

Currently working on ARM, armv7 (32 bit) with a raspberry pi 3 B, running raspian, and a samsung arm chromebook (snow neptune) with arch. I use gcc, gdb, vim, tmux, radare2, various text editors. 

I tend to have too many side projects going, so I am trying to keep the focus of this one on ARM (in the above situations) until I remember a good chunk of ARM assembly.
I also have a circa 2004 ibook with a g3 powerpc processor, running osX tiger (or whatever the last version you can have on ppc is) 

Including resources on x86, 64, various RISC family assemblers (mips, ppc)

Also interested in web assembly, bytecode, binary analysis, static analysys, compilers, interpreters, programming language implementation/design/etc, system programming, linux, unix, *nix, etc.


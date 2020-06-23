# rpi tutorials tend to use either as and ld, or gcc

The assembler you use will determine what macros and directives you can use, what a comment is, and each may need specific starting points. 
If you start using another assembler/compiler, be prepared to do some research.

# gcc needs a main label, as needs a start label
* sorry in advance for the tangents. I have tried to prioritize the list items. Feel free to stop reading lower down the list

## as and ld
* often used to demonstrate what linking is/does
* you will need a _start label. This is the entry point, where the loader starts after loading your ELF into memory
* as does not care about main. Gcc needs main as the entry point
* you can use -g if you plan to use gdb
* keep in mind I never use as, I know about it from trying to use tutorials that use it
* binutils has some other useful stuff in it like objdump, which is one of the ways ppl get these disassembled code examples that have adresses in them

## gcc
* needs a main label as the entry point
* it adds it's own start when it links, so if you add start there will be 2 starts. There can be only one. 
* allows you to call c library functions without linking anything else. 
* if you have never been happy to see c library functions, you will be amazed by how great they are after you have been swimming in system calls for awhile
* sometimes seen as a linker after as, often after explaining linking, right before switching to gcc alone
* This is actually the gnu compiler collection, not just gnu c compiler
* c and c++ compilers and various others have a translation stage where they take your code, cook it, and spit out assembly
* After that the assembly is assembled, then horked out as object code, which needs to be linked to be runable
* I love compilers so much, gcc is basically the wood between the worlds from Narnia (The magician's nephew) 
[Clang is the wardrobe from The lion the witch, etc. This was an arbitrary decision...]


# list of assemblers (totally incomplete)
* nasm
* masm 

# learn gdb
## do this thing
* this is a debugger
* when I took assembly in school, 75% of the class had already done assembly and already knew all the tools
* they skipped some of the 'obvious' things
* they said 'use gdb' in an offhand way and spent 2 minutes talking about it
* they didn't even say the coolest things it did
* i suffered for about a month before i figured this stuff out
* don't suffer
* no matter how crunched for time you are, it's worth it to learn gdb
* seriously, this is like an mri for your code. 
* if you have a cs professor, or otherwise, who makes an offhand comment like 'learn gdb'
* write that down, and spend however many hours you need
* for instance 'everyone here knows what a turing machine is, right', said to a wall of blank faces
* gdm can do dynamic analysis, meaning it can step through your program as it runs
* it stops at points you tell it to. (breakpoints)
* you can see a list of what's in all the registers at different points
* 
* there are source debuggers which work from your source, and binary debuggers like gdb
* this will allow you to see what your assembly program is doing at each step, like magic
* except it's command line magic
* so it can be a little annoying to learn, especially when you don't actually know what it can do
* if you learn one command line tool this is the one
* assembly is full of mysteries
* this is like going to the end of the book to see who did it, or reading all the spoilers online
* also this is hacker tool. For a variety of meanings of the word hacker. Be one of us.
* In many IDEs for c/c++ the debugger is just a graphical front end for gdb, or in the case of xcode the llvm version, lldb 
* If you never learn gdb, consider learning the debugger in whatever IDE you use. 
* traditionally people use print statements as instrumentation to track down bugs
* in assembly that means many lines of extra code for each call, where you can introduce new errors
* in c printf is buffered I/o which means each print is not immediately written out, because this is much more efficient
* however it means your printfs could appear out of order, or appear to be happening after other code
* the systemcall equivilent in linux is also buffered, somewhere in kernaltopia
* buffered here means that output is collected until there is a reasonable chunk to write/ or to space out writes in time
* tiny frequent writes are very inefficient. (slow)
* one downside of some debuggers in some languages such as python is that they can interfere with garbage collection, because they can hold references to objects after all the references should have been dropped
* this can make you think you have a memory leak/ circular reference/problem (python counts references)
* 


## build systems
* you should learn make. 
* most people hate it. If they don't it's stockholm syndrome
* I am developing stockholm syndrome
* many make tutorials are incomprehensible
* The syntax is like reading other people's regular expressions
* I actually keep my complicated compiler calls in a text file and paste them in.
* make is a command, a makefile is where you put the details of what make should do
* it's the buildonomicon
* this is one of the few places where you must use a tab, a real tab not a 'tab' that is actually spaces
* or it won't work. but only for some of the syntax....
* gnu make is turing complete. Probably bsd make, too. 
* once you get to projects that have many files and complicated organization you will need a build system
* in c/c++ the linker needs to link the dependencies/includes in the right order, or you are borked
* this is called a dependency graph
* when computer people talk about graphs we mean a formal math thing. 
* we take normal words and give them alternate meanings that you are supposed to know by the context
* Java devs use ant, maven, gradle, etc as build languages
* note that this problem has lead to the creation and use of multiple languages just to handle builds
* One of the reasons people use IDEs is they hands this stuff behind the scenes
* You will need to know what it's doing at some point, because it will get totally borked, and there is only so far a build system can read your mind
*

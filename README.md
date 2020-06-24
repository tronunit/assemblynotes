# assemblynotes
## notes on assembly language
Still in draft stage!

The ARMv7 ISA, the instruction set, has been described as baroque. 
The main ways it earns this are with the complicated load/store multiple ops, conditional execution options on most things (built into the instruction), the sometimes complex operand2 stuff. (This is a paraphrase of this opinion can be found in the beginning of this: Patterson, David A.. Computer Organization and Design ARM Edition (The Morgan Kaufmann Series in Computer Architecture and Design). Elsevier Science., which is a great computer organization book, but don't get it if you're just trying to learn armv7, because it covers a subset of armv8 64bit.)

Armv7 is a load/store architecture, meaning you must load things into the registers to work on them. I am told that in CISC architectures such as x86 or x64 (intel or amd chip ISAs) you can manipulate things that are in memory and not in a register. Keep in mind that my understanding of x86/x64 is limited to reading and trying to understand disassembled compiler generated code, with very frequent checks to our friend the 2k+ page intel manual. (links to manuals at the bottom of this page.) People used to have this in book form, but I you could probably build a house out of that now. 

C, C++ and other non automatically garbage collected languages tend to teach you to pay attention to *where* things are stored and *when* they exist. This is important in higher level languages too, since object oriented style objects also have lifecycles. (Just most things are stored in the same abstract place.)

In C, you need to get a handle on storage, linkage, and scope. C is basically a fancy system for not having to write your own assembly code, so you can learn a lot about how those things work from learning assembly. 


In assembly, keep in mind that instructions are encoded somewhere too. So unlike higher level languages: 
### you can store values *inside* the instruction. This is called an immediate value.
global/static values are kept in the .data section, or .bss if uninitialized
Otherwise, things are in registers, on the program stack, or in a piece of free store memory you got from malloc, and are carefully keeping the address of.
I am still working out how declared/named locals work - it looks like they can get labels, so you can use their names, but this seems to be an obscure topic. 
When you run out of assembly tutorials and references, the next thing to do is start doing experiments. Just beware that compilers do a lot of optimization and that compiler generated code may not be the way programmers would write that. 

Keep in mind when things get complicated that all of this is just a long linear array with addresses in place of index numbers, in order to keep track of the 1s and 0s.

### when you get stuck: (inevitable, everyone gets stuck)
* draw a picture. (stack/ byte diagrams/ registers) 
* you would be amazed at how much computer science can be explained with nested box diagrams. 
* add time to the box diagrams. 
* check the manual. Sometimes an instruction is doing something for you that you thought you had to do in another step, or the reverse. 
* for leanring some of the complicated load/store multiple and addressing mode draw the stack/ the registers and go through what you think it's doing step by step. 
* you can also open a spead sheet and use the boxes as each byte, with a column for the address offsets, or you can have boxes for each register to keep track of whats where
* in the beginning, write comments for what you think it's doing. (Later on you will probably cut this down to an overview/ what's in what register/etc)
* check to see if you're depending on a register that may be changed by a function you call. (r0-r3 are used for args, r0 is where the return value shows up, r4-r11ish are supposed to be preserved by functions you call, system calls can have args in a0-a4, the syscall number goes in r7, return in r0)
* are you operating on an address in a register and not a value, or the reverse?
* explain it to someone else, even if it's an imaginary friend, just explaining it may help you organize what's going on enough to figure the problem out.
* write down what you think is where, then use gdb to see what is where, with breakpoints, as it runs. 
* housekeeping with the stack pointer(sp), the program counter (pc), and the link register(lr) must be kept up. The pc is the address of the next instruction to load. So if this is wrong, you will be working at some arbitrary wrong address. The link register is the return address. Not a bit deal until you have nested functions. Then if you haven't stored the last lr you will have no way home from the outer nested function's context.  The stack pointer tells you what the bottom of the stack is. (it grows down. As in more negative in address. Confusingly we call the lowest address the top of the stack.) If the stack pointer is off, you will be addressing the wrong stuff on the stack, and may thus not be able to find where you stashed the old lr and pc values, and be painted into a corner.



When checking out a new (to you) ISA:
* how are the instructions encoded?

    *armv7 instructions are all encoded in 32 bits. Intel instructions are of variable size.*

* how many instruction types are there?

    *armv7 has 4 different instruction encodings (as far as I can tell), with the big divide being between load/store instructions and data manipulation instructions.*

* how big are the addresses? 

    *armv7 has 32 bit general addresses, arrmv8 64 bit has 64 bit addresses. The insructions are still encoded in 32 bits, though.*
    
 * armv7 can address a byte, but not smaller. (This depends on the chip/situation though) 
 * except movt, movw, generally you use the whole 32 bit register at a time in armv7. The floating point registers in fpu/neon have nested structures that remind me of the intel nested general register scheme. 
 * RISC prefers that registers don't have special jobs. (Or so I hear.) Intel registers tend to have jobs. Truthfully, programming convention means that general purpose registers end up having specific roles as well. This is not enforced in hardware. But having repeated patterns makes life a lot easier
 * Intel/x86/x86 assembly has 2 different syntaxes, intel and at&t. They do the same stuff but express it just differently enough that you will be freaked out by the other one, once you learn one well. (generally tools now let you display the syntax of your choice, though you may need to look up how.)
 * There appear to be some syntax variations in arm, for instance with different assemblers, but not as different as intel/at&t. I use either as or gcc. I notice a lot of code I use has a .syntax unified directive. 

You don't need to know c to learn assembly, but it will help if you know a little.

Knowing some c will help you with assembly, and assembly will help you with c. Many higher level languages can be learned by learning the reasonable sounding rules for what the syntax does. C is better understood, in my opinion, by knowing exactly what it's doing. In this sense it's not exactly a high level language. I find it easier to understand why something is happening than memorize an arbitrary sounding description of behavior. 
For instance: Why are variables declared outside of a procedure that are not initialized set to zero, but not variables inside a procedure?
      This is totally because those unitialized variables get stored in the .bss section, where they are kept as a list of names with a total size, until the OS loads your file, when it zeros out all the now allocated space for those variable before handing this off. This way we're not storing a pile of zeros on disk. Variables inside of a procedure are a mirage. They either live in registers while the function runs, or are on the stack for the life of the function. Registers and the program's stack typically have whatever was there before in them, since we just write over the old values in those spaces, or stop keeping track of them on the stack. (We forget they're there, rather than erasing them)
  

      



### *disclaimer* It's really easy to say something incorrect. 
* sometimes something that seems incorrect is not, there is just a missing piece of context
* generalizations are often vaguely incorrect because they obscure details
* watch out for 'always' and 'never'
* watch out for unqualified value statements: x is bad, y is good. We're the best because of 'catch phrase'
* thinking you know the answer to something can block you from finding the real answer, so when you're stuck, go back and check your base assumptions
* everything can be solved by another layer of abstraction except the problem of too many layers of abstraction (This is a quote, I need to find attribution)
* abstraction is leaky
* meaning, best case you need to understand what is being abstracted, worst case you must be able to do the layer below at the drop of a hat
* programming language communites can be very siloed, and have different words for the same thing and the same word for different things
* I am not actually allergic to punctuation, I was exposed to c and unix at an impressionable age
* antipatterns can be antipatterns. They usually have a grain of good device, but the problem with a rule of thumb is that it will not always be true

There are a lot of tutorials out there that go over a lot of basic stuff. There is simply so much 'beginning stuff' that it's hard to get into the actual code/ intermediate beginner stuff...

* I have found myself reading lots of tutorials that never actually get to the point I am at.
* Sometimes the one sentance you need in a reference requires massive detective work to find
* I am coming back to working with asm after + a year and I forgot where the good stuff is, so this time I am storing it here

## In this repo: 
PDFs of worksheets
* These are printable, in black and white unless stated in name of the file.
* Currently I have one for the stack and the registers. These are just simple diagrams so far
* I am working on some that cover various instruction types (These are not up yet)

Once I get a good number of pdfs and .s files I may separate out the pdfs into their own repo
* some markdown drafts of info are also in here
A skeleton file that I am using as scratch right now, while I figure out what directives are ideal is also up there
* I am planning to put some heavily commented examples up there

*****
I am putting a lot of info in the wiki. (Meaning hit the 'wiki' tab above) I am trying to keep the stuff that's more curated other resources over there, and keeping stuff I have made over here. 
## the wiki has:
* info on ARM: family vs architecture, links to manuals
* raspberry pi info/resources 
* rpi operating systems
* a list of assembly language/rpi tutorials organized by what version of the pi they are on
* I plan to put a page for system call reference links, c language links, etc


****
* Currently working on ARM, armv7 (32 bit) with a raspberry pi 3 B, running raspian, and a samsung arm chromebook (snow neptune) with Arch, also armv7.
* I use gcc, gdb, vim, tmux, radare2, various text editors. 
* I also have a side side project looking at powerpc assembly on a ~2004 ibook with a g3
* I have also worked with x86, x64, but am trying to stay focused!

link to 32bit arm:

link to 64 bit arm: 

intel manual link https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf

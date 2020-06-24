# assemblynotes
## notes on assembly language
Still in draft stage!

* Currently working on ARM, armv7 (32 bit) with a raspberry pi 3 B, running raspian, and a samsung arm chromebook (snow neptune) with Arch, also armv7.
* I use gcc, gdb, vim, tmux, radare2, various text editors. 
* I also have a side side project looking at powerpc assembly on a ~2004 ibook with a g3
* I have also worked with x86, x64, but am trying to stay focused!
     


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
* rpi assmebly tutorials online by rpi version
* rpi operating systems
* a list of assembly language/rpi tutorials organized by what version of the pi they are on
* I plan to put a page for system call reference links, c language links, etc
* Some related books I have read


****
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

***
https://en.wikipedia.org/wiki/GNU_Assembler

* gnu gas manual
https://sourceware.org/binutils/docs-2.34/as/index.html

link to 32bit arm:
https://developer.arm.com/docs/ddi0597/g
link to 64 bit arm: 


intel manual link https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-software-developer-instruction-set-reference-manual-325383.pdf

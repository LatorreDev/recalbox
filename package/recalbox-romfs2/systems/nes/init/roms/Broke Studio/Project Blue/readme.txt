Project Blue readme. Recalbox demo version. 
For play on the NES or an NES clone or emulator. 
Project Blue is (c) 2019 Toggle Switch & FrankenGraphics

Table of contents:

0.QUICK INFO
	0.1 Contact
	0.2 Credits
	0.3 Where to Buy
1.Quick Manual
	1.1 Controls
	1.2 Tips & Tricks
	1.3 Powerups
	1.4 Checkpoints
2 Emulator tips and recommendations
	2.1. Emulators in order of recommendation
	2.2 Recommended palettes for fceux and AVS

========================================================================================
0. QUICK INFO:
========================================================================================

0.1 Contact:
============
Follow FrankenGraphics for Project Blue news on twitter & instagram: 
@FrankenGraphics

visit her blog on www.frankengraphics.com


0.2 Credits:
============
Donny Phillips (toggleswitch) - programming, game design, level design, music
Ellen Larsson (frankengraphics) - level design, game design, graphics, intro jingle
M-Tee - illustrations, printed manual text & layout, lore refinement


0.3 Where to Buy:
=================
physical NES versions:
-International version vendor: 		https://www.brokestudio.fr/product-category/nes/
-US version vendor:					https://projectblue.bigcartel.com/

physical Famicom version:			https://firstpressgames.com/collections/project-blue

Digital version:					https://toggleswitch.itch.io/projectblue

Stay tuned for a release on modern consoles.



========================================================================================
1. QUICK MANUAL:
========================================================================================


1.1 Controls:
=============
A - jump
B - shoot
dpad left and right - run
dpad up - climb ladders
Start - pause 


1.2 Tips & Tricks:
==================
-jump height will depend on your running velocity. 
-you can turn and even change direction of movement mid-air. you can even round corners of platforms sometimes this way. 
-Blue can only shoot 2 projectiles at any one time. timing and aim is crucial in more difficult spots. 
-Blue can drop from ladders by pressing jump
-while Blue can't shoot while climbing ladders, he can drop, fire a quick shot, and grab the ladder again by pressing up. 



1.3 Powerups:
=============

Heart Up: 
Fills your hearts and adds an extra heart
Power shots:
gives 30 twice as strong shots. 
Heart:
fills your health up a little
Neo Cent:
collect 100 to gain an extra life


1.4 Checkpoints:
================
There are numerous invisible checkpoints throughout the zones.
However, if you get a Game Over, you will get thrown back to the beginning
of each stage. A new stage is signified by new music, and sometimes new environments. 
In the full version, are be several stages in the same zone. 

Be aware - this game has neither saves, nor passwords! It is designed to be finished
in one sitting. Are you up to the test?





========================================================================================
2. EMULATOR TIPS AND RECOMMENDATIONS
========================================================================================



2.1 Emulators in order of recommendation:
=========================================

While this doesn't affect the Demo, the full
version uses an NES feature not well implemented 
in most emulators for its ending, which causes
cosmetic issues to varying degrees. Specifically,
we set emphasis bits r + g together. This saturates
warm colours while while partially desaturates cold
colours, while having a slight dimming effect overall. 

Since setting two bits, rather than just one or all three
has no precedent in the historic library of NES games, 
emulator developers haven't prioritized the accuracy of this
possibility. As of this date, the relative likeness to the 
real console is largely by chance. 

1.Mesen looks the closest. you can find it here:
Mesen works for linux and windows. 
https://www.mesen.ca/

2.Nintaco looks okay, but is a bit colourful and bright. 
nintaco runs of java and should therefore work on any environment, including mac. 
https://nintaco.com/

3.fceux dims all colours if as all three bits were set.
(you should also change the default palette since it 
looks nowhere close to what you'd expect from an NES)
We list it for its popularity and because its video recording
is more stable than mesen. works on most platforms.

https://ci.appveyor.com/project/zeromus/fceux
(the version on the fceux mainpage hasn't been updated since 2016, 
but the version above is up to date). 

The hardware clone AVS currently has the same problem as fceux, although we've had word on twitter that they're aware
of the problem. 


2.2 Recommended palette patch for fceux and AVS:
================================================
while it doesn't fix the emphasis inaccuracy, 
this helps:

unsaturated-v6 in fceux palette folder is good. 

alternately, you can download this as a good option:

http://www.firebrandx.com/graphics/nespalettes/nespalette-nes-classic-fbx.zip

Read more on
http://www.firebrandx.com/nespalette.html
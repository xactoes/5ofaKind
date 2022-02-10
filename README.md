# 5ofaKind

This is a gameboy clone of the game of yahtzee. It is not finished. It does play though but be aware there are missing features listed below the rest of this text.

Just grab the .gb file from releases if you wish to play this on a gameboy emulator.

You can alternatively build it with the makefile if you so choose. I don't know why you'd want to do this though as I make available the most recent stable .gb file in releases.

~~This game has not been tested on actual hardware of any sort.~~ Game has been tested on some actual hardware. Works as well as it does in an emulator it seems. If you wish to test it on actual hardware, please feel free but I'm not responsible for damage done to the hardware (although I'd be surprised and incredibly curious how it the damage came to be).

That said, if you do test it, feel free to contact me about bugs and I'll try to fix them.

![5-of-a-Kind-0 90 00-220210-112929](https://user-images.githubusercontent.com/97451908/153441723-9ea8c3f8-b52f-4178-9a71-521e3ada924c.png)
![5-of-a-Kind-0 90 00-220210-112950](https://user-images.githubusercontent.com/97451908/153441751-7ec6640f-1856-415f-800c-9dc5b77d8c10.png)
![5-of-a-Kind-0 90 00-220210-112955](https://user-images.githubusercontent.com/97451908/153441754-a6427cda-97a2-4683-94e6-242cc19db0cc.png)
![5-of-a-Kind-0 90 00-220210-113115](https://user-images.githubusercontent.com/97451908/153441770-bccd0bf8-4a00-4a07-9b43-17529904c87b.png)
![5-of-a-Kind-0 90 00-220210-113249](https://user-images.githubusercontent.com/97451908/153441775-4c1e5aa1-1564-4f1e-aa70-484a6205230f.png)
![5-of-a-Kind-0 90 00-220210-113258](https://user-images.githubusercontent.com/97451908/153441777-b1935b11-33ce-4622-bbf3-f6335090afec.png)
![5-of-a-Kind-0 90 00-220210-113419](https://user-images.githubusercontent.com/97451908/153441790-b24aeaba-dc22-48f1-86ee-7a47fdb962a7.png)
![5-of-a-Kind-0 90 00-220210-113421](https://user-images.githubusercontent.com/97451908/153441791-8e826bde-22d6-4a98-9d00-4067d2f79fd4.png)

KNOWN BUGS:
* if the last turn ended with bonus 5 of a kind and that the bonus 5 of a kind wasn't determined to be eligible for scoring,the end screen doesn't show correctly, and it doesn't transition into a new game properly
* link transfer on title freezes the game
MISSING FEATURES:
* ~~splash screen (no splash will be done, title screen is good enough for what the splash was meant to accomplish)~~
* ~~title screen~~
* audio settings under options
* reset savegame under options
* a screen saying link transfer isn't implemented yet if link transfer is selected
* audio to play when dice are rolling
* audio to play when dice cannot be rolled or hold and card are inaccessible
* a start menu with info on how to play the game
* a quit option in the start menu
* ~~saving of high scores~~
* background music
* ~~player name entry up to 8 characters~~
* potential other features that are implemented but borked and I haven't realized yet

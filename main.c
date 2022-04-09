/*
Finished in M04:
monkeys and bullets implemented and
spritesheet updated. 
gravity and jump functioning properly.
Pause screen with parallax screen.
player and other spritesheet art done.
game sound implemented
two sounds play simultaneously.
animated player and monkey sprites.
random placement for monkeys.
monkeys spread out to four sections.
cheat implemented.
cheat: press b in pause screen.

Bug found:
Parallax screen in pause screen color
doesn't function properly.

How to play the game:
left right to move
A to jump

Win: get the flower
Lose: didn't get the flower in time
*/



#include "myLib.h"
#include "game.h"
#include "preGame1.h"
#include "start.h"
#include "instructions1.h"
#include "instructions2.h"
#include "pause1.h"
#include "pause2.h"
#include "pausebackground.h"
#include "win.h"
#include "lose.h"
#include "sound.h"

// sound.h files
#include "MokokoVillage.h"
#include "startSong.h"
#include "loseSound.h"
#include "winSound.h"


// Prototypes
void initialize();
void goToStart();
void start();
void goToInstructions1();
void instructions1();
void goToInstructions2();
void instructions2();
void goToGame();
void game();
void goToPause();
void pause();
void goToLose();
void lose();
void goToWin();
void win();

// States
enum {START, INSTRUCTIONS1, INSTRUCTIONS2, GAME, PAUSE, LOSE, WIN};
int state;
int option;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case INSTRUCTIONS1:
                instructions1();
                break;
            case INSTRUCTIONS2:
                instructions2();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case LOSE:
                lose();
                break;
            case WIN:
                win();
                break;
        }
               
    }
}

// Sets up GBA
void initialize() {

    // Set up the display
    // Enable background
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE | BG1_ENABLE;

    // set up sounds and interrupt
    setupSounds();
	setupInterrupts();

    // Set up the first state
    goToStart();
    
}

// Sets up the start state
void goToStart() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, startPal, PALETTE, startPalLen / 2);
	DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
	DMANow(3, startMap, &SCREENBLOCK[28], startMapLen / 2);

    hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 256);

    stopSound();
    playSoundA(startSong_data, startSong_length, 1);

    seed = 0;

    state = START;

}

// Runs start state
void start() {
    waitForVBlank();
    seed++;

    if (BUTTON_PRESSED(BUTTON_START)) {
        srand(seed);
        // sound control
        stopSound();
		playSoundB(MokokoVillage_data, MokokoVillage_length, 1);


        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions1();
    }
}

void goToInstructions1() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, instructions1Pal, PALETTE, instructions1PalLen / 2);
	DMANow(3, instructions1Tiles, &CHARBLOCK[0], instructions1TilesLen / 2);
	DMANow(3, instructions1Map, &SCREENBLOCK[28], instructions1MapLen / 2);

    hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 256);

    state = INSTRUCTIONS1;
}

void instructions1() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions2();
    }
}

void goToInstructions2() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, instructions2Pal, PALETTE, instructions2PalLen / 2);
	DMANow(3, instructions2Tiles, &CHARBLOCK[0], instructions2TilesLen / 2);
	DMANow(3, instructions2Map, &SCREENBLOCK[28], instructions2MapLen / 2);

    hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 256);

    state = INSTRUCTIONS2;
}

void instructions2() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToStart();
    }
}

// Sets up the game state
void goToGame() {

    state = GAME;
}

// Runs every frame of the game state
void game() {

    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        // sound control
        pauseSound();

        goToPause();

    } else if (timer > 1000) {
        // sound control
        stopSound();
        playSoundA(loseSound_data, loseSound_length, 0);

        goToLose();
    } else if (winner) {
        // sound control
        stopSound();
        playSoundA(winSound_data, winSound_length, 0);

        goToWin();
    }
}

void goToPause() {


    // pause background parallax movement
    REG_BG1CNT = BG_SIZE_WIDE | BG_8BPP | BG_CHARBLOCK(1) | BG_SCREENBLOCK(29);
    DMANow(3, pausebackgroundPal, PALETTE, pausebackgroundPalLen / 2);
	DMANow(3, pausebackgroundTiles, &CHARBLOCK[1], pausebackgroundTilesLen / 2);
	DMANow(3, pausebackgroundMap, &SCREENBLOCK[29], pausebackgroundMapLen / 2);

    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, pause1Pal, PALETTE, pause1PalLen / 2);
	DMANow(3, pause1Tiles, &CHARBLOCK[0], pause1TilesLen / 2);
	DMANow(3, pause1Map, &SCREENBLOCK[28], pause1MapLen / 2);

    hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 256);


    option = 1;

    state = PAUSE;

}

void pause() {
    waitForVBlank();

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;

    if (BUTTON_PRESSED(BUTTON_UP)) {
        DMANow(3, pause1Pal, PALETTE, pause1PalLen / 2);
        DMANow(3, pause1Tiles, &CHARBLOCK[0], pause1TilesLen / 2);
        DMANow(3, pause1Map, &SCREENBLOCK[28], pause1MapLen / 2);

        // Resume Game
        option = 1;

    }

    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        DMANow(3, pause2Pal, PALETTE, pause2PalLen / 2);
        DMANow(3, pause2Tiles, &CHARBLOCK[0], pause2TilesLen / 2);
        DMANow(3, pause2Map, &SCREENBLOCK[28], pause2MapLen / 2);

        // Go to main menu
        option = 0;

    }

    if (BUTTON_PRESSED(BUTTON_B)) {
        cheatOn = 1;
    }

    if (option && (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A))) {
        // sound control
        unpauseSound();

        goToGame();
    }

    if ((!option) && (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_A))) {
        goToStart();
    }

    // if ((hOff + 1) <= 480) {
    //     hOff++;
    // } else {
    //     hOff = 0;
    // }
    hOff++;

}

void goToLose() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);

    hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 256);

    state = LOSE;
}

void lose() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);

    hideSprites();
	waitForVBlank();
	DMANow(3, shadowOAM, OAM, 256);

    state = WIN;
}

void win() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
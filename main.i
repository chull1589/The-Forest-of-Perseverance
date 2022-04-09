# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 30 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();


typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int active;
    int inv;


    int velocity;
    int jumpTimer;
} ANISPRITE;




typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 178 "myLib.h"
void hideSprites();
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 213 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 289 "myLib.h"
typedef void (*ihp)(void);
# 310 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 31 "main.c" 2
# 1 "game.h" 1
# 14 "game.h"
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern ANISPRITE monkey[5];
extern ANISPRITE bullets[5];
extern ANISPRITE flower;
extern int timer;
extern int winner;
extern int jumptimer;
extern int grav;
extern int invtimer;
extern int canJump;
extern int cheatOn;
extern int tempnum;
extern int clockState;


void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void initFlower();
void updateFlower();
void drawFlower();
void initMonkey();
void animateMonkey();
void drawMonkey();
void initBullets();
void updateBullets();
void drawBullets();
void drawClock();
# 32 "main.c" 2
# 1 "preGame1.h" 1
# 22 "preGame1.h"
extern const unsigned short preGame1Tiles[1472];


extern const unsigned short preGame1Map[1024];


extern const unsigned short preGame1Pal[256];
# 33 "main.c" 2
# 1 "start.h" 1
# 22 "start.h"
extern const unsigned short startTiles[19232];


extern const unsigned short startMap[1024];


extern const unsigned short startPal[256];
# 34 "main.c" 2
# 1 "instructions1.h" 1
# 22 "instructions1.h"
extern const unsigned short instructions1Tiles[14080];


extern const unsigned short instructions1Map[1024];


extern const unsigned short instructions1Pal[256];
# 35 "main.c" 2
# 1 "instructions2.h" 1
# 22 "instructions2.h"
extern const unsigned short instructions2Tiles[8864];


extern const unsigned short instructions2Map[1024];


extern const unsigned short instructions2Pal[256];
# 36 "main.c" 2
# 1 "pause1.h" 1
# 22 "pause1.h"
extern const unsigned short pause1Tiles[7584];


extern const unsigned short pause1Map[1024];


extern const unsigned short pause1Pal[256];
# 37 "main.c" 2
# 1 "pause2.h" 1
# 22 "pause2.h"
extern const unsigned short pause2Tiles[7584];


extern const unsigned short pause2Map[1024];


extern const unsigned short pause2Pal[256];
# 38 "main.c" 2
# 1 "pausebackground.h" 1
# 22 "pausebackground.h"
extern const unsigned short pausebackgroundTiles[2496];


extern const unsigned short pausebackgroundMap[2048];


extern const unsigned short pausebackgroundPal[256];
# 39 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[8064];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 40 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[8000];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 41 "main.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void pauseSoundA();
void pauseSoundB();
void unpauseSoundA();
void unpauseSoundB();
void unpauseSound();
void stopSound();
# 53 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 42 "main.c" 2


# 1 "MokokoVillage.h" 1


extern const unsigned int MokokoVillage_sampleRate;
extern const unsigned int MokokoVillage_length;
extern const signed char MokokoVillage_data[];
# 45 "main.c" 2
# 1 "startSong.h" 1


extern const unsigned int startSong_sampleRate;
extern const unsigned int startSong_length;
extern const signed char startSong_data[];
# 46 "main.c" 2
# 1 "loseSound.h" 1


extern const unsigned int loseSound_sampleRate;
extern const unsigned int loseSound_length;
extern const signed char loseSound_data[];
# 47 "main.c" 2
# 1 "winSound.h" 1


extern const unsigned int winSound_sampleRate;
extern const unsigned int winSound_length;
extern const signed char winSound_data[];
# 48 "main.c" 2



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


enum {START, INSTRUCTIONS1, INSTRUCTIONS2, GAME, PAUSE, LOSE, WIN};
int state;
int option;


unsigned short buttons;
unsigned short oldButtons;


int seed;

int main() {

    initialize();

    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {



    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12) | (1<<9);


    setupSounds();
 setupInterrupts();


    goToStart();

}


void goToStart() {
    (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
    DMANow(3, startPal, ((unsigned short *)0x5000000), 512 / 2);
 DMANow(3, startTiles, &((charblock *)0x6000000)[0], 38464 / 2);
 DMANow(3, startMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
 waitForVBlank();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);

    stopSound();
    playSoundA(startSong_data, startSong_length, 1);

    seed = 0;

    state = START;

}


void start() {
    waitForVBlank();
    seed++;

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        srand(seed);

        stopSound();
  playSoundB(MokokoVillage_data, MokokoVillage_length, 1);


        goToGame();
        initGame();
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToInstructions1();
    }
}

void goToInstructions1() {
    (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
    DMANow(3, instructions1Pal, ((unsigned short *)0x5000000), 512 / 2);
 DMANow(3, instructions1Tiles, &((charblock *)0x6000000)[0], 28160 / 2);
 DMANow(3, instructions1Map, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
 waitForVBlank();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);

    state = INSTRUCTIONS1;
}

void instructions1() {
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToInstructions2();
    }
}

void goToInstructions2() {
    (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
    DMANow(3, instructions2Pal, ((unsigned short *)0x5000000), 512 / 2);
 DMANow(3, instructions2Tiles, &((charblock *)0x6000000)[0], 17728 / 2);
 DMANow(3, instructions2Map, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
 waitForVBlank();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);

    state = INSTRUCTIONS2;
}

void instructions2() {
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        goToStart();
    }
}


void goToGame() {

    state = GAME;
}


void game() {

    updateGame();
    drawGame();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {

        pauseSound();

        goToPause();

    } else if (timer > 1000) {

        stopSound();
        playSoundA(loseSound_data, loseSound_length, 0);

        goToLose();
    } else if (winner) {

        stopSound();
        playSoundA(winSound_data, winSound_length, 0);

        goToWin();
    }
}

void goToPause() {



    (*(volatile unsigned short*)0x400000A) = (1<<14) | (1<<7) | ((1)<<2) | ((29)<<8);
    DMANow(3, pausebackgroundPal, ((unsigned short *)0x5000000), 512 / 2);
 DMANow(3, pausebackgroundTiles, &((charblock *)0x6000000)[1], 4992 / 2);
 DMANow(3, pausebackgroundMap, &((screenblock *)0x6000000)[29], 4096 / 2);

    (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
    DMANow(3, pause1Pal, ((unsigned short *)0x5000000), 512 / 2);
 DMANow(3, pause1Tiles, &((charblock *)0x6000000)[0], 15168 / 2);
 DMANow(3, pause1Map, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
 waitForVBlank();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);


    option = 1;

    state = PAUSE;

}

void pause() {
    waitForVBlank();

    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
        DMANow(3, pause1Pal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, pause1Tiles, &((charblock *)0x6000000)[0], 15168 / 2);
        DMANow(3, pause1Map, &((screenblock *)0x6000000)[28], 2048 / 2);


        option = 1;

    }

    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
        DMANow(3, pause2Pal, ((unsigned short *)0x5000000), 512 / 2);
        DMANow(3, pause2Tiles, &((charblock *)0x6000000)[0], 15168 / 2);
        DMANow(3, pause2Map, &((screenblock *)0x6000000)[28], 2048 / 2);


        option = 0;

    }

    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        cheatOn = 1;
    }

    if (option && ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) || (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))))) {

        unpauseSound();

        goToGame();
    }

    if ((!option) && ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) || (!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))))) {
        goToStart();
    }






    hOff++;

}

void goToLose() {
    (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 16000 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
 waitForVBlank();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);

    state = LOSE;
}

void lose() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

void goToWin() {
    (*(volatile unsigned short*)0x4000008) = (0<<14) | (1<<7) | ((0)<<2) | ((28)<<8);
    DMANow(3, winPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 16128 / 2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
 waitForVBlank();
 DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 256);

    state = WIN;
}

void win() {
    waitForVBlank();
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToStart();
    }
}

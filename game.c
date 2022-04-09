#include "math.h"
#include "myLib.h"
#include "game.h"
#include "gamescreen1.h"
#include "playerspritesheet.h"
#include "collisionmap1.h"
#include "sound.h"
#include "hitSound.h"


// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE player;
ANISPRITE monkey[MONKEYCOUNT];
ANISPRITE bullets[BULLETCOUNT];
ANISPRITE flower;
int timer;
int winner;
int jumptimer;
int grav;
int invtimer;
int canJump;
int cheatOn;
int tempnum;
int clockState;

// player animation states for aniState
enum {RIGHT, LEFT, IDLE};

// Initialize the game
void initGame() {
    // DMA sprite
    DMANow(3, playerspritesheetPal, SPRITEPALETTE, playerspritesheetPalLen / 2);
    DMANow(3, playerspritesheetTiles, &CHARBLOCK[4], playerspritesheetTilesLen / 2);

	// Place screen on map
    // vOff = 352;
    // hOff = 0;

    grav = 1;
    timer = 0;
    winner = 0;
    jumptimer = 0;
    invtimer = 0;
    canJump = 1;
    cheatOn = 0;
    clockState = 0;

    initPlayer();
    initFlower();
    initMonkey();
    initBullets();
    
}

// Updates the game each frame
void updateGame() {

	updatePlayer();
    updateFlower();
    updateBullets();
    animateMonkey();
    drawGame();
}

// Draws the game each frame
void drawGame() {
    REG_BG0CNT = BG_SIZE_SMALL | BG_8BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, gamescreen1Pal, PALETTE, gamescreen1PalLen / 2);
    DMANow(3, gamescreen1Tiles, &CHARBLOCK[0], gamescreen1TilesLen / 2);
    DMANow(3, gamescreen1Map, &SCREENBLOCK[28], gamescreen1MapLen / 2);
    

    drawPlayer();
    drawFlower();
    drawMonkey();
    drawBullets();
    drawClock();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 256);

    // REG_BG0HOFF = hOff;
    // REG_BG0VOFF = vOff;

}

// Initialize the player
void initPlayer() {

    player.width = 8;
    player.height = 16;
    player.rdel = 0;
    player.cdel = 1;
    player.worldRow = 135;
    player.worldCol = 3;
    player.aniCounter = 0;
    player.curFrame = 0;
    player.numFrames = 3;
    player.aniState = RIGHT;
    player.active = 1;
    player.inv = 0;
}

// Handle every-frame actions of the player
void updatePlayer() {

    // Update to include complex camera movement
    // Update to include collision map

    // player invincible timer setup
    if (player.inv && invtimer < 10) {
        invtimer++;
        
    }
    // when time is up, reset the timer to 0
    if (invtimer >= 10) {
        player.inv = 0;
        invtimer = 0;
    }

    timer++;

    unsigned char* collisionmap = (unsigned char *) collisionmap1Bitmap;

    if (collisionmap[OFFSET(player.worldCol, player.worldRow + player.height - 1  
            - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
        && collisionmap[OFFSET(player.worldCol + player.width - 1,  player.worldRow + player.height - 1 
            - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
            // checking the middle of sprite
        && collisionmap[OFFSET(player.worldCol + player.width - 1,  player.worldRow + player.height/2 - 1 
            - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
        ) {

        // using acceleration to update the players velocity
        if (player.velocity > -50)
            player.velocity = (int) player.velocity + (GRAVITY * GRAVITYFACTOR);

        // prevents player from being able to multi jump (don't use if this is intended behavior)
        canJump = 0;
        
        // applies current velocity to players position -- implement complex movement vertically if needed
        if (collisionmap[OFFSET(player.worldCol, player.worldRow + player.height - 1
                - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol + player.width - 1, player.worldRow + player.height - 1
                 - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol + player.width / 2 - 1, player.worldRow + player.height - 1
                 - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]) {
            
            player.worldRow = (int) player.worldRow - round(player.velocity * GRAVITYFACTOR);

            // if ((vOff - 1 >= 0) && ((player.worldRow - vOff) <= (SCREENHEIGHT / 2))
            //     || ((vOff + 1) < (MAPHEIGHT - SCREENHEIGHT)) && ((player.worldRow - vOff) > (SCREENHEIGHT / 2))) {

            //     vOff = vOff - (int) round(player.velocity * GRAVITYFACTOR);
            // }

        }
        

    } else if (!(player.worldRow > 0 // checking for compliment to check for collision
            && (collisionmap[OFFSET(player.worldCol, player.worldRow - player.rdel, MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol + player.width - 1, player.worldRow - player.rdel, MAPWIDTH)]
            // checking the middle of sprite
            && collisionmap[OFFSET(player.worldCol + player.width/2 - 1, player.worldRow - player.rdel, MAPWIDTH)]
        ))) {

            canJump = 0;
    } else {
        
        player.velocity = 0; // grounds player if player is on ground
        canJump = 1;         // allows player to jump
    }

    // checking ABOVE for collisions, keeps player from jumping through objects above it
    // if player collides with something above, set velocity to 0
    if (!(player.worldRow > 0 // checking for compliment to check for collision
            && (collisionmap[OFFSET(player.worldCol, player.worldRow - player.rdel, MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol + player.width - 1, player.worldRow - player.rdel, MAPWIDTH)]
            // checking the middle of sprite
            && collisionmap[OFFSET(player.worldCol + player.width/2 - 1, player.worldRow - player.rdel, MAPWIDTH)]
        ))) {

            player.velocity = 0; // causes player to fall back to ground
            player.worldRow++;   // keeps player from getting stuck in ceiling
    }

    if (BUTTON_HELD(BUTTON_LEFT)) {
        if (player.worldCol - 1 >= 0
            && collisionmap[OFFSET(player.worldCol - 1, player.worldRow 
                - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol - 1, player.worldRow + player.height - 2 
                - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol - 1, player.worldRow + player.height / 2 - 1
                - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]) {
            
            player.worldCol = player.worldCol - player.cdel;

        }
        player.aniState = LEFT;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        if (player.worldCol + player.width + 1 <= MAPWIDTH
            &&collisionmap[OFFSET(player.worldCol + player.width, player.worldRow
                - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol + player.width, player.worldRow + player.height - 2
                - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]
            && collisionmap[OFFSET(player.worldCol + player.width, player.worldRow + player.height / 2 - 1
                - (int) round(player.velocity * GRAVITYFACTOR), MAPWIDTH)]) {
            
            player.worldCol = player.worldCol + player.cdel;

        }
        player.aniState = RIGHT;
    }
    if (BUTTON_HELD(BUTTON_A) && canJump) {
        player.worldRow -= 5;           // keeps player from getting stuck in ground
		player.velocity += JUMPVELOCITY;

        player.jumpTimer = 0;
        
    }
    else if (player.jumpTimer < 6 && BUTTON_PRESSED(BUTTON_A) && !canJump && player.velocity > 0) {
        player.velocity += JUMPHOLDVELOCITY;
        player.jumpTimer++;
    }

    animatePlayer();
}

// Handle player animation states
void animatePlayer() {

    // Set previous state to current state
    player.prevAniState = player.aniState;
    player.aniState = IDLE;

    // Change the animation frame every 20 frames of gameplay
    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    // Control movement and change animation state
    if(BUTTON_HELD(BUTTON_LEFT))
        player.aniState = LEFT;
    if(BUTTON_HELD(BUTTON_RIGHT))
        player.aniState = RIGHT;

    // If the player aniState is idle, frame is player standing
    if (player.aniState == IDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

// Draw the player
void drawPlayer() {
    // player sprites
    shadowOAM[0].attr0 = (ROWMASK & (player.worldRow)) | ATTR0_TALL | ATTR0_8BPP;
    shadowOAM[0].attr1 = (COLMASK & (player.worldCol)) | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.aniState * 2, player.curFrame * 2);
    
}

// initialize flower
void initFlower() {

    flower.width = 16;
    flower.height = 16;
    flower.rdel = 0;
    flower.cdel = 0;
    flower.worldRow = 55;
    flower.worldCol = 16;
    flower.aniCounter = 0;
    flower.curFrame = 0;
    flower.numFrames = 0;
    flower.aniState = RIGHT;
    flower.active = 1;
}

//update flower
void updateFlower() {
    if (collision(player.worldCol, player.worldRow, player.width, player.height, 
            flower.worldCol, flower.worldRow, flower.width, flower.height)) {
        
        winner = 1;
    }
}

// draw flower
void drawFlower() {
    shadowOAM[1].attr0 = (ROWMASK & (flower.worldRow)) | ATTR0_SQUARE | ATTR0_8BPP;
    shadowOAM[1].attr1 = (COLMASK & (flower.worldCol)) | ATTR1_SMALL;
    shadowOAM[1].attr2 = ATTR2_TILEID(8, 0);
}

// init monkeys
void initMonkey() {
    for (int i = 0; i < MONKEYCOUNT; i++) {
        monkey[i].width = 16;
        monkey[i].height = 16;
        monkey[i].rdel = 0;
        monkey[i].cdel = 0;
        if (i <= 1) {
            monkey[i].worldRow = 100 + rand() % 50;
            monkey[i].worldCol = 30 + rand() % 90;
        }
        if (i == 2) {
            monkey[i].worldRow = 100 + rand() % 50;
            monkey[i].worldCol = 120 + rand() % 110;
        }
        if (i == 3) {
            monkey[i].worldRow = 10 + rand() % 70;
            monkey[i].worldCol = 30 + rand() % 90;
        }
        if (i == 4) {
            monkey[i].worldRow = 10 + rand() % 70;
            monkey[i].worldCol = 120 + rand() % 110;
        }
        monkey[i].aniCounter = 0;
        monkey[i].curFrame = 0;
        monkey[i].numFrames = 3;
        monkey[i].aniState = RIGHT;
        monkey[i].active = 0;
    }
}

void animateMonkey() {

    // Change the animation frame every 20 frames of gameplay
    for (int i = 0; i < MONKEYCOUNT; i++){
        if(monkey[i].aniCounter % 20 == 0) {
            monkey[i].curFrame = (monkey[i].curFrame + 1) % monkey[i].numFrames;
        }
        monkey[i].aniCounter++;
    }
}

// draw monkey
void drawMonkey() {
    for (int i = 0; i < MONKEYCOUNT; i++) {
        shadowOAM[2+i].attr0 = (ROWMASK & (monkey[i].worldRow)) | ATTR0_SQUARE | ATTR0_8BPP;
        shadowOAM[2+i].attr1 = (COLMASK & (monkey[i].worldCol)) | ATTR1_SMALL;
        shadowOAM[2+i].attr2 = ATTR2_TILEID(4, monkey[i].curFrame * 2);
    }
}

// init bullets
void initBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        bullets[i].width = 8;
        bullets[i].height = 8;
        bullets[i].rdel = 0;
        bullets[i].cdel = 1;
        bullets[i].worldRow = monkey[i].worldRow + 4;
        bullets[i].worldCol = monkey[i].worldCol + 16;
        bullets[i].aniCounter = 0;
        bullets[i].curFrame = 0;
        bullets[i].numFrames = 0;
        bullets[i].aniState = RIGHT;
        bullets[i].active = 0;
    }
}

//update bullets
void updateBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        if (timer % 40 >= 5) {
            bullets[i].active = 1;
        }
        if (bullets[i].active && timer % 40 > 5) {
            bullets[i].worldCol += bullets[i].cdel;
        }
        if (timer % 40 == 0) {
            bullets[i].active = 0;
            bullets[i].worldCol = monkey[i].worldCol + 16;
        }
    
        if (bullets[i].active && !player.inv && collision(player.worldCol, player.worldRow, player.width, player.height, 
                bullets[i].worldCol, bullets[i].worldRow, bullets[i].width, bullets[i].height)
                && !cheatOn) {

            // hit sound
            playSoundA(hitSound_data, hitSound_length, 0);

            player.inv = 1;

            if (player.aniState == RIGHT) {
                player.worldCol -= 5;
            }
            if (player.aniState == LEFT) {
                player.worldCol += 5;
            }
            
        }
    }
}

//draw bullets
void drawBullets() {
    for (int i = 0; i < BULLETCOUNT; i++) {
        shadowOAM[7+i].attr0 = (ROWMASK & (bullets[i].worldRow)) | ATTR0_SQUARE | ATTR0_8BPP;
        shadowOAM[7+i].attr1 = (COLMASK & (bullets[i].worldCol)) | ATTR1_TINY;
        shadowOAM[7+i].attr2 = ATTR2_TILEID(0, 6);
    }
}

// draw clock
void drawClock() {
    
    if (!(timer % 125)) {
        clockState++;
    }
    
    shadowOAM[12].attr0 = (ROWMASK & (3)) | ATTR0_SQUARE | ATTR0_8BPP;
    shadowOAM[12].attr1 = (COLMASK & (3)) | ATTR1_SMALL;
    shadowOAM[12].attr2 = ATTR2_TILEID(12, clockState);
}
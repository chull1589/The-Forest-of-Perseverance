// Constants
#define MAPHEIGHT 160
#define MAPWIDTH 240
#define MONKEYCOUNT 5
#define BULLETCOUNT 5

// defines gravity strength and player jump strength
#define GRAVITY -32
#define GRAVITYFACTOR 0.1
#define JUMPVELOCITY 40
#define JUMPHOLDVELOCITY 10

// Variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE player;
extern ANISPRITE monkey[MONKEYCOUNT];
extern ANISPRITE bullets[BULLETCOUNT];
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

// Prototypes
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

//{{BLOCK(gamescreen1)

//======================================================================
//
//	gamescreen1, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 580 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 37120 + 2048 = 39680
//
//	Time-stamp: 2021-12-06, 18:57:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN1_H
#define GRIT_GAMESCREEN1_H

#define gamescreen1TilesLen 37120
extern const unsigned short gamescreen1Tiles[18560];

#define gamescreen1MapLen 2048
extern const unsigned short gamescreen1Map[1024];

#define gamescreen1PalLen 512
extern const unsigned short gamescreen1Pal[256];

#endif // GRIT_GAMESCREEN1_H

//}}BLOCK(gamescreen1)

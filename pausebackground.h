
//{{BLOCK(pausebackground)

//======================================================================
//
//	pausebackground, 512x256@8, 
//	+ palette 256 entries, not compressed
//	+ 78 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 4992 + 4096 = 9600
//
//	Time-stamp: 2021-12-07, 14:01:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEBACKGROUND_H
#define GRIT_PAUSEBACKGROUND_H

#define pausebackgroundTilesLen 4992
extern const unsigned short pausebackgroundTiles[2496];

#define pausebackgroundMapLen 4096
extern const unsigned short pausebackgroundMap[2048];

#define pausebackgroundPalLen 512
extern const unsigned short pausebackgroundPal[256];

#endif // GRIT_PAUSEBACKGROUND_H

//}}BLOCK(pausebackground)

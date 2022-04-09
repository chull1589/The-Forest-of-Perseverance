
//{{BLOCK(lose)

//======================================================================
//
//	lose, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 250 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16000 + 2048 = 18560
//
//	Time-stamp: 2021-11-12, 20:50:02
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSE_H
#define GRIT_LOSE_H

#define loseTilesLen 16000
extern const unsigned short loseTiles[8000];

#define loseMapLen 2048
extern const unsigned short loseMap[1024];

#define losePalLen 512
extern const unsigned short losePal[256];

#endif // GRIT_LOSE_H

//}}BLOCK(lose)

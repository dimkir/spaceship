Maxim maxim;
String bgMusicWav = "MysticalCaverns_wav.wav"; // 22 MB!!!
String bgMusicMp3 = "MysticalCaverns_mp3.mp3";
AudioPlayer bgMusic;
void setupSound(){
   maxim = new Maxim(this);
   //bgMusic = maxim.loadFile(bgMusicMp3);
   bgMusic = maxim.loadFile(bgMusicWav);
   bgMusic.play();   
}




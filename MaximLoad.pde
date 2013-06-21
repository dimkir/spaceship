/**
* This class encapsulates operations with sound effects. 
* So far all we want is just load sounds (ambient music and helicopter) and start
* playing them at the start of the sketch. Loop both of the sounds.
*/
class SoundEffects
{
      Maxim maxim;
      
      // filenames for the sounds
      String bgMusicWav = "MysticalCaverns_wav.wav"; // 22 MB!!!
      String bgMusicMp3 = "MysticalCaverns_mp3.mp3"; // Maxim doesn't seem to play MP3
      String helicopterWav = "49481__lorenzosu__helicopterpassage-28sec.wav"; 
      
      
      AudioPlayer bgMusic;
      AudioPlayer helicopterSound;
      
      
      SoundEffects(PApplet sketch){
         setupSound(sketch);
      }
      
      void setupSound(PApplet sketch){

         maxim = new Maxim(sketch);
         //bgMusic = maxim.loadFile(bgMusicMp3);
         println("Please wait...");
         println("Loading background music file: " + bgMusicWav + "..."); 
         bgMusic = maxim.loadFile(bgMusicWav);
         bgMusic.setLooping(true);
         
         println("Loading helicopter sound: " + helicopterWav + "...");
         helicopterSound = maxim.loadFile(helicopterWav);
         helicopterSound.setLooping(true);
         
         
         // start playing both files 
         helicopterSound.play();
         bgMusic.play();   
      }


}




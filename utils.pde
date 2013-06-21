PImage myLoadImage(String imgFile){
  
    if ( C_SKETCHPAD_CC == true ){
       return loadImage(imgFile);
    }
    
    return loadImage(lastPathComponent(imgFile));
}
  
  
/**
* Just chops the path and leaves last components:
* "/static/uploaded_resources/p.8420/Alien-HeavyCruiser-lights-off.png"
*/
String lastPathComponent(String path){
   String[] components = split(path, "/");
   int lastId = components.length - 1;
   return components[lastId];
}  

boolean switchPause(){
       return  !pause;
    }

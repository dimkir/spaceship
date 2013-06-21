class Background
{
   PImage bgImage;
   int xOffset= 0;
   float offsetSpeed = 1.0;
   Background(String fileName){
      bgImage = myLoadImage(fileName);
   }
   
   
   
   void update(){
       xOffset += (int) offsetSpeed;
       xOffset %= bgImage.width; // no point having it higher than the image with
   }
   
   
   /**
   * Speed towards
   */
   void update(float xComponent){
       println("Updating bg: xCOmponent: " + xComponent);
       offsetSpeed = xComponent * 3;
       update();
   }
   
   void draw(){
        imageMode(CORNER);
        rectMode(CORNER);
        
//        image(bgImage, x, 0);
        
        int remainingWidth = bgImage.width - xOffset;
        int frontWidth = -1;
        
        if  ( remainingWidth >= width ){
           remainingWidth = width;
        }
        else { // remainingWidth < width ( we need a bit from front)
          frontWidth = width - remainingWidth;
           
        }
        
        copy(bgImage, xOffset , 0 ,
                      remainingWidth, bgImage.height, 
                      
                      0, 0 , 
                      remainingWidth, bgImage.height
                      );
                
        if ( frontWidth  > 0 ){
           copy(bgImage, 0, 0, frontWidth, bgImage.height,
                          remainingWidth, 0, 
                          frontWidth, bgImage.height);
        }
   }
   
   
   void run(){
      update();
      draw();
   }
}

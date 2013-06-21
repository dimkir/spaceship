// This sketch builds on a prior work, "Animated rectangle moving towards mouse", created by Dimitry K
// http://studio.sketchpad.cc/sp/pad/view/ro.9gEAX1gyCrHr$/rev.903



// This sketch builds on a prior work, "Animated rectangle", created by Dimitry K
// http://studio.sketchpad.cc/sp/pad/view/ro.9IjmZIZ90V50M/rev.2560

/* @pjs preload="/static/uploaded_resources/p.8420/Alien-HeavyCruiser.png"; */

/* @pjs preload="/static/uploaded_resources/p.8420/space_w_600px.jpg"; */
/* @pjs preload="/static/uploaded_resources/p.8420/Alien-HeavyCruiser-lights-yellow.png"; */
/* @pjs preload="/static/uploaded_resources/p.8420/Alien-HeavyCruiser-lights-white.png"; */

/* @pjs preload="/static/uploaded_resources/p.8420/Alien-HeavyCruiser-lights-off.png"; */

/**
 * This is going to be animated rectangle.
 * We model the rectangle by it's location. 
 * And on every loop we update his location.
 * As we don't want to do frame related animation, we
 * will have time parameter.
 * As always we will seal the model of the rectangle in the class.
 */




// declare the arect
AnimatedRectangle arect;

// Sound effects are loaded and managed here
// they need to be loaded in setup()
SoundEffects sfx;


boolean pause;

boolean C_SKETCHPAD_CC = false;

Background bgObject;

// prepare code which is doing initialization of our sketch
void setup() {
  size(800, 600);
  float randomX = random(width);
  float randomY = random(height);
  arect = new AnimatedRectangle(150, height/2, randomX, randomY, 11.0 );
  //bgObject = new Background("360-degree_lg.jpg");
  bgObject = new Background("space-needle-panorama.jpg"); 
  //sfx = new SoundEffects(this);
}// setup




void mousePressed() {
  arect.setDirectionPoint(mouseX, mouseY);
}

void keyPressed() {
  //println("Key pressed");
  //pause = switchPause();
  saveFrame("c:\\tmp\\frame-####.tga");
  
}    


/**
 * Sometimes instead of name draw() i prefer to use somethihg more
 * suggesting the frame-dependent natuer of the draw(). So I do:
 */
void draw() {
  redrawFrameManyTimesPerSecond();
}  

/**
 * Now instead of writing my code in draw(),
 * I write it here. This name of the method 
 * is more suggestive into the fact that
 * this is redrawn many times per second.
 */
void redrawFrameManyTimesPerSecond() {

  if ( pause ) {
    return; // we do nothing
  }
  // also let's add clearing of the screen
  //background(0); // 0 - black
  
  arect.update();
  float xComponent = arect.getXSpeed();
  
  bgObject.update(xComponent);
  
  
  bgObject.draw();
  arect.draw();
  
  
}      


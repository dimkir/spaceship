/**
 * Animates rectnagle.
 */
class  AnimatedRectangle
{

  PVector location;     
  PVector directionPoint; // this is NON-normalized version

  PVector direction;  // this is unit vector defines direction

    float velocity;

  SpaceShip spaceShip;

  //     float velocityX = 0.1f;     
  float velocityX_pixels_per_second =  100.0;     // 0.1 * 1000 = 100px
  float velocityY_pixels_per_second = 2f;  // 0.002f * 1000 = 2

  int savedLastTimeMillis = 0; // we will be checking for 0.


  // i add thouse ".0f" ("f for float) things,
  // to be sure that java doesn't complain 
  // that I am trying to assign integer number to float variable.
  final float C_WIDTH = 100.0f;
  final float C_HEIGHT = 50.0f;

  /**
   * We initialize arect at some position.
   * Caller will be the one responsible.
   */
  AnimatedRectangle(float xx, float yy, float dirX, float dirY, float velocityToHave) {
    setLocation(xx, yy);


    setDirectionPoint(dirX, dirY);

    velocity = velocityToHave;

    spaceShip = new SpaceShip();
  }


  void setLocation(float xx, float yy) {
    if ( location == null) {
      location = new PVector();
    }
    location.set(xx, yy);
  }


  void update() {
    // this is where all fun is happening.
    // first I will try to write client code and see what
    // needs to be written in the body of this method


    // now let's sort time

      int curTimeInMilliseconds = millis();
    float ttime_seconds;  // it has no special value now
    if ( thisIsFirstTimeWeRun() ) {
      // we don't have previous saved time...
      // so "0" units of time has elapsed since.
      // we do not have to update location of the 
      // element yet
      // so we set ttime_seconds to 0
      ttime_seconds = 0.0f;
    }
    else {      
      float passedTimeSinceLastUpdateInMillis = curTimeInMilliseconds - savedLastTimeMillis;

      ttime_seconds = passedTimeSinceLastUpdateInMillis  / 1000.0;
      // we need to do this
    }


    // but I want to calculate speed based on the time elapsed
    velocityX_pixels_per_second = velocity * direction.x;
    velocityY_pixels_per_second = velocity * direction.y;


    float deltaX = velocityX_pixels_per_second * ttime_seconds;
    float deltaY = velocityY_pixels_per_second * ttime_seconds; // i put ttime because
    printDeltas(deltaX, deltaY);
    // popular names like
    // rect time save 
    // are often reserved by processing
    // and adding extra letter may
    // help avoiding conflicts.
    // though i don't think processing has
    // time reserved. but it's a good 
    // practise.

    // now let's sort out velocities                                 

    addToLocation(deltaX, deltaY);

    savedLastTimeMillis  = curTimeInMilliseconds;
  }//update()


  void addToLocation(float dx, float dy) {
    location.x += dx;
    location.y += dy;
  }


  void draw() {
    // here we should render the rect.
    // this should be easy. Just draw rect at location.
    //image(spaceShip, location.x, location.y);

    //drawRectAtPos(location);

    spaceShip.drawShip(location, direction, SpaceShip.LIGHTS_OFF);

    drawDirectionPoint();

    //drawDirectionVector();
  }

                void drawRectAtPos(PVector location) {
                  fill(255);
                  stroke(#FF0000);
                  rect(location.x, location.y, C_WIDTH, C_HEIGHT);
                }     


                /**
                 * Draw direction vector between the object and the destination point.
                 */
                PVector dirMult = new PVector();   
                void drawDirectionVector() {
                  dirMult.set(direction);
                  dirMult.mult(100);
                  lineV(location, directionPoint);
                  stroke(#F7A44B);
              
                  line(0, 0, dirMult.x, dirMult.y); // this just to visualize the direction vector
                }

                void lineV(PVector a, PVector b) {
                  line(a.x, a.y, b.x, b.y);
                }


                void drawDirectionPoint() {
                  ellipse(directionPoint.x, directionPoint.y, 10, 10);
                }


  /**
   * Subtracts current location from the target location
   * and gets directio vector.
   * Assumes that 'location' is initialized and has valid data.
   */
  void setDirectionPoint(float xx, float yy) {
    if ( direction == null ) {
      direction = new PVector();
    }
    if ( directionPoint == null) {
      directionPoint = new PVector();
    }

    directionPoint.set(xx, yy);

    direction.set(xx, yy);
    direction.sub(location);

    direction.normalize();
    // directionPoint is original
  }


  /**
   * This is short
   */
  boolean   thisIsFirstTimeWeRun() {
    if ( savedLastTimeMillis == 0 ) {
      return true;
    }
    else {
      return false;
    }
  }

  void printDeltas(float dx, float dy) {
    //println("Deltas are dx(" + dx + "), dy(" + dy + ")");
  }
  
  
  
  void run(){
     update();
     draw();
  }
  
  
  /**
  * Returns speed of the object in x direciton (or direction?)
  */
  float getXSpeed(){
      return direction.x;
  }  
  
}// class AnimatedRectangle



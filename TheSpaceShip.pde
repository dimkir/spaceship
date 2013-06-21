/**
* Contains code for loading and drawing the spaceship.
*  The spaceship is "verbal" - meaning that it has verbs we need
* in client.
* The SRP says that it only loads/draws the ship (at differnt states)
*/    
class SpaceShip
{
     final static int LIGHTS_OFF = 0;
     final static int LIGHTS_WHITE = 1;
     final static int LIGHTS_YELLOW = 2;
     
     PImage shipYellowLights;
     PImage shipWhiteLights;
     PImage shipNoLights;
     
     
     SpaceShip(){
                 // load all 3 images of three ships.  
            shipYellowLights = myLoadImage("/static/uploaded_resources/p.8420/Alien-HeavyCruiser-lights-yellow.png");      
            
            shipWhiteLights =  myLoadImage("/static/uploaded_resources/p.8420/Alien-HeavyCruiser-lights-white.png");
            
            //shipNoLights =  myLoadImage("/static/uploaded_resources/p.8420/Alien-HeavyCruiser-lights-off.png");
            shipNoLights =  myLoadImage("helicopter_small.png");
            //helicopter_small.png

            
            shipNoLights.resize(150, 0);            
         }
     
     
     void drawShip(PVector location, float angle, int lightStatus){
           pushMatrix();
             translate(location.x, location.y);
             rotate(angle + PI/2); // we add PI/2 to rotate ship another 90deg clockwise (because initial position (on the image) the ship is ponting up 
             drawShipAt00Delegate(lightStatus);             
           popMatrix();
         
         
         }
         
         
     private void drawShipAt00Delegate(int lightStatus){
             drawShipAt00Image(lightStatus);
             //drawShipAt00Rect(lightStatus);
         }
         
         
         
     private void drawShipAt00Rect(int lightStatus){
          rect(0,0, 100,50);
         }
     private void drawShipAt00Image(int lightStatus){
           PImage ship = null;
           switch( lightStatus ){
                 case LIGHTS_OFF:
                     ship = shipNoLights;
                     break;
                 case LIGHTS_WHITE:
                     ship = shipWhiteLights;
                     break;
                 case LIGHTS_YELLOW:
                     ship = shipYellowLights;
                     break;
                default:
                     println("Erorr invalid light status: " + lightStatus);
               }
               
               imageMode(CENTER);
               if ( ship != null){         
                   image(ship, 0, 0);
               }
               rectMode(CENTER);
               noFill();
               stroke(255);
               strokeWeight(2.0);
               rect(0,0, ship.width, ship.height);
         }
     void drawShip(PVector location, PVector direction, int lightStatus){
             drawShip(location, angleOfShip(location, direction), lightStatus);
         }
         
         
     PVector x_axis = new PVector(10, 0); // kinda x-axis
     PVector v = new PVector();
     float angleOfShip(PVector loc, PVector dir){
            v.set(dir);
            //v.sub(loc);
            //return PVector.angleBetween(x_axis, v);
            float angle = atan2(v.y, v.x);
            println("Angle: " + angle);
            return angle;
         }
     
}    


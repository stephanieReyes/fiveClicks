// these variables are for mouse interaction
int xlinePt;
int ylinePt;
int clickCount = 0;

// these variables are for the "signature" in the lower right corner of the screen.
// ( it's a pentagon ( because five clicks...? ) ) 
// 
float numSidesPoly = 5;
float sidePoly = 50;
float anglePoly = 360/numSidesPoly;
float radiusPoly = (sidePoly/2)/tan(radians(anglePoly/2));


void setup() {
  size(displayWidth, displayHeight);
  background(0,0,0);
}

void draw() {
// this sets an endpoint for the lines that are drawn and changes the line color
 if (mousePressed == true ){
   xlinePt = mouseX;
   ylinePt = mouseY;
   strokeWeight(3);
   stroke(255,255,255);
   stroke(random(0,255),255,random(0,255));
// println(clickCount); (for when i was trying to figure out where to put the clickCount)
}

// these are the lines that are drawn
 line(xlinePt,ylinePt,mouseX,mouseY);
 
// every mouse click increases the clickCount counter;
// when the clickCount is 5 (the numbers work out weird so it says 6) the program
// draws a pentagon in the lower right corner and stops looping.
// it sometimes takes six clicks. i can't figure out why it varies.
 
 if (clickCount == 6){
   
// 
// this starts the program i was trying to do to make polygons radially outward with
// triangles. i don't know if i can input pi to avoid using the "radians" function.
// i recycled it for its "for" loop ( for the assignment ).
//    
   
    for(int i = 0; i < numSidesPoly; i++){
      
// pushMatrix is a weird thing that has something to do with layers(? or layer-like
// things.)
     pushMatrix();
    
// move the origin to the pivot point
  translate(width-90, height-100); 

// then pivot the grid
  rotate(radians((i)*(360/numSidesPoly)));

//draw a triangle with one point at the origin
  strokeWeight(3);
  stroke(0,0,0);
  fill(255,255,255);
  triangle(0,0,-sidePoly/2,radiusPoly,sidePoly/2,radiusPoly);
  
// popMatrix is the thing that sets the layer-like things back in order.  
  popMatrix();
 }
 noLoop();
 }
}

//
// interaction code
//

// increases the click counter by one every time "mousePressed" happens.
void mousePressed() {
  clickCount += 1;
}

// from class notes. saves an image of the sketch when 's' or 'S' is pressed.
void keyPressed(){
   // println("pressed"); from class.
    if(key == 's' || key == 'S'){
      
      //saves an image of sketch
      saveFrame("fiveClicks-######.png");
    }
}

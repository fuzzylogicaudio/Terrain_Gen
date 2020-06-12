//import controlP5.*;

//ControlP5 cp5;

//float sliderValue = 0.025;
//Slider abc;

int cols, rows;
int scl = 20;
int w = 1000;
int h = 1000;

float speed = 0.025;
float blue = 255;
float saveSpeed = 0;
boolean pause = false;

float movingVal = 0;

float[][] terrain;

void setup(){
  //size(600, 600, P3D);
  fullScreen(P3D);
  cols = w/scl;
  rows = h/scl;
  terrain = new float [cols][rows];
  //noStroke();
  //cp5 = new ControlP5(this);
  //cp5.addSlider("speedSliderValue")
  //   .setPosition(10,800)
  //   .setSize(100, 200)
  //   .setRange(0.001, 0.099)
  //   .setValue(0.025)
  //   ;
  
  //frameRate(1);
}

void draw(){
  
  movingVal -= speed;
  
  float yoffset = movingVal;
   for(int y = 0; y < rows; y++){
    float xoffset = 0; 
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoffset, yoffset), 0, 1, -100, 100);
      xoffset += map(mouseX, 0, 600, 0.01, 0.9); 
     }
     yoffset += map(mouseY, 0, 600, 0.01, 0.9);
    }
    
  background(0);
  stroke(255, 60);
  //noStroke();
  //noFill(); 
  fill(map(mouseX, 0, 600, 0, 255), map(mouseY, 0, 600, 0, 255), blue, 30);
   translate(width/2, height/2);
   rotateX(PI/3);
   rotateY(PI/50);
   rotateZ(PI/3);
   translate(-w/0.85, -h/1.008, -w/2);
 
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);      
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
}

void mousePressed(){
  speed = map(mouseY, 0, 600, 0.001, 0.099);
  blue = map(mouseY, 0, 600, 0, 255);
}

void mouseDragged(){
  speed = map(mouseY, 0, 600, 0.001, 0.099);
  blue = map(mouseY, 0, 600, 0, 255);
}

void keyPressed(){
  if(key == ENTER){
    pause = !pause;
    if(pause == true){
      saveSpeed = speed;
      speed = 0;
    }
    else if(pause == false){
      speed = saveSpeed;
    }
  }
}

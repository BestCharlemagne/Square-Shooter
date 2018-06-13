float shiftX;
float shiftY;
float shift = 10;
void setup(){
  fullScreen();
  drawFace();
}
void draw(){
  drawFace();
}
void keyPressed() {
  if (key == CODED) {
    if(keyCode == UP) {
      shiftY -= shift;
    }
    if(keyCode == DOWN){
      shiftY+=shift;
    }
    if(keyCode == LEFT){
      shiftX-=shift;
    }
    if(keyCode == RIGHT){
      shiftX+=shift;
    }
  }
  if(key == ' '){
    exit();
  }
}

void drawFace(){
  background(0);
  translate(width/2 + shiftX, height/2 + shiftY);
  fill(#F0E51B);
  ellipse(0,0,600,600);
  fill(0);
  ellipse(-100,-100,50,50);
  strokeWeight(10);
  line(100,-100,50,-90);
  strokeWeight(1);
  arc(0, 70, 300, 300, 0, PI);
}
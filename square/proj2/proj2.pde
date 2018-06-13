void setup(){
  fullScreen();
  translate(width/2, height/2);
  ellipse(0,0,80,80);
}
void draw(){
  if(mousePressed){
    exit();
  }
}
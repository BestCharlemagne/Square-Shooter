int rect1Width = 25;
int rect1Height = 25;
int posx = 0;
int posy = 0;
int offset = 0;
PShape rectTemplate;
int speed = 10;
float distance = 30;
int sizeX = 1000;
int sizeY = 1000;
int difference = 0;
IntList originX = new IntList();
IntList originY = new IntList();
IntList move = new IntList();
IntList moveAsteroids = new IntList();
IntList asteroidX = new IntList();
Boolean isHeld;

ArrayList<PShape> asteroids = new ArrayList();
ArrayList<PShape> rectangles = new ArrayList();

ArrayList<object> realAsteroids = new ArrayList();
ArrayList<object> realRectangles = new ArrayList();
 
void setup() {
  background(0, 255, 255);
  size(1000, 1000);
  rectMode(CENTER);
  translate(width/2, height/2);
  rect(posx, posy, rect1Width, rect1Height);
  noCursor();
  print("Hi Ericka");
 

} 

void mousePressed() {
  isHeld = true;
  rectTemplate = createShape(RECT, 0, 0, 25, 25);
  rectangles.add(rectTemplate);
  originX.append(mouseX);
  originY.append(mouseY);
  move.append(0);
}

void mouseReleased(){
}


void draw() {
  float second = millis();
  distance = abs(25*sin(.05*((PI*PI*2*second)/180)));
  print("\n");
  print(distance);
  
  background(0, 255, 255);
  fallAsteroids();
  //translate(width/2,height/2);
  rect(mouseX+distance, mouseY+distance, rect1Width, rect1Height);
  rect(mouseX-distance, mouseY-distance, rect1Width, rect1Height);
  rect(mouseX+distance, mouseY-distance, rect1Width, rect1Height);
  rect(mouseX-distance, mouseY+distance, rect1Width, rect1Height);
  //rect(distance, distance, rect1Width, rect1Height);
  shoot();
}

void shoot(){
    if (rectangles.size() > 0) {
      for (int i = 0; i < rectangles.size(); i++) {
        move.set(i, move.get(i)+10);
        shape(rectangles.get(i), originX.get(i), originY.get(i) - move.get(i));
        print("\n");
        print(move.size());
          if(originY.get(i) - move.get(i) < 0){
            move.remove(i);
            rectangles.remove(i);
            originX.remove(i);
            originY.remove(i);
          }
      }
  }
}

void fallAsteroids(){
    if(millis() % 99 == 0){
      if(second() % 1 ==0){
      object asteroidTemplate = new object(random(-width+50,width+50),0,40,20,"asteroid");
      realAsteroids.add(asteroidTemplate);
      PShape asteroidThing = createShape(ELLIPSE,asteroidTemplate.X,asteroidTemplate.Y, asteroidTemplate.dimensX, asteroidTemplate.dimensY);
      asteroids.add(asteroidThing);

      }
    }
      for(int i = 0; i < asteroids.size(); i++){
              realAsteroids.get(i).Y += 5;
              shape(asteroids.get(i), realAsteroids.get(i).X, realAsteroids.get(i).Y);
      }
}

import peasy.*;

PeasyCam cam;
Cube cube;

int speed = 60;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 100);
  cube = new Cube(4);
}

void draw() {
  background(31);
  cube.show();
  if (cube.move == null) {
    cube.move = new Move(int(random(3)), int(random(cube.size)), int(random(2)) == 0, speed);
  }
}

//void keyPressed() {
//  if (cube.move == null) {
//    cube.move = new Move(2, 0, true, speed);
//  }
//}

import peasy.*;

PeasyCam cam;
Cube cube;

void setup() {
  size(600, 600, P3D);
  cam = new PeasyCam(this, 100);
  cube = new Cube(3, 5, 60);
}

void draw() {
  background(31);
  cube.show();
  if (!cube.isMoving()) {
    cube.move(int(random(3)), int(random(cube.size)), int(random(2)) == 0);
  }
}

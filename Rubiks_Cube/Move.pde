class Move {
  int axis;
  int layer;
  boolean dir;
  int d;
  float step;
  float rotation;
  boolean finished = false;
  
  Move(int axis, int layer, boolean dir, int steps) {
    rotation = 0;
    this.axis = axis;
    this.layer = layer;
    this.dir = dir;
    d = dir ? 1 : -1;
    step = PI/(2*steps);
  }
  
  boolean isRotating(int x, int y, int z) {
    if (axis == 0) {
      return x == layer;
    } else if (axis == 1) {
      return y == layer;
    } else {
      return z == layer;
    }
  }
  
  void update() {
    rotation += step * d;
    if (abs(rotation) >= PI / 2) {
      finished = true;
    }
  }
}

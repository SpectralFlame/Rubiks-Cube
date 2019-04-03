int U = 0;
int D = 1;
int L = 2;
int R = 3;
int F = 4;
int B = 5;

class Piece {
  
  color[] colors;
  
  Piece() {
    colors = new color[] {
      color(255), // up
      color(255, 255, 0), // down
      color(255, 128, 0), // left
      color(255, 0, 0), // right
      color(0, 255, 0), // front
      color(0, 0, 255) // back
    };
  }
  
  void rotate(int axis, boolean dir) {
    if (axis == 0) {
      if (dir) {
        color temp = colors[U];
        colors[U] = colors[F];
        colors[F] = colors[D];
        colors[D] = colors[B];
        colors[B] = temp;
      } else {
        color temp = colors[U];
        colors[U] = colors[B];
        colors[B] = colors[D];
        colors[D] = colors[F];
        colors[F] = temp;
      }
    } else if (axis == 1) {
      if (dir) {
        color temp = colors[F];
        colors[F] = colors[L];
        colors[L] = colors[B];
        colors[B] = colors[R];
        colors[R] = temp;
      } else {
        color temp = colors[F];
        colors[F] = colors[R];
        colors[R] = colors[B];
        colors[B] = colors[L];
        colors[L] = temp;
      }
    } else {
      if (dir) {
        color temp = colors[U];
        colors[U] = colors[L];
        colors[L] = colors[D];
        colors[D] = colors[R];
        colors[R] = temp;
      } else {
        color temp = colors[U];
        colors[U] = colors[R];
        colors[R] = colors[D];
        colors[D] = colors[L];
        colors[L] = temp;
      }
    }
  }
  
  void show(float r) {
    stroke(0);
    beginShape(QUAD);
    fill(colors[U]); // up
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, -r, r);
    vertex(-r, -r, r);
    
    fill(colors[D]); // down
    vertex(-r, r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(-r, r, r);
    
    fill(colors[L]); // left
    vertex(-r, -r, -r);
    vertex(-r, -r, r);
    vertex(-r, r, r);
    vertex(-r, r, -r);
    
    fill(colors[R]); // right
    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(r, r, r);
    vertex(r, -r, r);
    
    fill(colors[F]); // front
    vertex(-r, -r, r);
    vertex(r, -r, r);
    vertex(r, r, r);
    vertex(-r, r, r);
    
    fill(colors[B]); // back
    vertex(-r, -r, -r);
    vertex(r, -r, -r);
    vertex(r, r, -r);
    vertex(-r, r, -r);
    endShape();
  }
}

int U = 0;
int D = 1;
int L = 2;
int R = 3;
int F = 4;
int B = 5;

class Piece {

  Integer[] colors;

  Piece(int x, int y, int z, int size) {
    colors = new Integer[] {
      color(255), // up
      color(255, 255, 0), // down
      color(255, 128, 0), // left
      color(255, 0, 0), // right
      color(0, 255, 0), // front
      color(0, 0, 255) // back
    };
    if (y != 0) {
      colors[U] = null;
    } 
    if (y != size - 1) {
      colors[D] = null;
    }
    if (x != 0) {
      colors[L] = null;
    }
    if (x != size - 1) {
      colors[R] = null;
    }
    if (z != 0) {
      colors[B] = null;
    }
    if (z != size - 1) {
      colors[F] = null;
    }
  }

  void rotate(int axis, boolean dir) {
    if (axis == 0) {
      if (dir) {
        Integer temp = colors[U];
        colors[U] = colors[F];
        colors[F] = colors[D];
        colors[D] = colors[B];
        colors[B] = temp;
      } else {
        Integer temp = colors[U];
        colors[U] = colors[B];
        colors[B] = colors[D];
        colors[D] = colors[F];
        colors[F] = temp;
      }
    } else if (axis == 1) {
      if (dir) {
        Integer temp = colors[F];
        colors[F] = colors[L];
        colors[L] = colors[B];
        colors[B] = colors[R];
        colors[R] = temp;
      } else {
        Integer temp = colors[F];
        colors[F] = colors[R];
        colors[R] = colors[B];
        colors[B] = colors[L];
        colors[L] = temp;
      }
    } else {
      if (dir) {
        Integer temp = colors[U];
        colors[U] = colors[L];
        colors[L] = colors[D];
        colors[D] = colors[R];
        colors[R] = temp;
      } else {
        Integer temp = colors[U];
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
    if (colors[U] != null) {
      fill(colors[U]);
      vertex(-r, -r, -r);
      vertex(r, -r, -r);
      vertex(r, -r, r);
      vertex(-r, -r, r);
    }
    if (colors[D] != null) {
      fill(colors[D]);
      vertex(-r, r, -r);
      vertex(r, r, -r);
      vertex(r, r, r);
      vertex(-r, r, r);
    }
    if (colors[L] != null) {
      fill(colors[L]);
      vertex(-r, -r, -r);
      vertex(-r, -r, r);
      vertex(-r, r, r);
      vertex(-r, r, -r);
    }
    if (colors[R] != null) {
      fill(colors[R]);
      vertex(r, -r, -r);
      vertex(r, r, -r);
      vertex(r, r, r);
      vertex(r, -r, r);
    }
    if (colors[F] != null) {
      fill(colors[F]);
      vertex(-r, -r, r);
      vertex(r, -r, r);
      vertex(r, r, r);
      vertex(-r, r, r);
    }
    if (colors[B] != null) {
      fill(colors[B]);
      vertex(-r, -r, -r);
      vertex(r, -r, -r);
      vertex(r, r, -r);
      vertex(-r, r, -r);
    }
    endShape();
  }
}

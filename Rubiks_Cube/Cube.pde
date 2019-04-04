class Cube {
  Piece[][][] pieces;
  int size;
  float s;
  int speed;
  private Move move = null;

  Cube(int size, float s, int speed) {
    this.size = size;
    this.s = s;
    this.speed = speed;
    pieces = new Piece[size][size][size];
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        for (int z = 0; z < size; z++) {
          if (x == 0 || x == size - 1 || y == 0 || y == size - 1 || z == 0 || z == size - 1) {
            pieces[x][y][z] = new Piece(x, y, z, size);
          }
        }
      }
    }
  }

  void rotate(int axis, int layer, boolean dir) {
    Piece[][] temp = new Piece[size][size];
    // rotate into temp
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (axis == 0) { // x
          if (dir) {
            temp[size-j-1][i] = pieces[layer][i][j];
          } else {
            temp[j][size-i-1] = pieces[layer][i][j];
          }
        } else if (axis == 1) { // y
          if (dir) {
            temp[j][size-i-1] = pieces[i][layer][j];
          } else {
            temp[size-j-1][i] = pieces[i][layer][j];
          }
        } else { // z
          if (dir) {
            temp[size-j-1][i] = pieces[i][j][layer];
          } else {
            temp[j][size-i-1] = pieces[i][j][layer];
          }
        }
      }
    }
    // copy temp into pieces
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (temp[i][j] != null) {
          temp[i][j].rotate(axis, dir);
        }
        if (axis == 0) {
          pieces[layer][i][j] = temp[i][j];
        } else if (axis == 1) {
          pieces[i][layer][j] = temp[i][j];
        } else {
          pieces[i][j][layer] = temp[i][j];
        }
      }
    }
  }

  boolean isMoving() {
    return move != null;
  }

  void move(int axis, int layer, boolean dir) {
    move = new Move(axis, layer, dir, speed);
  }

  void show() {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        for (int z = 0; z < size; z++) {
          if (x == 0 || x == size - 1 || y == 0 || y == size - 1 || z == 0 || z == size - 1) {
            pushMatrix();
            if (move != null && move.isRotating(x, y, z)) {
              if (move.axis == 0) {
                rotateX(move.rotation);
              } else if (move.axis == 1) {
                rotateY(move.rotation);
              } else {
                rotateZ(move.rotation);
              }
            }
            float offset = (size - 1) / 2.0;
            translate((x-offset)*s, (y-offset)*s, (z-offset)*s);
            pieces[x][y][z].show(s/2);
            popMatrix();
          }
        }
      }
    }
    if (move != null) {
      // draw black insides of the cube when moving
      fill(0);
      float w = size * s - 0.1;
      float d = s - 0.1;
      float offset = (size - 1) / 2.0;
      for (int i = move.layer - 1; i < move.layer + 2; i++) {
        if (i >= 0 && i < size) {
          pushMatrix();
          float t = (i-offset)*s;
          if (i == move.layer) {
          if (move.axis == 0) {
            rotateX(move.rotation);
            translate(t, 0, 0);
            box(d, w, w);
          } else if (move.axis == 1) {
            rotateY(move.rotation);
            translate(0, t, 0);
            box(w, d, w);
          } else {
            rotateZ(move.rotation);
            translate(0, 0, t);
            box(w, w, d);
          }
          } else {
            if (move.axis == 0) {
              translate(t, 0, 0);
              box(d, w, w);
            } else if (move.axis == 1) {
              translate(0, t, 0);
              box(w, d, w);
            } else {
              translate(0, 0, t);
              box(w, w, d);
            }
          }
          popMatrix();
        }
      }
      move.update();
    }
    if (move != null && move.finished) {
      rotate(move.axis, move.layer, move.dir);
      move = null;
    }
  }
}

class Cube {
  Piece[][][] pieces;
  int size;
  float s = 10;
  Move move = null;

  Cube(int size) {
    this.size = size;
    pieces = new Piece[size][size][size];
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        for (int z = 0; z < size; z++) {
          pieces[x][y][z] = new Piece();
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
          if (dir) { // clockwise
            temp[size-j-1][i] = pieces[layer][i][j];
          } else {
            temp[j][size-i-1] = pieces[layer][i][j];
          }
        } else if (axis == 1) { // y
          if (dir) { // clockwise
            temp[j][size-i-1] = pieces[i][layer][j];
          } else {
            temp[size-j-1][i] = pieces[i][layer][j];
          }
        } else { // z
          if (dir) { // clockwise
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

  void show() {
    for (int x = 0; x < size; x++) {
      for (int y = 0; y < size; y++) {
        for (int z = 0; z < size; z++) {
          pushMatrix();
          if (move != null && move.isRotating(x,y,z)) {
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
    if (move != null) {
      move.update();
    }
    if (move != null && move.finished) {
      rotate(move.axis, move.layer, move.dir);
      move = null;
    }
  }
}

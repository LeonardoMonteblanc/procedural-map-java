class Cell {
  int row;
  int col;
  int terrain;
  
  Cell(int r, int c) {
    row = r;
    col = c;
    terrain = (int)random(0, numTerrains);
  }
  
  void display() {
    switch(terrain) {
      case 0:
        fill(210, 100, 50);
        break;
      case 1:
        fill(210, 100, 100);
        break;
      case 2:
        fill(120, 100, 100);
        break;
      case 3:
        fill(120,100,30);
        break;
      case 4:
        fill(0,30,80);
        break;
      case 5:
        fill(0,0,100);
        break;
      default:
        fill(0,100,100);
        break;
    }
    rect(col*cellsize, row*cellsize, cellsize,cellsize);
  }
}

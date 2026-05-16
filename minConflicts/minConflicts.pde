import java.util.Collections;

int cellsize = 4; // tamanho da celular
int worldWidth;
int worldHeight;
Cell [][] world;
ArrayList<Cell> allCells;

int numTerrains = 6;
ArrayList<Integer>[][] rules;
int iterations = 0;

void setup() {
  size(800, 1000);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  allCells = new ArrayList<Cell>();
  rules = new ArrayList[numTerrains][8];

  worldWidth = width/cellsize;
  worldHeight = height/cellsize;
  world = new Cell[worldHeight][worldWidth];
  for (int t = 0; t < numTerrains; t++) {
    for (int d = 0; d < 8; d++) {
      rules[t][d] = new ArrayList<Integer>();
    }
  }
  for (int r = 0; r < worldHeight; r++) {
    for (int c = 0; c < worldWidth; c++) {
      world[r][c] = new Cell(r, c);
      allCells.add(world[r][c]);
    }
  }
  generateRules(referenceTerrain1);
}

void draw() {
  for (int r = 0; r< worldHeight; r++) {
    for (int c = 0; c < worldWidth; c++) {
      world[r][c].display();
    }
  }
  minConflicts();

  if (keyPressed && key == ' ') {
    setup();
  }
}


void generateRules(int [] [] ref) {
  int[] dr = {-1, -1, -1, 0, 0, 1, 1, 1};
  int[] dc = {-1, 0, 1, -1, 1, -1, 0, 1};
  for (int r =0; r < ref.length; r++) {
    for (int c = 0; c < ref[0].length; c++) {
      int terrain = ref[r][c];
      for (int d = 0; d < 8; d++) {
        int newr = r + dr[d];
        int newc = c + dc[d];

        if (newr >= 0 && newr < ref.length && newc >= 0 && newc <ref[0].length) {
          rules[terrain][d].add(ref[newr][newc]);
        }
      }
    }
  }
}

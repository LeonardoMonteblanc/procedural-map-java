void minConflicts() {
  Collections.shuffle(allCells);
  int totalConflicts = 0;
  ArrayList<Integer> replacements = new ArrayList<Integer>();
  
  for(Cell c : allCells) {
    int conflicts = countConflicts(c, c.terrain);
    if(conflicts > 0) {
      totalConflicts++;
      replacements.clear();
      for(int t = 0; t < numTerrains; t++) {
        int con = countConflicts(c, t);
        if(con <= conflicts || random(100) < 2) {
          replacements.add(t);
        }
      }
      c.terrain = replacements.get((int)random(0, replacements.size()));
    }
  }
  if(totalConflicts > 0) {
    iterations++;
  }
    
}

int countConflicts(Cell c, int t) {
  int conflicts = 0;
   int[] dr = {-1,-1,-1,0,0,1,1,1};
  int[] dc = {-1, 0,1,-1,1,-1,0,1};
  for(int d = 0; d < 8; d++) {
    int newr = (c.row + dr[d] + worldHeight)%worldHeight;
    int newc = (c.col + dc[d] + worldWidth)%worldWidth;
    if(!rules[t][d].contains(world[newr][newc].terrain)) {
      conflicts++;
    }
  }
  return conflicts;
}

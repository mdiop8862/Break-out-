class Monstre {
  // position on screen
  PVector _position;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  PImage spriteMonster;
  PImage[] monsterListe;
  Monstre(int cellX, int cellY) {
    _size = 24;
    _position = new PVector(1, 1);
    _cellX = cellX;
    _cellY = cellY;
  }

  void moveAutomatic(Board board) {

    PVector direction = directionMonster();

    PVector cellCurrent = new PVector (_cellX + direction.x, _cellY + direction.y);
    if (cellCurrent.x>=0 && cellCurrent.x<board._nbCellsX && cellCurrent.y>=0 && cellCurrent.y<board._nbCellsY) {
      if (isValid(board, int(cellCurrent.x), int(cellCurrent.y))) {
        _cellX = int(cellCurrent.x);
        _cellY = int(cellCurrent.y);
        _position = board.getCellCenter(_cellX, _cellY);
      } else {
        PVector newdirection = directionMonster();
        cellCurrent.x =  _cellX + newdirection.x;
        cellCurrent.y =  _cellY + newdirection.y;
        if (cellCurrent.x>=0 && cellCurrent.x<board._nbCellsX && cellCurrent.y>=0 && cellCurrent.y<board._nbCellsY) {
          if (isValid(board, int(cellCurrent.x), int(cellCurrent.y))) {
            _cellX = int(cellCurrent.x);
            _cellY = int(cellCurrent.y);
            _position = board.getCellCenter(_cellX, _cellY);
          }
        }
      }
    }
  }


  PVector directionMonster() {
    PVector upMonster = new PVector(0, 1);
    PVector downMonster = new PVector(0, -1);
    PVector leftMonster = new PVector(-1, 0);
    PVector rightMonster = new PVector(1, 0);
    PVector [] directionListe = { upMonster, downMonster, leftMonster, rightMonster};
    int i = int(random(directionListe.length));
    return directionListe[i];
  }

  void update(Bomb bomb) {
    if (estPositionDestructuble(bomb, 1, 0) && estPositionDestructuble(bomb, 0, 1) && estPositionDestructuble(bomb, -1, 0) && estPositionDestructuble(bomb, 0, -1)) {
      println("A");
      resetPositionOutsideWindow();
    }
  }

  /*
  boolean estPositionDestructuble(Bomb bomb) {
   if (bomb.isExplosed) {
   int distanceX = abs(bomb._cellX - _cellX);
   int distanceY = abs(bomb._cellY - _cellY);
   return bomb._cellX == _cellX && bomb._cellY == _cellY && distanceX <= bomb._explosionRadius && distanceY <= bomb._explosionRadius;
   }
   return false;
   }
   */
  boolean estPositionDestructuble(Bomb bomb, int j, int k) {
    for (int i = 1; i <= bomb._explosionRadius; i++) {
      int cellX = _cellX + i * j;
      int cellY = _cellY + i * k;
      if (_cellX == cellX && _cellY == cellY) {
        println("A");
        return false;
      }
    }
    return true;
  }
  
  void ListeMonster(Board board) {
    monsterListe = new PImage[]{
      board.getsprite(board.atlas2, 0, 3, 24),
      board.getsprite(board.atlas2, 7, 4, 24),
      board.getsprite(board.atlas2, 7, 3, 24),
      board.getsprite(board.atlas2, 0, 4, 24),
    };
  }
  
  void changeSprite() {
    spriteMonster = monsterListe[0];
    if (directionMonster().equals(new PVector(0, -1))) {
      spriteMonster = monsterListe[2];
    } else if (directionMonster().equals(new PVector(-1, 0))) {
      spriteMonster = monsterListe[3];
    } else if (directionMonster().equals(new PVector(1, 0))) {
      spriteMonster = monsterListe[1];
    } else if (directionMonster().equals(new PVector(0, 1))) {
      spriteMonster = monsterListe[0];
    }
  }

  void resetPositionOutsideWindow() {
    _cellX = -100;
    _cellY = -100;
  }

  boolean isValid(Board board, int cellX, int cellY) {
    if (cellX<0 || cellX>=board._nbCellsX || cellY<0 || cellY>=board._nbCellsY) {
      return false;
    }
    return board._cells[cellX][cellY] == TypeCell.EMPTY || isMonsterOccupiedCell(board, cellX, cellY);
  }
  
  boolean isMonsterOccupiedCell(Board board, int cellX, int cellY){
    return board._cells[cellX][cellY] == TypeCell.MONSTER;
  }


  void drawIt(Board board) {
    //PVector monstreSprite = board.getCellCenter(_cellX, _cellY);
    _position = board.getCellCenter(_cellX, _cellY);
          
    changeSprite();
    image(spriteMonster, _position.x + board._drawPosition.x, _position.y + board._drawPosition.y, _size, _size);
  }
  
  void eliminateMonster(int cellX, int cellY){
    if (cellX == _cellX && cellY == _cellY){
      resetPositionOutsideWindow();  
    }
  }
}

class Monster {
  // position on screen
  PVector _position;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  int _initialCellX, _initialCellY;
  PImage spriteMonster;
  PImage[] monsterListe;
  PVector direction;
  boolean _wasHit;
  boolean isAlive;
  PVector lastPosition;
  Monster(int initialCellX, int initialCellY) {
    _size = 24;
    _position = new PVector(1, 1);
    _cellX = initialCellX;
    _cellY = initialCellY;
    _initialCellX = initialCellX;
    _initialCellY = initialCellY;
    _wasHit = false;
    isAlive = true;
    lastPosition = new PVector(_cellX, _cellY);
  }

  void moveAutomatic(Board board, Bomb bomb) {

    direction = directionMonster();
    if (hasBombAdjacent(bomb, int(_cellX), int(_cellY))) {
      PVector bombPosition = new PVector(bomb._cellX, bomb._cellY);
      PVector relativePosition = PVector.sub(bombPosition, new PVector(_cellX, _cellY));
      setDirectionFromRelativePosition(relativePosition);
    }
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
          if (isValid(board, int(cellCurrent.x), int(cellCurrent.y)) && !hasBombAdjacent(bomb, int(cellCurrent.x), int(cellCurrent.y))) {
            _cellX = int(cellCurrent.x);
            _cellY = int(cellCurrent.y);
            _position = board.getCellCenter(_cellX, _cellY);
          }
        }
      }
    }
  }
  
  void reapper(){
    _cellX = _initialCellX;
    _cellY = _initialCellY;
    _wasHit = false;
    isAlive = true;
  }
 
  
  void setDirectionFromRelativePosition(PVector position) {
    if (position.x > 0 ) {
      setDirectionMonster(new PVector(-1, 0));
    } else if (position.x < 0 ) {
      setDirectionMonster(new PVector(1, 0));
    } else if (position.y > 0 ) {
      setDirectionMonster(new PVector(0, -1));
    } else if (position.y < 0 ) {
      setDirectionMonster(new PVector(0, 1));
    }
  }

  void setDirectionMonster(PVector newDirection) {
    direction = newDirection;
  }



  boolean hasBombAtCell(Bomb bomb, int cellX, int cellY) {
    return bomb._cellX == cellX  && bomb._cellY == cellY;
  }

  boolean hasBombAdjacent(Bomb bomb, int cellX, int cellY) {
    return hasBombAtCell(bomb, cellX, cellY + 1)||
      hasBombAtCell(bomb, cellX, cellY - 1)||
      hasBombAtCell(bomb, cellX + 1, cellY)||
      hasBombAtCell(bomb, cellX - 1, cellY);
  }


  boolean eliminateMonster(Bomb bomb) {
    //Distance entre la position de la bombe et celle du monstre
    int distanceX = abs(bomb._cellX - _cellX);
    int distanceY = abs(bomb._cellY - _cellY);

    

    //si le monstre est dans le rayon d'explosion et si elle est dans
    //le meme ligne ou colonne que la bombe au moment de l'explosion
    return bomb.isExplosed && ((distanceX <= bomb._explosionRadius  && _cellY == bomb._cellY) || (distanceY <= bomb._explosionRadius && _cellX == bomb._cellX));
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

  void update() {
    if(_wasHit){
       hero.score += 100;
    }
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

  boolean isMonsterOccupiedCell(Board board, int cellX, int cellY) {
    return board._cells[cellX][cellY] == TypeCell.MONSTER;
  }


  void drawIt(Board board) {
    //PVector monstreSprite = board.getCellCenter(_cellX, _cellY);
    _position = board.getCellCenter(_cellX, _cellY);

    changeSprite();
    image(spriteMonster, _position.x + board._drawPosition.x, _position.y + board._drawPosition.y, _size, _size);
  }
}

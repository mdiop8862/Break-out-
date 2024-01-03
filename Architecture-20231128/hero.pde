class Hero {
  // position on screen
  PVector _position;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  // if hero was hit by a bomb
  boolean _wasHit;

  PImage [] heroListe;
  int to;
  PImage sprite;
  PVector heroDirection;
  Hero() {
    _size = 24;
    _cellX = 1;
    _cellY = 1;
    _position = new PVector(1, 1);
    _wasHit = false;
    heroDirection = new PVector(1, 0);
    to = 0;
  }

  void move(Board board, PVector direction) {
    int cellCurrentX = _cellX + int(direction.x);
    int cellCurrentY = _cellY + int(direction.y);
    if ((isEmpty(board, cellCurrentX, cellCurrentY)) || isHeroOccupiedCell(board, cellCurrentX, cellCurrentY)) {
      _cellX = cellCurrentX;
      _cellY = cellCurrentY;
      heroDirection = direction;
      //Update hero position in the screen
    }
  }

  boolean isEmpty(Board board, int cellX, int cellY) {
    if (cellX<0 || cellX>=board._nbCellsX || cellY<0 || cellY>=board._nbCellsY) {
      return false;
    }
    return board.isEmpty(cellX, cellY);
  }

  boolean isHeroOccupiedCell(Board board, int cellX, int cellY) {
    return isValidCell(cellX, cellY) && board._cells[cellX][cellY] == TypeCell.BOMBERMAN;
  }

  void update(Board board, Bomb bomb) {
    if (eliminateHero(bomb, _cellX, _cellY)) {
      println('A');
      eliminate(bomb);
      //resetPositionOutsideWindow();
    }
  }

  void drawIt(Board board) {
    _position = board.getCellCenter(_cellX, _cellY);
    changeSprite();
    image(sprite, _position.x + board._drawPosition.x, _position.y + board._drawPosition.y, _size, _size);
  }

  void ListeHero(Board board) {
    heroListe = new PImage[]{
      board.getsprite(board.atlas2, 1, 0, 24),
      board.getsprite(board.atlas2, 3, 1, 24),
      board.getsprite(board.atlas2, 4, 0, 24),
      board.getsprite(board.atlas2, 0, 1, 24),
    };
  }

  boolean isInExplosionRange(Bomb bomb, int cellX, int cellY) {
    int distanceX = abs(bomb._cellX - cellX);
    int distanceY = abs(bomb._cellY - cellY);
    return distanceX <= bomb._explosionRadius || distanceY <= bomb._explosionRadius || cellY == bomb._cellY || cellX == bomb._cellX;
  }

  void eliminate(Bomb bomb) {
    //explosionDirection(bomb, 0, 1);
    //explosionDirection(bomb, 1, 0);
    //explosionDirection(bomb, 0, -1);
    //explosionDirection(bomb, -1, 0);
    /*
      eliminateDirection(bomb, 0, 1);
     eliminateDirection(bomb, 1, 0);
     eliminateDirection(bomb, 0, -1);
     eliminateDirection(bomb, -1, 0);
     */
  }
  boolean eliminateHero(Bomb bomb, int cellX, int cellY) {
    int distanceX = abs(bomb._cellX - cellX);
    int distanceY = abs(bomb._cellY - cellY);
    return (distanceX <= bomb._explosionRadius  && cellY == bomb._cellY) || (distanceY <= bomb._explosionRadius && cellX == bomb._cellX) ;
    ///resetPositionOutsideWindow();
  }

  void eliminateDirection(Bomb bomb, int j, int k) {
    for (int i = 1; i <= bomb._explosionRadius; i++) {
      int cellX = bomb._cellX + i * j;
      int cellY = bomb._cellY + i * k;
      //if (isValidCell(cellX, cellY)) {
      eliminateHero(bomb, cellX, cellY);
      //} else {
      //break;
      //}
    }
  }
  boolean isValidCell(int cellX, int cellY) {
    return cellX>=0 && cellX<board._nbCellsX && cellY>=0 && cellY<board._nbCellsY;
  }


  void changeSprite() {
    sprite = heroListe[0];
    if (heroDirection.equals(new PVector(0, -1))) {
      sprite = heroListe[2];
    } else if (heroDirection.equals(new PVector(-1, 0))) {
      sprite = heroListe[3];
    } else if (heroDirection.equals(new PVector(1, 0))) {
      sprite = heroListe[1];
    } else if (heroDirection.equals(new PVector(0, 1))) {
      sprite = heroListe[0];
    }
  }

  void resetPositionOutsideWindow() {
    _cellX = -100;
    _cellY = -100;
  }

  void explosionHero(int cellX, int cellY) {
    if (_cellX == cellX && _cellY == cellY) {
      resetPositionOutsideWindow();
    }
  }
}

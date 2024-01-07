class Hero {
  // position on screen
  PVector _position;
  // position on board
  int _cellX, _cellY;
  // display size
  float _size;
  // if hero was hit by a bomb
  boolean _wasHit;
  int life;
  int score;
  PImage [] heroListe;
  PImage sprite;
  PVector heroDirection;
  int bonuscollectedBomb;
  int bombsCount;
  Hero() {
    _size = 24;
    _cellX = 1;
    _cellY = 1;
    _position = new PVector(1, 1);
    _wasHit = false;
    heroDirection = new PVector(1, 0);
    life = 5;
    score = 0;
    bonuscollectedBomb = 0;
    bombsCount = 1;
  }

  void move(Board board, PVector direction, float lerpFactor) {
    int cellCurrentX = _cellX + int(direction.x);
    int cellCurrentY = _cellY + int(direction.y);


    if ((isEmpty(board, int(cellCurrentX), int(cellCurrentY))) || isHeroOccupiedCell(board, int(cellCurrentX), int(cellCurrentY))) {
      PVector targetPosition = new PVector(cellCurrentX, cellCurrentY);
      PVector currentPosition = new PVector(_cellX, _cellY);
      PVector newPosition = PVector.lerp(currentPosition, targetPosition, lerpFactor);
      _cellX = round(newPosition.x);
      _cellY = round(newPosition.y);
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

  void update(Board board, Monster [] monsters) {
    if (bomb.isExplosed) {
      for (Monster monster : monsters) {
        if (_wasHit || board.monsterMeetHero(this, monster)) {
          life--;
          resetPositionOutsideWindow();

          if (life > 0) {
            reapper();
            for (Monster reappermonster : monsters) {
              reappermonster.reapper();
            }
          } else if (life == 0) {
            noLoop();
          }
        }
      }
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

  void reapper() {
    _cellX = 1;
    _cellY = 1;
    _position = new PVector(1, 1);
    _wasHit = false;
  }
  
  int getBombCountWithBonus(){
  
    return bombsCount + bonuscollectedBomb;
  }


  boolean eliminateHero(Bomb bomb) {
    //Distance entre la position de la bombe et celle du héro
    int distanceX = abs(bomb._cellX - _cellX);
    int distanceY = abs(bomb._cellY - _cellY);
    
    //si le hero est dans le rayon d'explosion et si elle est dans
    //le meme ligne ou colonne que la bombe au moment de l'explosion
    return ((distanceX <= bomb._explosionRadius  && _cellY == bomb._cellY) || (distanceY <= bomb._explosionRadius && _cellX == bomb._cellX));
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
}

class Bomb {
  float _timeToExplode;
  int _cellX, _cellY;
  int _explosionRadius;
  PVector _position;
  boolean isExplosed;
  boolean isPutBomb;
  boolean b;

  int maxBombsCount;

  Bomb(float timeToExplode) {
    _timeToExplode = timeToExplode;
    _explosionRadius = 3;
    _cellX = -100;
    _cellY = -100;
    isExplosed = false;
    isPutBomb = false;

    maxBombsCount = 2;
  }

  void putBomb(Hero hero) {
    _cellX = hero._cellX;
    _cellY = hero._cellY;
    isPutBomb = true;
  }

  void explosionBomb(Board board) {
    //Les cellules qui sont à droite de la Bombe
    explosionDirection(board, 1, 0);

    //Les cellules qui sont à gauche de la Bombe
    explosionDirection(board, -1, 0);

    //Les cellules qui sont en haut de la Bombe
    explosionDirection(board, 0, 1);

    //Les cellules qui sont en bas de la Bombe
    explosionDirection(board, 0, -1);

    // Explosion de la bombe avec une forme de  "+"

    drawExplosion(board, 8, 50, 0);
    drawExplosion(board, 11, -50, 0);
    drawExplosion(board, 10, 0, 50);
    drawExplosion(board, 9, 0, -50);
    //Disparition de la bombe
    //resetPositionOutsideWindow();
  }

  void explosionDirection(Board board, int j, int k) {
    for (int i = 1; i <= _explosionRadius; i++) {
      int cellX = _cellX + i * j;
      int cellY = _cellY + i * k;
      destroyCell(board, cellX, cellY);
    }
  }



  void destroyCell(Board board, int cellX, int cellY) {
    if (cellX >=1 && cellX<board._nbCellsX - 1 && cellY >=1 && cellY<board._nbCellsY - 1) {
      if ( board._cells[cellX][cellY] == TypeCell.DESTRUCTIBLE_WALL) {
        board._cells[cellX][cellY] = TypeCell.EMPTY;
      }
    }
  }

  void update(Board board, Hero hero, Monster [] monsters, Game game) {
    if (!isExplosed && isPutBomb) {
      if (_timeToExplode > 0) {
        _timeToExplode--;
      } else if (_timeToExplode == 0) {
        isExplosed = true;
        explosionBomb(board);
        for (Monster monster : monsters) {
          if (monster.eliminateMonster(bomb)) {
            monster.isAlive = false;
            monster.lastPosition = new PVector(monster._cellX, monster._cellY);
            monster._wasHit = true;
            monster.resetPositionOutsideWindow();
          }
        }

        if (hero.eliminateHero(this)) {
          hero._wasHit = true;
          if (game.heroMeetBonus(hero)) {
            println("Bonnus");
            hero.bonuscollectedBomb++;
          }
        }
        resetPositionOutsideWindow();
      }
    }
  }






  void drawIt(Board board, int i) {
    PVector bombeSprite = board.getCellCenter(_cellX, _cellY);
    PImage sprite = board.spriteListe[i];
    image(sprite, bombeSprite.x + board._drawPosition.x, bombeSprite.y + board._drawPosition.y, 30, 30);
  }

  void drawExplosion(Board board, int i, int widthflamme, int heightflamme) {
    PVector bombeSprite = board.getCellCenter(_cellX, _cellY);
    PVector flammeSprite = new PVector(bombeSprite.x + widthflamme/2, bombeSprite.y + heightflamme/2);
    PImage sprite = board.spriteListe[i];
    image(sprite, flammeSprite.x + board._drawPosition.x, flammeSprite.y + board._drawPosition.y, 50, 50);
  }

  void resetPositionOutsideWindow() {

    _cellX = -100;
    _cellY = -100;
  }
}

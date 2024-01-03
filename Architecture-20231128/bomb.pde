class Bomb {
  float to;
  float _timeToExplode;
  int _cellX, _cellY;
  int _explosionRadius;
  PVector _position;
  boolean isExplosed;

  Bomb() {
    to = millis();
    _timeToExplode = 1000;
    _explosionRadius = 1;
    _cellX = -100;
    _cellY = -100;
    isExplosed = false;
  }

  void putBomb(Hero hero) {
    _cellX = hero._cellX;
    _cellY = hero._cellY;
    to = millis();
    println("pose la bombe en : ", _cellX, " ", _cellY);
  }

  void explosionBomb(Board board, Hero hero) {
    //Les cellules qui sont à droite de la Bombe
    explosionDirection(board, hero, 1, 0);

    //Les cellules qui sont à gauche de la Bombe
    explosionDirection(board, hero, -1, 0);

    //Les cellules qui sont en haut de la Bombe
    explosionDirection(board, hero, 0, 1);

    //Les cellules qui sont en bas de la Bombe
    explosionDirection(board, hero, 0, -1);

    // Explosion de la bombe avec une forme de  "+"
    drawExplosion(board, 8, 50, 0);
    drawExplosion(board, 11, -50, 0);
    drawExplosion(board, 10, 0, 50);
    drawExplosion(board, 9, 0, -50);

    //Disparition de la bombe
    resetPositionOutsideWindow();
  }

  void explosionDirection(Board board, Hero hero, int j, int k) {
    for (int i = 1; i <= _explosionRadius; i++) {
      int cellX = _cellX + i * j;
      int cellY = _cellY + i * k;
      destroyCell(board, hero, cellX, cellY);
      hero.explosionHero(cellX, cellY);
    }
  }
  void a(Hero hero, int j, int k) {
    for (int i = 1; i <= _explosionRadius; i++) {
      int cellX = _cellX + i * j;
      int cellY = _cellY + i * k;
      hero.explosionHero(cellX, cellY);
    }
  }

  void b(Hero hero) {
    a(hero, 1, 0 );
    a(hero, -1, 0);
    a(hero, 0, -1);
    a(hero, 0, 1);
  }

  void destroyCell(Board board, Hero hero, int cellX, int cellY) {
    if (cellX >=1 && cellX<board._nbCellsX - 1 && cellY >=1 && cellY<board._nbCellsY - 1) {
      if (!hero.isEmpty(board, cellX, cellY) && board._cells[cellX][cellY] != TypeCell.EXIT_DOOR) {
        board._cells[cellX][cellY] = TypeCell.EMPTY;
      }
    }
  }

  void update(Board board, Hero hero) {
    if (millis() - to > _timeToExplode) {
      explosionBomb(board, hero);
      //b(hero);
      isExplosed = true;
      to = millis();
    } else {
      isExplosed = false;
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

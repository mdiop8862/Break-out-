class Game
{
  Board _board;
  Hero _hero;
  int bonusIndex;
  String _levelName;
  PImage [] bonusSprite;
  PVector bonusPosition ;
  PVector heroPosition;
  boolean isBonusCollected;
  Game() {
    _board = null;
    _hero = null;
    bonusSprite = new PImage[]{};
    bonusPosition = new PVector(0, 0);
    bonusIndex = int(random(bonusSprite.length));
    isBonusCollected = false;
  }


  void update(Board board, Monster [] monsters) {
    for (Monster monster : monsters) {

      if (monster._wasHit) {
        if (bonusSprite.length == 0 ) {
          bonusSprite = new PImage[] {board.spriteListe[12], board.spriteListe[13]};
        }
        if ( bonusSprite.length >0) {
          drawIt(board, monster);
        }
      }
    }
  }

  boolean heroMeetBonus(Hero hero ) {
    heroPosition = board.getCellCenter(hero._cellX, hero._cellY);
    //bonusPosition = board.getCellCenter(int(monster.lastPosition.x), int(monster.lastPosition.y));
    println("BX :", bonusPosition.x);
    println("BY :", bonusPosition.y);
    println("HX :", heroPosition.x);
    println("HY :", heroPosition.y);

    return heroPosition.x == bonusPosition.x  && heroPosition.y == bonusPosition.y;
  }

  void resetPositionBonus(Hero hero) {
    if (!isBonusCollected && heroMeetBonus(hero)) {
      println("Touché");
      bonusPosition = new PVector(-100, -100);
      //bonusIndex = int(random(bonusSprite.length));
    }
  }


  void drawIt(Board board, Monster monster) {

    PVector size = new PVector(30, 30);
    bonusPosition = board.getCellCenter(int(monster.lastPosition.x), int(monster.lastPosition.y));
    if (bonusIndex < bonusSprite.length) {
      image(bonusSprite[bonusIndex], bonusPosition.x + board._drawPosition.x, bonusPosition.y + board._drawPosition.y, size.x, size.y);
    }
  }

  void handleKey(int k, int kc) {

    if (k=='z' || k=='Z' || kc==UP) {
      hero.move(board, new PVector(0, -1), 0.6);
    } else if (k=='d' || k=='D' || kc==RIGHT) {
      hero.move(board, new PVector(1, 0), 0.5);
    } else if (k=='s' || k=='S' || kc==DOWN) {
      hero.move(board, new PVector(0, 1), 0.5);
    } else if (k=='q' || k=='Q' || kc==LEFT) {
      hero.move(board, new PVector(-1, 0), 0.6);
    } else if (k == ' ') {
      bomb = new Bomb(6);
      bomb.putBomb(hero);
    }
  }
}

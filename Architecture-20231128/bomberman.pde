Game game;
Bomb bomb;
Board board;
Hero hero;
Monstre monstre;
int to = 0;
int bombInterval = 1000;
int i ;
void setup() {
  //fullScreen();
  frameRate(4);
  size(700, 740, P2D);
  game = new Game();
  board=new Board(new PVector(width/7, height/12), new PVector(2*width/3, 4*height/3), 15, 13);
  board.chargerPlateauFichier("levels/level1.txt");
  board.fillList();
  hero = new Hero();
  hero.ListeHero(board);
  monstre = new Monstre(9, 11);
  monstre.ListeMonster(board);
  bomb = new Bomb();
}

void draw() {
  background(255);
  game.update();
  game.drawIt();
  board.drawIt();
  hero.drawIt(board);
  monstre.drawIt(board);
  monstre.moveAutomatic(board);
  //monstre.update(bomb);
  //bomb.explosionBomb(board);

  bomb.drawIt(board, 5);
  //board.savePlateau("nouv_fichier.txt");
  //bomb.drawExplosion(board, 10, 50, 0);
  //hero.eliminate(bomb);

  bomb.update(board, hero);
  //hero.update(board, bomb);
}

void keyPressed() {
  //game.handleKey(key);
  if (key=='z' || key=='Z' || keyCode==UP) {
    hero.move(board, new PVector(0, -1));
    //bomb.putBomb(hero,board);
  } else if (key=='d' || key=='D' || keyCode==RIGHT) {
    hero.move(board, new PVector(1, 0));

    //bomb.putBomb(hero,board);
  } else if (key=='s' || key=='S' || keyCode==DOWN) {
    hero.move(board, new PVector(0, 1));

    //bomb.putBomb(hero,board);
  } else if (key=='q' || key=='Q' || keyCode==LEFT) {
    hero.move(board, new PVector(-1, 0));
    //bomb.putBomb(hero,board);
  } else if (key == ' ') {
    bomb.resetPositionOutsideWindow();
    bomb.putBomb(hero);
  }
}


void mousePressed() {
}

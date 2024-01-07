Game game;
Bomb bomb;
Board board;
Hero hero;
Menu menu;
int to = 0;
int bombInterval;
Rectangle[] items = new Rectangle[5];
Monster [] monsters;
String screen;
boolean displayMenu;
PVector topLeftScore;
PVector sizeScore;
//int score;
//int vie;
PVector textPositionScore;
PVector topLeftVie;
PVector sizeVie;
int scoreVie;
PVector textPositionVie;
boolean isPaused;
void setup() {
  //fullScreen();
  isPaused = false;
  menu  =new Menu();
  displayMenu = false;
  screen = null;
  frameRate(1);
  size(700, 740, P2D);
  game = new Game();
  board=new Board(new PVector(width/7, height/12), new PVector(2*width/3, 4*height/3), 15, 13);
  board.chargerPlateauFichier("levels/level1.txt");
  board.fillList();
  hero = new Hero();
  hero.ListeHero(board);

  monsters = new Monster[3];
  monsters[2] = new Monster(9, 11);
  monsters[1] = new Monster(7, 2);
  monsters[0] = new Monster(11, 6);

  for (Monster monstre : monsters) {
    monstre.ListeMonster(board);
    monstre.update();
  }

  bomb = new Bomb(6);
  //score = 0;
  //vie = 5;
  topLeftScore = new PVector(board._drawPosition.x + width/5, height/20);
  sizeScore = new PVector(width/8, height/25);
  textPositionScore = new PVector(board._drawPosition.x + width/4, height/12);
  topLeftVie = new PVector(board._drawPosition.x + width/20, height/17);
  sizeVie = new PVector(width/40, height/40);
  textPositionVie = new PVector(board._drawPosition.x + width/18, height/12.5);
}

void draw() {
  if (!isPaused) {
    fill(256, 165, 0);
    noStroke();
    rectMode(CORNER);
    rect(board._drawPosition.x + width/50, 0, board._drawSize.x, 2*board._cellSize + width/50);
    rects(topLeftScore, sizeScore, textPositionScore, hero.score);
    rects(topLeftVie, sizeVie, textPositionVie, hero.life);
    background(255);
    board.drawIt();
    hero.drawIt(board);
    bomb.update(board, hero, monsters, game);
    for (int i = 0; i < monsters.length; i++) {
      //game.drawIt(board, monsters[i]);
      monsters[i].drawIt(board);
      monsters[i].moveAutomatic(board, bomb);
      //monsters[i].update();
      //monsters[i].update();
      //game.update(hero, monsters[i]);
      game.update(board, monsters);
    }

    hero.update(board, monsters);


    //monstre.update(bomb);
    //bomb.explosionBomb(board);

    bomb.drawIt(board, 5);
    //
    //bomb.drawExplosion(board, 10, 50, 0);
    //hero.eliminate(bomb);

    //bomb.update(board, hero, monstre);
  }

  if ( displayMenu == true) {
    displayMenu();
    if (screen == "Game") {
      displayRestart();
    } else if ( screen == "Load")) {
      load();
    } else if ( screen == "Score") {
      displayHighScore();
    } else if ( screen )) == "Save") {
      Save();
    }
  }
}



void rects(PVector topleft, PVector size, PVector textPosition, int sv) {
  fill(0);
  rectMode(CORNER);
  rect(topleft.x, topleft.y, size.x, size.y);
  fill(255);
  textSize(20);
  text(sv, textPosition.x, textPosition.y);
}

void keyPressed() {
  game.handleKey(key, keyCode);
  if ( key == ESC ) {
    displayMenu = true;
  }
}

void diplayMenu() {
  items = menu.Game();
}

void Save() {
  board.loadPlateau("nouv_fichier.txt");
}

void load() {
  board.savePlateau("nouv_fichier.txt");
}

void displayRestart() {
  isPaused = !isPaused;
}

void displayHighScore() {
  println("Maxscore");
}
void mousePressed() {
}
}

Game game;
Bomb bomb;
Board board;
Hero hero;
Monstre [] monstres;
int to = 0;
int bombInterval = 1000;
Rectangle[] items = new Rectangle[5] ;
Menu menu ;
String screen ;
boolean displayMenu ;
void setup() {
  menu = new Menu() ;
  displayMenu = false ;
  screen = "null" ;
  //fullScreen();
  frameRate(4);
  size(700, 740, P2D);
  game = new Game();
  board=new Board(new PVector(width/7, height/12), new PVector(2*width/3, 4*height/3), 15, 13);
  board.chargerPlateauFichier("levels/level1.txt");
  board.fillList();
  hero = new Hero();
  hero.ListeHero(board);
  monstres = new Monstre[]{
    new Monstre(9, 11),
    new Monstre(7, 2),
    new Monstre(11, 6)
  };
  for (Monstre monstre : monstres) {
    monstre.ListeMonster(board);
  }
  bomb = new Bomb();
}

void draw() {
  background(255);
  game.update();
  game.drawIt();
  board.drawIt();
  hero.drawIt(board);
  for (Monstre monstre : monstres) {
    monstre.drawIt(board);
    monstre.moveAutomatic(board);
  }

  //monstre.update(bomb);
  //bomb.explosionBomb(board);

  bomb.drawIt(board, 5);
  //board.savePlateau("nouv_fichier.txt");
  //bomb.drawExplosion(board, 10, 50, 0);
  //hero.eliminate(bomb);

  bomb.update(board, hero, monstres);
  //hero.update(board, bomb);

  if ( displayMenu == true ) {
    displayMenu() ;
    if ( screen == "Game" ) {
      displayRestart() ;
    } else if ( screen == "Load" ) {
      load() ;
    } else if ( screen == "Score" ) {
      displayHighScore() ;
    }
    else if( screen == "save" ){
      Save() ;
    }
    
  }
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
  } else if ( key == TAB ) {
    displayMenu = true ;
  }
}

void displayMenu() {
   items =  menu.Game() ;
  
}

void load(){
  println("partie charger") ;
}

void displayRestart() {
  println("partie restaurer") ;
}

void Save() {
  println("partie sauvegarder ") ;
}

void displayHighScore() {
  println(" score afficher ") ;
}

void mousePressed(){
  
    for ( int i=0; i< items.length; i++) {
      if ( mouseX > items[i].vect.x - items[i].widthRect/2 && mouseX  < items[i].vect.x + items[i].widthRect/2
        && mouseY > items[i].vect.y - items[i].heightRect/2 && mouseY < items[i].vect.y + items[i].heightRect/2  ) {

        if ( i== 0) {
          screen = "Game" ;
        } else if ( i == 1) {
          screen = "save" ;
        } else if ( i == 2) {
          screen ="Load" ;
        } else if ( i == 3) {
          screen = "Score" ;
        } else if ( i == 4) {
          exit() ;
        }
      }
    }
  }
  
  
  

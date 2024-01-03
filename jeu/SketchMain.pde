Menu menu ;
Rectangle[][] Mur ;
PImage img ;
Rectangle rect ;
Raquette raquette ;
PVector centerRaq ;
PVector centerBal;
Ballon bal ;
int speedAuto ;
int score ;
String screen  ;
int starttime ;
Rectangle[] tabRectOnMenu = new Rectangle[3] ;
void setup() {

  size(600, 600) ;
  starttime =0;
  img = loadImage("game-5465779_1920.png") ;
  menu = new Menu() ;
  rect = new Rectangle(0, 150, 35, 20) ;
  Mur = rect.BuildMur() ;
  centerRaq = new PVector(width/2, height-60) ;
  centerBal = new PVector(random(1, width), random(1, height/8));
  raquette = new Raquette(centerRaq, 100, 15, color(240, 135, 132) ) ;
  bal = new Ballon (centerBal.x, centerBal.y - raquette.HeightRaq, 20, new PVector(3, 5)) ;
  score = 0;
  speedAuto = 8 ;
  screen = "Main" ;
}

void draw() {
  background(0) ;
  if ( bal.lose() || rect.isnull(Mur)) {
    displayEnd() ;
    if (starttime == 0) {
      starttime = millis();
    }

    // Vérifie si le temps écoulé depuis l'affichage de la fin est supérieur à l'intervalle de retour
    if (millis() - starttime > 1000) {

      // Retourne à la page principale
      screen = "Main" ;

      bal.y = 0 ;
      displayMain() ;
      resetGame() ;

      // Réinitialise startTime pour permettre un nouveau déclenchement
      starttime = 0;
    }
  } else if (screen.equals("Main")) {
    displayMain() ;
  } else if ( screen.equals("Game")) {
    displayGame() ;
  } else if ( screen.equals("Demo")) {
    displayDemo() ;
  } else if ( screen.equals("Exit")) {
    exit() ;
  } else if (screen.equals("Over")) {
    displayEnd() ;
  }
}

void displayMain() {
  menu.AfficheGameName() ;
  tabRectOnMenu = menu.Game() ;

  if (mousePressed) {
    for (int i = 0; i< tabRectOnMenu.length; i++) {
      if ( mouseX > tabRectOnMenu[i].X - tabRectOnMenu[i].widthRect/2 && mouseX  < tabRectOnMenu[i].X + tabRectOnMenu[i].widthRect/2
        && mouseY > tabRectOnMenu[i].Y - tabRectOnMenu[i].heightRect/2 && mouseY < tabRectOnMenu[i].Y + tabRectOnMenu[i].heightRect/2 ) {

        if ( i==0) {
          screen = "Game" ;
        } else if ( i == 1) {
          screen = "Demo" ;
        } else if ( i == 2 ) {
          screen = "Exit" ;
        }
      }
    }
  }
}


void displayGame() {
  noFill() ;
  stroke(255) ;
  rectMode(CENTER) ;
  rect(width/2, 0, 140, 120) ;
  if (score < 10 );
  text("00"+score, (width/2), 30) ;
  rect.DessineMur(Mur) ;
  raquette.DessineRaq() ;
  raquette.moveRaquette() ;
  bal.drawBallon() ;
  bal.moveBallon();
  bal.toucheRaquette(raquette);
  bal.pingpong();
  bal.toucheBriques(Mur);
  rect.EffaceRectangle(Mur) ;
}

void displayEnd() {
  image(img, 0, 0, width, height ) ;
  // background(255,0,0) ;
}

void displayDemo() {
  noFill() ;
  stroke(255) ;
  rectMode(CENTER) ;
  rect(width/2, 0, 140, 120) ;
  if (score < 10 );
  text("00"+score, (width/2), 30) ;
  bal.drawBallon();
  bal.moveBallon();
  bal.toucheRaquette(raquette);
  bal.pingpong();
  bal.toucheBriques(Mur);
  raquette.DessineRaq();
  rect.DessineMur(Mur) ;
  raquette.moveRaquetteAuto(bal, speedAuto) ;
  rect.EffaceRectangle(Mur) ;
}

void resetGame() {
  starttime =0;
  img = loadImage("game-5465779_1920.png") ;
  menu = new Menu() ;
  rect = new Rectangle(0, 150, 35, 20) ;
  Mur = rect.BuildMur() ;
  centerRaq = new PVector(width/2, height-60) ;
  raquette = new Raquette(centerRaq, 100, 15, color(240, 135, 132) ) ;
  bal = new Ballon(centerRaq.x, centerRaq.y - raquette.HeightRaq, 20, new PVector(3, 5)) ;
  score = 0 ;
  speedAuto = 3 ;
  screen = "Main" ;
}

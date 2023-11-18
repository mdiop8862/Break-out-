Menu menu ;
Rectangle[][] Mur ;
Rectangle rect ;
Raquette raquette ;
PVector centerRaq ;
int speedX;
int speedY ;
bal bal ;
int score = 0 ;
void setup() {
  size(600, 900) ;
  menu = new Menu() ;
  rect = new Rectangle(0, 150, 35, 20) ;
  Mur = rect.BuildMur() ;
  centerRaq = new PVector(width/2, height-60) ;
  raquette = new Raquette(centerRaq, 100, 15, color(240, 135, 132) ) ;
  bal = new bal(centerRaq.x, centerRaq.y - raquette.HeightRaq, 20 ) ;
  speedX = 1 ;
  speedY = 3 ;
}

void draw() {
  background(0) ;

  /*  menu.AfficheGameName() ;
   menu.Game() ; */
  noFill() ;
  stroke(255) ;
  rectMode(CENTER) ;
  rect(width/2, 0, 140, 120) ;
  if(score < 10 );
  text("00"+score , (width/2) , 30) ;
  rect.DessineMur(Mur) ;
  raquette.DessineRaq() ;
  raquette.moveRaquette() ;
  bal.dessineBallon() ;
  bal.moveBallon(raquette, Mur) ;
  rect.EffaceRectangle(Mur) ;
}

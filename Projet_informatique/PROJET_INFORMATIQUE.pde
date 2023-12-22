Menu menu;
Ballon bal;
Rectangle rect ;
Rectangle[][] Mur ;
int brickWidth ;
int brickHeight ;
int x_rect ;
int y_rect ;
int score;
Raquette raquette;
void setup() {
  size(700, 700);
  rect = new Rectangle(45, 150, 35, 20) ;
  score=0;
  Mur = rect.BuildMur() ;
  brickWidth = 35 ;
  brickHeight = 20 ;
  bal=new Ballon(15, new PVector(random(0, width), random(height/2, (2*height)/3+150)), color(192, 192, 192), 6, 6);
  raquette=new Raquette(width/8, height/60, new PVector(2*width/3+150, (2*height)/3+150), color(255, 255, 0), 6);
  //menu=new Menu(color(255,0,0),"Break-out",width/2,height/2);
}
void draw() {

  rectMode(CENTER) ;
  rect(width/2, 0, 140, 120) ;
  background(0);
  bal.drawBallon();
  bal.moveBallon();
  bal.pingpong();
  raquette.drawRaquette();
  raquette.moveRaquette();
  bal.pingpongraquette();
  bal.lose();
  rect.DessineMur(Mur) ;
  rect.EffaceRectangle(Mur) ;
  //menu.initialise();

  if (rect.isnull(Mur)) {
    noLoop();
    menu.initialise();
    menu.AfficheGameName();
  }
    menu=new Menu(color(255, 0, 255), "Tu a gagné", width/2, height/2, score);
    menu.rectScore(new PVector(width/8,height/8), new PVector(width/8,height/12),color(255),color(0),width/10,height/8);

}

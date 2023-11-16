Menu menu ;
Rectangle rectMenu ;
Rectangle[][] Mur ;
int brickWidth ;
int brickHeight ;
int x_rect ;
int y_rect ;
void setup() {
  size(600, 800) ;
  rectMenu = new Rectangle(width/2, 170, 200, 30) ;
  Mur = new Rectangle[8][15] ;
  brickWidth = 35 ;
  brickHeight = 20 ;
  menu = new Menu(color(0, 0, 0), "Break Out ", width/2, 100, rectMenu) ;
  menu.initialise() ;
  menu.AfficheGameName() ;
  menu.Game() ;
}

void draw() {
  background(0) ;
  //rect(0, 100, 35, 20) ;
  x_rect = 0 ;
  y_rect = 100 ; 
  int x =0 ;
  color[] tabColor = { color(235,51,36) , color(0,35,245) , color(24,62,12) , color(255,255,255) } ;
  for (int i=0; i < Mur.length; i++) {
    x_rect = 0 ;
    if(x == tabColor.length ){
      x=0 ;
    }
    fill( tabColor[x]) ;
    x++ ;
    
    for (int j=0; j < Mur[i].length; j++) {
      Mur[i][j] = new Rectangle(x_rect, y_rect, brickWidth, brickHeight) ;
      Mur[i][j].DessineRect("CORNER") ;
      x_rect = x_rect + (brickWidth + 5) ;
      if ( j == Mur[i].length - 1) {
        y_rect = y_rect + (brickHeight + 5);
      }
    }
  }
}

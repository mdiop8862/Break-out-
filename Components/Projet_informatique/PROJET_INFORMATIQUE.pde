Ballon ballon;
Rectangle rectMenu ;
Rectangle[][] Mur ;
int brickWidth ;
int brickHeight ;
int x_rect ;
int y_rect ;
Raquette raquette;
void setup(){
  size(600,600);
  
  rectMenu = new Rectangle(width/2, 170, 200, 30) ;
  Mur = new Rectangle[8][15] ;
  brickWidth = 35 ;
  brickHeight = 20 ;
  ballon=new Ballon(20,new PVector(width/2,height/2),color(0,0,255),2,3);
  raquette=new Raquette(width/5,height/60,new PVector(width/2,(79*height)/80),color(0,255,255),3);
 //menu=new Menu(color(255,0,0),"Break-out",width/2,height/2);
  
}
void draw(){
  background(255,255,255);
  ballon.drawBallon();
  ballon.pingpong();
  raquette.drawRaquette();
  raquette.moveRaquette();
  ballon.pingpongraquette();
  ballon.lose();
  //background(0) ;
  //rect(0, 100, 35, 20) ;
  x_rect = 0 ;
  y_rect = 100 ; 
  int x =0 ;
  color[] tabColor = { color(235,51,36) , color(0,35,245) , color(24,62,12) , color(255,145,255) } ;
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

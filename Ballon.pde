class bal {
  float x ;
  float y ;
  int diametre ;
  bal(float x, float y, int diametre ) {
    this.x = x ;
    this.y = y ;
    this.diametre = diametre ;
  }
  
  boolean lose(){
    
    if(this.y > height - 10 ){
       return true ;
    }
    return false ;
  }

  void dessineBallon() {
    fill(53, 128, 187) ;
    ellipse(x, y, diametre, diametre) ;
  }
  void moveBallon(Raquette raquette, Rectangle[][] Mur) {

    this.x=this.x + speedX ;
    this.y=this.y - speedY;

    float BallBottom = this.y+bal.diametre/2;
    float BallTop = this.y-bal.diametre/2;
    float BallRight = this.x+bal.diametre/2;
    float BallLeft = this.x-bal.diametre/2;
    
    // collision avec la requette
    if ( BallRight > raquette.center.x - raquette.WidthRaq / 2 &&
    BallLeft < raquette.center.x + raquette.WidthRaq / 2 &&
    BallBottom > raquette.center.y - raquette.HeightRaq / 2 &&
    BallTop < raquette.center.y + raquette.HeightRaq / 2 ) {

      speedY = -speedY ;
    }

    //collision avec les extremites cote de l'interface
    if (this.y <= 0) {
      speedY = -speedY ;
    }
    if (this.x > width) {
      speedX = -speedX ;
    }
    if (this.x <= 0 ) {
      speedX = -speedX ;
    }

    //collision avec les bricks
    for (int i=0; i< Mur.length; i++) {
      for (int j=0; j < Mur[i].length; j++) {
        float briqueLeft = Mur[i][j].X ;
        float briqueRight = Mur[i][j].X + Mur[i][j].widthRect ;
        float briqueTop = Mur[i][j].Y ;
        float briqueBottom = Mur[i][j].Y + Mur[i][j].heightRect;
        if (BallBottom>briqueTop && BallRight>briqueLeft && briqueBottom> BallTop && briqueRight> BallLeft) {
          speedY = -speedY ;
        }
      }
    }
  }
  
 
}

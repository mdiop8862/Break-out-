class Ballon {
  float x ;
  float y ;
  int diametre ;
  PVector direction;
  Ballon(float x, float y, int diametre, PVector direction) {
    this.x = x ;
    this.y = y ;
    this.diametre = diametre ;
    this.direction = direction;
  }

  boolean lose() {
    return this.y > height - diametre/2  ;
  }

  void drawBallon() {
    fill(53, 128, 187) ;
    ellipse(x, y, diametre, diametre) ;
    noStroke();
  }
  void moveBallon() {

    this.x=this.x + direction.x ;
    this.y=this.y + direction.y;
  }

  void toucheRaquette(Raquette raquette) {
    float BallBottom = this.y + this.diametre/2;
    float BallTop = this.y - this.diametre/2;
    float BallRight = this.x + this.diametre/2;
    float BallLeft = this.x - this.diametre/2;

    // collision avec la requette
    if ( BallRight > raquette.center.x - raquette.WidthRaq / 2 &&
      BallLeft < raquette.center.x + raquette.WidthRaq / 2 &&
      BallBottom > raquette.center.y - raquette.HeightRaq / 2 &&
      BallTop < raquette.center.y + raquette.HeightRaq / 2 ) {

      direction.y = -direction.y ;
    }
  }

  void pingpong() {
    //collision avec les extremites cote de l'interface
    if (this.x > width - diametre/2 || this.x < diametre/2) {
      direction.x = -direction.x ;
    } else if (this.y < diametre/2) {
      direction.y = -direction.y ;
    }
  }

  void toucheBriques(Rectangle[][] Mur) {
    //collision avec les bricks
    float BallBottom = this.y+bal.diametre/2;
    float BallTop = this.y-bal.diametre/2;
    float BallRight = this.x+bal.diametre/2;
    float BallLeft = this.x-bal.diametre/2;
    for (int i=0; i< Mur.length; i++) {
      for (int j=0; j < Mur[i].length; j++) {
        float briqueLeft = Mur[i][j].X ;
        float briqueRight = Mur[i][j].X + Mur[i][j].widthRect ;
        float briqueTop = Mur[i][j].Y ;
        float briqueBottom = Mur[i][j].Y + Mur[i][j].heightRect;
        if (BallBottom>briqueTop && BallRight>briqueLeft && briqueBottom> BallTop && briqueRight> BallLeft) {
          direction.y = -direction.y ;
        }
      }
    }
  }
}

class Rectangle {
  int X ;
  int Y ;
  int widthRect ;
  int heightRect ;
  boolean active ;
  Rectangle(int X, int Y, int widthRect, int heightRect) {
    this.X = X ;
    this.Y = Y ;
    this.widthRect = widthRect ;
    this.heightRect = heightRect ;
    this.active = true ;
  }

  void DessineRect(String Mode ) {
    int modeValue = CORNER ;
    if (Mode.equals("CORNER")) {
      modeValue = CORNER;
    } else if (Mode.equals("CORNERS")) {
      modeValue = CORNERS;
    } else if (Mode.equals("CENTER")) {
      modeValue = CENTER;
    } else if (Mode.equals("RADIUS")) {
      modeValue = RADIUS;
    }

    if (this.active) {

      rectMode(modeValue) ;
      rect(X, Y, widthRect, heightRect) ;
    }
  }

  Rectangle[][] BuildMur() {

    Rectangle[][] Mur = new Rectangle[8][18] ;
    for (int i=0; i < Mur.length; i++) {
      this.X = 0 ;
      for (int j=0; j < Mur[i].length; j++) {
        Mur[i][j] = new Rectangle(this.X, this.Y, this.widthRect, this.heightRect) ;
        this.X = this.X + (this.widthRect + 4) ;
        if ( j == Mur[i].length - 1) {
          this.Y = this.Y + (this.heightRect + 4);
        }
      }
    }
    return Mur ;
  }

  void DessineMur(Rectangle[][] Mur) {
    noStroke() ;
    color[] tabColor = { color(235, 51, 36), color(0, 35, 245), color(24, 62, 12), color(255, 255, 255) } ;
    int x=0 ;
    for (int i=0; i<Mur.length; i++) {
      if ( x==tabColor.length) {
        x=0 ;
      }
      fill(tabColor[x]) ;
      x++ ;

      for (int j=0; j<Mur[i].length; j++) {
        Mur[i][j].DessineRect("CORNER") ;
      }
    }
  }
  
  boolean isnull(Rectangle[][] Mur){
    for (int i=0 ;i<Mur.length;i++){
      for(int j=0;j<Mur[i].length;j++){
        if (Mur[i][j].widthRect != 0 || Mur[i][j].X !=0 || Mur[i][j].Y != 0 ){ 
          return false;
        }
      }
    }
    return true;
  
  }

  void EffaceRectangle(Rectangle[][] Mur) {
    for (int i=0; i< Mur.length; i++) {
      for (int j=0; j < Mur[i].length; j++) {
        float briqueLeft = Mur[i][j].X ;
        float briqueRight = Mur[i][j].X + Mur[i][j].widthRect ;
        float briqueTop = Mur[i][j].Y ;
        float briqueBottom = Mur[i][j].Y + Mur[i][j].heightRect;
        float BallBottom = bal.centerBallon.y+bal.diameter/2;
        float BallTop = bal.centerBallon.y-bal.diameter/2;
        float BallRight = bal.centerBallon.x+bal.diameter/2;
        float BallLeft = bal.centerBallon.x-bal.diameter/2;
        if (BallBottom>briqueTop && BallRight>briqueLeft && briqueBottom> BallTop && briqueRight> BallLeft) {
          score++;
          Mur[i][j].widthRect = 0;
          Mur[i][j].X =0;
          Mur[i][j].Y = 0;
        }
      }
    }
    
  }
}

class Menu {
  color backgroundColor ;
  String Name ;
  int titleX ;
  int titleY ;
  int score;
  //constructeur
  Menu (color backgroundColor, String Name, int titleX, int titleY, int score) {
    this.backgroundColor = backgroundColor ;
    this.Name = Name  ;
    this.titleX = titleX ;
    this.titleY = titleY ;
    this.score = score;
  }

  void initialise() {
    background(this.backgroundColor) ;
  }

  void AfficheGameName() {
    //PFont maPolice = createFont("AlumniSansInlineOne-Italic.ttf" , 32 ) ;
    textSize(100) ;
    //textFont(maPolice) ;
    textAlign(CENTER) ;
    text(this.Name, this.titleX, this.titleY ) ;
  }
  
  void rectScore(PVector center, PVector size,color backgroundScore, color textColor, float scoreX, float scoreY){
    fill(backgroundScore);
    rectMode(CENTER);
    rect(center.x, center.y, size.x, size.y);
    fill(textColor);
    textSize(32);
    text(score,scoreX,scoreY);
  }
}

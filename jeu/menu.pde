class Menu {

  void AfficheGameName() {
    PFont maPolice = createFont("AlumniSansInlineOne-Italic.ttf", 32 ) ;
    String Name = " Break Out " ;
    int titleX = width / 2 ;
    int titleY = 100 ;
    textSize(100) ;
    textFont(maPolice) ;
    textAlign(CENTER) ;
    fill(255) ;
    text(Name, titleX, titleY ) ;
  }

  Rectangle[] Game() {
    Rectangle[] tabRect = new Rectangle[3] ;
    String[] tab = {"Game", "Auto", "Exit"} ;
    rect = new Rectangle(width/2, 170, 200, 30) ;
    for (int i=0; i<3; i++) {
      tabRect[i] = new Rectangle(rect.X, rect.Y, rect.widthRect, rect.heightRect) ;
      fill(255) ;
      rect.DessineRect("CENTER") ;
      fill(0);
      text( tab[i], rect.X, rect.Y+(rect.heightRect)/3 ) ;
      rect.Y = rect.Y + 100 ;
    }
    return tabRect ;
  }
}

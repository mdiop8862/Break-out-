class Button {
  String text;
  PVector topleft;
  PVector size;

  boolean isTriggered() {
    return false;
  }
}

class Menu {

  Rectangle[] Game () {
    Rectangle[] items = new Rectangle[5] ;
    String[] tab = {"restart", "Save", "Load" , "High Scores" , "Exit"} ;
    Rectangle item = new Rectangle( new PVector(width/2, 170), 200, 30 ) ;
    for (int i=0; i< tab.length; i++) {
      items[i] = new Rectangle(new PVector(item.vect.x, item.vect.y) , item.widthRect, item.heightRect) ;
      fill(255) ;
      item.DessineRect("CENTER") ;
      fill(0);
      textAlign(CENTER , CENTER );
      text( tab[i], item.vect.x, item.vect.y  ) ;
      item.vect.y = item.vect.y + 50 ;
    }
    return items ;
  }


void update(Game game) {
}

void handleMouse() {
}
}

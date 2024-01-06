class Rectangle {
  float widthRect ;
  float heightRect ;
  PVector vect ;


  Rectangle(PVector vect , float widthRect, float heightRect) {
    this.widthRect = widthRect ;
    this.heightRect = heightRect ;
    this.vect = vect ;
  }

  void DessineRect(String Mode) {

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
    rectMode(modeValue) ;
    rect(vect.x, vect.y, widthRect, heightRect) ;
  }
}

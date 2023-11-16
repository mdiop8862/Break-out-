class Rectangle {
  int X ;
  int Y ;
  int widthRect ;
  int heightRect ;
  Rectangle(int X, int Y, int widthRect, int heightRect) {
    this.X = X ;
    this.Y = Y ;
    this.widthRect = widthRect ;
    this.heightRect = heightRect ;
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

    rectMode(modeValue) ;
    rect(X, Y, widthRect, heightRect) ;
  }
}

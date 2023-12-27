class Raquette {
  PVector center ;
  int WidthRaq ;
  int HeightRaq ;
  color colRaq ;
  Raquette(PVector center, int WidthRaq, int HeightRaq, color colRaq) {
    this.center = center ;
    this.WidthRaq = WidthRaq ;
    this.HeightRaq = HeightRaq ;
    this.colRaq = colRaq ;
  }

  void DessineRaq() {
    rectMode(CENTER) ;
    fill(this.colRaq) ;
    rect(this.center.x, this.center.y, this.WidthRaq, this.HeightRaq) ;
  }

  void moveRaquette() {
    this.center.x = mouseX  ;
    this.center.x = constrain(this.center.x , raquette.HeightRaq / 2 , width - raquette.HeightRaq /2) ;
  }

  void moveRaquetteAuto(int speedAuto) {
    if (bal.x < this.center.x) {
      this.center.x -= speedAuto;
    } else {
      this.center.x += speedAuto;
    }
    constrain(this.center.x, WidthRaq/2, width-WidthRaq/2);
  }
}

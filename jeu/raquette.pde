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
    noStroke();
  }

  void moveRaquette() {
    this.center.x = mouseX  ;
    this.center.x = constrain(this.center.x, raquette.HeightRaq / 2, width - raquette.HeightRaq /2) ;
  }

  void moveRaquetteAuto(Ballon bal, int speedAuto) {

    //Distance entre le centre de la balle et le centre de la raquette
    float distance = bal.x - center.x;

    if (abs(distance) > 6) {
      //Deplacer la raquette vers la position de la balle
      this.center.x += speedAuto*signe(distance);
      
    } 
    
    //Contraidre la^position de la raquette dans les limites de la fenetre
    this.center.x = constrain(this.center.x, WidthRaq/2, width-WidthRaq/2);
    
  }

  int signe(float i) {
    if (i>0) {
      return 1;
    } else if (i<0) {
      return -1;
    } else {
      return 0;
    }
  }
}

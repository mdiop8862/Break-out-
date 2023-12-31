
class Raquette{
  float widthRaquette;
  float heightRaquette;
  PVector centerRaquette;
  color colorRaquette; 
  float speed;
  
  Raquette(float widthRaquette,float heightRaquette,PVector centerRaquette, color colorRaquette,float speed){
    this.widthRaquette=widthRaquette;
    this.heightRaquette=heightRaquette;
    this.centerRaquette=centerRaquette;
    this.colorRaquette=colorRaquette;
    this.speed=speed;
  }
  
  void drawRaquette(){
    rectMode(CENTER);
    fill(colorRaquette);
    rect(centerRaquette.x,centerRaquette.y,widthRaquette,heightRaquette);
    noStroke();
  }
  
  void moveRaquette(){
    centerRaquette.x+=speed;
    if (centerRaquette.x+widthRaquette/2>width || centerRaquette.x<widthRaquette/2 ){
      speed=-speed-1;  
    }
  }
  
  /*
  void moveRaquette(){
    centerRaquette.x=mouseX;  
  }
  */
}

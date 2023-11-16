
class Ballon {
  float diameter;
  PVector centerBallon; 
  color colorBallon;
  float deplacementx;
  float deplacementy;
  Ballon(float diameter,PVector centerBallon, color colorBallon,float deplacementx,float deplacementy){
    this.diameter=diameter;
    this.centerBallon=centerBallon;
    this.colorBallon=colorBallon;
    this.deplacementx=deplacementx;
    this.deplacementy=deplacementy;

  }
  void drawBallon(){
    fill(colorBallon);
    circle(centerBallon.x,centerBallon.y,diameter);
    centerBallon.x=centerBallon.x+deplacementx;
    centerBallon.y=centerBallon.y+deplacementy;
    noStroke();
    
  }
  void pingpong(){
    if (centerBallon.x>width-diameter/2 || centerBallon.x<diameter/2){
      deplacementx=-deplacementx;
    }
    else if ( centerBallon.y<diameter/2){
      deplacementy=-deplacementy;
    }
  }
  void pingpongraquette(){
    float bottomBallon=centerBallon.y+diameter/2;
    float topBallon=centerBallon.y-diameter/2;
    float rightBallon=centerBallon.x+diameter/2;
    float leftBallon=centerBallon.x-diameter/2;
    float bottomRaquette=raquette.centerRaquette.y+raquette.heightRaquette/2;
    float topRaquette=raquette.centerRaquette.y-raquette.heightRaquette/2;
    float rightRaquette=raquette.centerRaquette.x+raquette.widthRaquette/2;
    float leftRaquette=raquette.centerRaquette.x-raquette.widthRaquette/2;
    
    if (bottomBallon>topRaquette && rightBallon> leftRaquette && bottomRaquette> topBallon && rightRaquette> leftBallon){
      deplacementy=-deplacementy;
     }
    
  }
  void lose(){
    if (centerBallon.y>height-diameter/2){
      noLoop();
    }
  }
  
}

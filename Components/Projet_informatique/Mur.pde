
class Mur{
  float widthMur;
  float heightMur;
  PVector centerMur;
  color colorMur; 
  boolean estsupprime;
  
  Mur(float widthMur,float heightMur,PVector centerMur, color colorMur){
    this.widthMur=widthMur;
    this.heightMur=heightMur;
    this.centerMur=centerMur;
    this.colorMur=colorMur;
    this.estsupprime=false;
  }
  
  void drawMur(){
    rectMode(CENTER);
    fill(colorMur);
    rect(centerMur.x,centerMur.y,widthMur,heightMur);
    noStroke();
  }
  void pingpongmur(){
    float bottomBallon=ballon.centerBallon.y+ballon.diameter/2;
    float topBallon=ballon.centerBallon.y-ballon.diameter/2;
    float rightBallon=ballon.centerBallon.x+ballon.diameter/2;
    float leftBallon=ballon.centerBallon.x-ballon.diameter/2;
    float bottomMur=centerMur.y+heightMur/2;
    float topMur=centerMur.y-heightMur/2;
    float rightMur=centerMur.x+widthMur/2;
    float leftMur=centerMur.x-widthMur/2;
    
    if (bottomBallon>topMur && rightBallon> leftMur && bottomMur> topBallon && rightMur> leftBallon){
      colorMur=color(255,255,255);
      
     }
    
  }
}

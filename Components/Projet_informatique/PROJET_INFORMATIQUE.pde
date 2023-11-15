Ballon ballon;
int nb_murs;
Mur [] mur;
Raquette raquette;

void setup(){
  size(600,600);
  
  nb_murs=14;
  mur=new Mur[nb_murs];
  ballon=new Ballon(20,new PVector(width/2,height/2),color(0,0,255),3,8);
  raquette=new Raquette(width/5,height/60,new PVector(width/2,(79*height)/80),color(0,255,255),3);
  for (int i=0;i<nb_murs;i++){
    mur[i]=new Mur(width/20,height/60,new PVector(random(width/4,width-width/40),random(height/4,height-height/120)),color(random(255),random(255),random(255)));
  } 
  //mur=new Mur(width/20,height/60,new PVector(width/2,height/2),color(0,0,255));
}
void draw(){
  background(255,255,255);
  ballon.drawBallon();
  ballon.pingpong();
  raquette.drawRaquette();
  raquette.moveRaquette();
  ballon.pingpongraquette();
  for (int i=0;i<nb_murs;i++){
    mur[i].drawMur();
    mur[i].pingpongmur();
  }
}
//i*width/nb_murs+width/(2*nb_murs),height/2

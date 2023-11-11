class Raquette{
  float widthRaquete;
  float heightRaquette;
  float centerRaquette;
  color colorRaquette; 
  
  Raquette{
    widthRaquette=width/40;
    heightRaquette=height/100;
    centerRaquette=random(0,100);
    colorRaquette=color(255,140,170);
  }
  
  void create_raquette(){
    rectMode(center);
    rect(widthRaquette,heightRaquette,centerRaquette);
    fill(colorRaquette);
  }
}

class Ballon{
  float diameter;
  PVector centerBallon; 
  
  Ballon{
    diameter=12;
    centerBallon=(random(20,width/20),random(20,height/20);
  }

}

class Mur{
  float widthRaquete;
  float heightRaquette;
  color colorRaquette; 
  
  Raquette{
    widthRaquette=width/60;
    heightRaquette=height/130;
    colorRaquette=color(255,140,170);
  }
}

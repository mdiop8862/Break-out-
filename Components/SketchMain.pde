Menu menu ;

void setup(){
  size(600,600) ;
  menu = new Menu(color(0,0,0) , "Break Out " , width/2 ,100) ;
  menu.initialise() ;
  menu.AfficheGameName() ;
}

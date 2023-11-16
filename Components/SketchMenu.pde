class Menu{
  color backgroundColor ;
  String Name ;
  int titleX ;
  int titleY ;
  Rectangle rect ;
  //constructeur 
  Menu (color backgroundColor , String Name , int titleX , int titleY , Rectangle rect){
    this.backgroundColor = backgroundColor ; 
    this.Name = Name  ;
    this.titleX = titleX ; 
    this.titleY = titleY ;
    this.rect = rect ;
    
  }
  
  void initialise(){
    background(this.backgroundColor) ;
    
  }
  
  void AfficheGameName(){
    PFont maPolice = createFont("AlumniSansInlineOne-Italic.ttf" , 32 ) ;
    textSize(100) ;
    textFont(maPolice) ;
    textAlign(CENTER) ;
    text(this.Name , this.titleX , this.titleY ) ;
  }
  
  void Game(){
     String[] tab = {"Game" , "Auto" , "Exit"} ;
    for(int i=0 ; i<3 ; i++){
      fill(255) ;
      rect.DessineRect("CENTER") ;
      fill(0);
      text( tab[i] , rect.X , rect.Y+(rect.heightRect)/3 ) ;
      rect.Y = rect.Y + 100 ;
      
    }
    
  }
}
